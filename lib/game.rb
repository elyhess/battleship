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
    computer.place_cruiser
    computer.place_submarine
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts player.board.render
    player.place_cruiser
    puts player.board.render(true)
    player.place_submarine
    puts player.board.render(true)
  end

  


end
