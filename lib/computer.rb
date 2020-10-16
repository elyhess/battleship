class Computer
  attr_reader :board

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
  end

  def board_keys
    @board.cells.keys
  end

  def valid_coordinates
    counter = 0
    coordinates = []
    letters = ["A", "B", "C", "D"]
    numbers = ["1", "2", "3", "4"]

    until board.valid_placement?(@cruiser, coordinates) == true
      coordinates = []
      @cruiser.length.times do
      counter += 1
      coordinates  << letters.shuffle.first + numbers.shuffle.first
      end
    end
    coordinates
  end

  def place_ship(coordinates)
    coordinates.each do |coordinate|
      @board.cells[coordinate].place_ship(@cruiser)
    end
  end

end
