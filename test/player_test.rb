require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists_and_has_a_board_and_coordinates
    jerry = Player.new

    assert_instance_of Player, jerry
    assert_instance_of Board, jerry.board
    assert_equal "A1", jerry.board_keys.first
    assert_equal "D4", jerry.board_keys.last
  end

  def test_it_can_validate_player_input_for_ship_placement
    jerry = Player.new
    puts "ONLY validate_player_input tests"
    coords_for_cruiser = jerry.validate_cruiser_placement
    coords_for_submarine = jerry.validate_submarine_placement
    puts "END OF validate_player_input tests"
    #Running already functioning valid_placement function with Player's validate_placement
    assert_equal true, jerry.board.valid_placement?(jerry.cruiser, coords_for_cruiser)
    assert_equal true, jerry.board.valid_placement?(jerry.submarine, coords_for_submarine)
  end

  def test_it_can_place_player_ship
    jerry = Player.new
    puts "ONLY place_ship tests"
    coords_for_cruiser = jerry.place_cruiser
    coords_for_submarine = jerry.place_submarine
    puts "END OF place_ship tests"
    coord_cruiser1 = coords_for_cruiser[0]
    coord_cruiser2 = coords_for_cruiser[1]
    coord_cruiser3 = coords_for_cruiser[2]
    coord_submarine1 = coords_for_submarine[0]
    coord_submarine2 = coords_for_submarine[1]

    assert_equal false, jerry.board.cells[coord_cruiser1].empty?
    assert_equal false, jerry.board.cells[coord_cruiser2].empty?
    assert_equal false, jerry.board.cells[coord_cruiser3].empty?
    assert_equal false, jerry.board.cells[coord_submarine1].empty?
    assert_equal false, jerry.board.cells[coord_submarine2].empty?
  end

end
