class Cell

  attr_reader :coordinate, :container

  def initialize(coordinate)
    @coordinate = coordinate
    @container = []
    @has_been_hit = false
  end

  def ship
    @container.first
  end

  def empty?
    @container.empty?
  end

  def place_ship(ship)
    @container << ship
  end

  def fired_upon?
    @has_been_hit
  end

  def fire_upon
    ship.hit
    @has_been_hit = true
  end

  def render(has_ship = false)
    # if has_ship == true && empty? == false
    #   "S"
    # end
    if ship.sunk?
      "X"
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false
      "H"
    elsif fired_upon? == false
      "."
    end
  end

end
