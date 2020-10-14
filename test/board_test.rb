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


end
