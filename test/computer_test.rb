require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'


class ComputerTest < Minitest::Test

  def test_it_exists_and_has_a_board_and_coordinates
    karen = Computer.new

    assert_instance_of Computer, karen
    assert_instance_of Board, karen.board
    assert_equal "A1", karen.board_keys.first
    assert_equal "D4", karen.board_keys.last
  end

  def test_computer_places_valid_cruiser_at_random
    karen = Computer.new
    saved_coordinates = karen.valid_cruiser_coordinates

    assert_equal true, karen.board.cells[saved_coordinates.last].empty?

    karen.place_cruiser(saved_coordinates)

    assert_equal false, karen.board.cells[saved_coordinates.last].empty?
  end

  def test_computer_places_valid_submarine_at_random
    karen = Computer.new
    saved_coordinates = karen.valid_submarine_coordinates

    assert_equal true, karen.board.cells[saved_coordinates.last].empty?

    karen.place_submarine(saved_coordinates)

    assert_equal false, karen.board.cells[saved_coordinates.last].empty?
  end

  def test_computer_can_fire_at_random
    karen = Computer.new
    save_coordinate = karen.validate_fire

    assert_equal true, karen.board.cells[save_coordinate].fired_upon?

    karen.fire(save_coordinate)

    assert_equal false, karen.board.cells[save_coordinate].fired_upon?
  end

end
