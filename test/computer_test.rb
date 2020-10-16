require 'minitest/autorun'
require 'minitest/pride'
require '../lib/ship'
require '../lib/cell'
require '../lib/board'
require '../lib/computer'


class ComputerTest < Minitest::Test

  def test_it_exists_and_has_a_board_and_coordinates
    karen = Computer.new

    assert_instance_of Computer, karen
    assert_instance_of Board, karen.board
    assert_equal "A1", karen.board_keys.first
    assert_equal "D4", karen.board_keys.last
  end

  def test_computer_places_valid_ship_at_random
    karen = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    saved_coordinates = karen.valid_coordinates

    assert_equal true, karen.board.cells[saved_coordinates.last].empty?

    karen.place_ship(saved_coordinates)

    assert_equal false, karen.board.cells[saved_coordinates.last].empty?
  end

end
