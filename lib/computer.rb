class Computer
  attr_reader :board

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @letters = ["A", "B", "C", "D"]
    @numbers = ["1", "2", "3", "4"]
  end

  def board_keys
    @board.cells.keys
  end

  def valid_cruiser_coordinates
    counter = 0
    coordinates = []

    until board.valid_placement?(@cruiser, coordinates) == true
      coordinates = []
      @cruiser.length.times do
      counter += 1
      coordinates  << @letters.shuffle.first + @numbers.shuffle.first
      end
    end
    coordinates
  end

  def valid_submarine_coordinates
    counter = 0
    coordinates = []

    until board.valid_placement?(@submarine, coordinates) == true
      coordinates = []
      @submarine.length.times do
      counter += 1
      coordinates  << @letters.shuffle.first + @numbers.shuffle.first
      end
    end
    coordinates
  end

  def place_cruiser(coordinates)
    coordinates.each do |coordinate|
      @board.cells[coordinate].place_ship(@cruiser)
    end
  end

  def place_submarine(coordinates)
    coordinates.each do |coordinate|
      @board.cells[coordinate].place_ship(@submarine)
    end
  end

end
