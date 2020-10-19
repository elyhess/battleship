class Game
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    player_input = gets.chomp.upcase
    until player_input == "P" || player_input == "Q"
      puts "Please enter a valid command."
      player_input = gets.chomp.upcase
    end

    if player_input == "P"
      setup_ships
    elsif player_input == "Q"
      puts "Goodbye."
    end
    player_input
  end

  def setup_ships
    @computer.place_cruiser
    @computer.place_submarine
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player.board.render
    @player.place_cruiser
    puts @player.board.render(true)
    @player.place_submarine
    play
  end

  def play
    until (@player.cruiser.sunk? && @player.submarine.sunk?) || (@computer.cruiser.sunk? && @computer.submarine.sunk?)
      puts "=============COMPUTER BOARD============="
      puts @computer.board.render
      puts "==============PLAYER BOARD=============="
      puts @player.board.render(true)
      player_turn = @player.fire_upon(@computer)
      computer_turn = @computer.fire_upon(@player)

      if @computer.board.cells[player_turn].render == "M"
        puts "Your shot on #{player_turn} was a miss"
      elsif @computer.board.cells[player_turn].render == "X"
        puts "You sunk my #{@computer.board.cells[player_turn].ship.name}"
      elsif @computer.board.cells[player_turn].render == "H"
        puts "Your shot on #{player_turn} was a hit"
      end

      if @player.board.cells[computer_turn].render == "M"
        puts "My shot on #{computer_turn} was a miss"
      elsif @player.board.cells[computer_turn].render == "X"
        puts "I sunk your #{@player.board.cells[computer_turn].ship.name}"
      elsif @player.board.cells[computer_turn].render == "H"
        puts "My shot on #{computer_turn} was a hit"
      end
    end
    winner_loser
  end

  def winner_loser
    if @player.cruiser.sunk? && @player.submarine.sunk?
      puts "I won!"
    elsif @computer.cruiser.sunk? && @computer.submarine.sunk?
      puts "You won!"
    end
    @player = Player.new
    @computer = Computer.new
    main_menu
  end

end
