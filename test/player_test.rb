require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists_and_has_a_board_and_ships
    jerry = Player.new

    assert_instance_of Player, jerry
    assert_instance_of Board, jerry.board
    assert_instance_of Ship, jerry.cruiser
    assert_instance_of Ship, jerry.submarine
  end

end
