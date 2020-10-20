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

end
