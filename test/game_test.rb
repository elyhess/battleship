require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/game'

class GameTest < Minitest::Test

  def test_it_exists_and_has_players
    game = Game.new

    assert_instance_of Game, game
    assert_instance_of Player, game.player
    assert_instance_of Computer, game.computer
  end

  def test_it_has_main_menu
    game = Game.new

    assert_equal true, "QP".include?(game.main_menu)
  end

end
