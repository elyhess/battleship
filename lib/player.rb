class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end
  
  def validate_cruiser_placement
    puts "Enter the squares for the Cruiser (3 spaces):"
    player_input = gets.chomp.upcase.split(" ").to_a
    until board.valid_placement?(@cruiser, player_input)
      puts "Those are invalid coordinates. Please try again:" unless board.valid_placement?(@cruiser, player_input)
      puts "Enter the squares for the Cruiser (3 spaces):"
      player_input = gets.chomp.upcase.split(" ").to_a
    end
    print "You have placed your Cruiser on #{player_input}.\n"
    player_input
  end

  def validate_submarine_placement
    puts "Enter the squares for the Submarine (2 spaces):"
    player_input = gets.chomp.upcase.split(" ").to_a
    until board.valid_placement?(@submarine, player_input)
      puts "Those are invalid coordinates. Please try again:" unless board.valid_placement?(@cruiser, player_input)
      puts "Enter the squares for the Submarine (2 spaces):"
      player_input = gets.chomp.upcase.split(" ").to_a
    end
    print "You have placed your Submarine on #{player_input}.\n"
    player_input
  end

  def place_cruiser
    coords = validate_cruiser_placement
    coords.each do |coord|
      board.cells[coord].place_ship(@cruiser)
    end
  end

  def place_submarine
    coords = validate_submarine_placement
    coords.each do |coord|
      board.cells[coord].place_ship(@submarine)
    end
  end

  def validate_firing_coords(target)
    puts "Enter the coordinate for your shot:"
    player_input = gets.chomp.upcase
    until target.board.valid_coordinate?(player_input)
      puts "Please enter a valid coordinate:"
      player_input = gets.chomp.upcase
    end
    player_input
  end

  def fire_upon(target)
    coord = validate_firing_coords(target)
    target.board.cells[coord].fire_upon
    coord
  end

end
