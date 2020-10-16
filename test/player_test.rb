require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists_and_has_a_board
    jerry = Player.new

    assert_instance_of Player, jerry
    assert_instance_of Board, jerry.board
  end

end
