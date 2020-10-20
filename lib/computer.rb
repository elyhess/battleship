class Computer
  attr_reader :board, :submarine, :cruiser

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @letters = ["A", "B", "C", "D"]
    @numbers = ["1", "2", "3", "4"]
  end

  def valid_cruiser_coordinates
    coordinates = []
    until board.valid_placement?(@cruiser, coordinates) == true
      coordinates = []
      @cruiser.length.times do
      coordinates  << @letters.shuffle.first + @numbers.shuffle.first
      end
    end
    coordinates
  end

  def valid_submarine_coordinates
    coordinates = []
    until board.valid_placement?(@submarine, coordinates) == true
      coordinates = []
      @submarine.length.times do
      coordinates  << @letters.shuffle.first + @numbers.shuffle.first
      end
    end
    coordinates
  end

  def place_cruiser
    coordinates = valid_cruiser_coordinates
    coordinates.each do |coordinate|
      @board.cells[coordinate].place_ship(@cruiser)
    end
    coordinates
  end

  def place_submarine
    coordinates = valid_submarine_coordinates
    coordinates.each do |coordinate|
      @board.cells[coordinate].place_ship(@submarine)
    end
    coordinates
  end

  def validate_fire(target)
    coordinate = ''
    coordinate += @letters.shuffle.first + @numbers.shuffle.first
    until target.board.cells[coordinate].fired_upon? == false
      coordinate = ''
      coordinate += @letters.shuffle.first + @numbers.shuffle.first
    end
    coordinate
  end

  def fire_upon(target)
     coordinate = validate_fire(target)
     target.board.cells[coordinate].fire_upon
     coordinate
  end

end






#
