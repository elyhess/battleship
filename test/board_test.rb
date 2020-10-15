require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists_and_has_16_cells
    board = Board.new

    assert_instance_of Board, board
    assert_instance_of Hash, board.cells
    assert_equal 16, board.cells.size
    assert_instance_of Cell, board.cells.values.first
  end

  def test_it_can_validate_coords
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_can_validate_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_return_letters
    board = Board.new

    assert_equal [65, 66, 67], board.letters(["A2", "B3", "C4"])
    assert_equal [66, 67, 65], board.letters(["B2", "C3", "A4"])
    assert_equal [50, 67, 65], board.letters(["22", "C3", "A4"])
  end

  def test_it_can_return_numbers
    board = Board.new

    assert_equal [1, 2, 3], board.numbers(["A1", "A2", "A3"])
    assert_equal [1, 5, 3], board.numbers(["A1", "A5", "A3"])
    assert_equal [4, 1, 3], board.numbers(["A4", "B1", "A3"])
  end

  def test_are_numbers_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    assert_equal false, board.nums_consecutive?(cruiser, ["B3", "A2", "A3"])
    assert_equal true, board.nums_consecutive?(submarine, ["A3", "A4"])
    assert_equal false, board.nums_consecutive?(cruiser, ["A4", "A3", "A2"])
  end

  def test_letters_are_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.letters_consecutive?(cruiser, ["B3", "B2", "C3"])
    assert_equal true, board.letters_consecutive?(submarine, ["A3", "B4"])
    assert_equal false, board.letters_consecutive?(submarine, ["C4", "A3"])
    assert_equal false, board.letters_consecutive?(cruiser, ["C4", "B3", "A2"])
    assert_equal true, board.letters_consecutive?(cruiser, ["A1", "B2", "C3"])
  end

  def test_horizontal_check
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.horizontal_check(cruiser, ["B3", "B2", "C3"])
    assert_equal true, board.horizontal_check(submarine, ["A3", "A4"])
    assert_equal false, board.horizontal_check(submarine, ["C4", "A3"])
    assert_equal false, board.horizontal_check(cruiser, ["C4", "B3", "A2"])
    assert_equal true, board.horizontal_check(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.horizontal_check(cruiser, ["C1", "C2", "C3"])
  end

  def test_vertical_check
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.vertical_check(cruiser, ["A1", "B1", "C1"])
    assert_equal false, board.vertical_check(cruiser, ["A1", "A2", "A3"])
    assert_equal false, board.vertical_check(submarine, ["C4", "A3"])
    assert_equal false, board.vertical_check(cruiser, ["C1", "B2", "A3"])
    assert_equal false, board.vertical_check(cruiser, ["C3", "B3", "A3"])
    assert_equal true, board.vertical_check(cruiser, ["A3", "B3", "C3"])
  end

  def test_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_ship_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal cell_3.ship, cell_2.ship
  end

end
