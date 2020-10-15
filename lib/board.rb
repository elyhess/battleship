class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def letters(coordinates)
    letters = []
    coordinates.each do |coord|
      letters << coord[0]
    end
    letters
    position = []
    letters.each do |letter|
      position << letter.ord
    end
    position
  end

  def numbers(coordinates)
    numbers = []
    coordinates.each do |coord|
      numbers << coord[1].to_i
    end
    numbers
  end

  def nums_consecutive?(ship, coordinates)
    numbers(coordinates).each_cons(numbers(coordinates).count).all? do |num1, num2, num3 = nil|
      if ship.length == 2
        num2 == num1 + 1
      elsif ship.length == 3
        num2 == num1 + 1  && num3 == num2 + 1
      end
    end
  end

  def valid_coordinate?(coordinate)
    coordinate_position = @cells.keys
    coordinate_position.include?(coordinate)
  end
end
