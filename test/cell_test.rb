require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists_and_has_attribute
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
    assert_equal "B4", cell.coordinate
    assert_equal [], cell.container
  end

  def test_it_can_place_ship
    cell = Cell.new("B4")

    assert_nil cell.ship
    assert cell.empty?

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_instance_of Ship, cell.ship
    assert_equal false, cell.empty?
  end

  def test_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    refute cell.fired_upon?

    cell.fire_upon

    assert_equal true, cell.fired_upon?
    assert_equal 2, cell.ship.health
  end

  def test_if_no_ship_it_misses
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end









end
