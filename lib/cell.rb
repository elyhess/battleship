class Cell

  attr_reader :coordinate, :container

  def initialize(coordinate)
    @coordinate = coordinate
    @container = []
    @has_been_hit = false
  end

  def ship
    @container.first if empty? == false
  end

  def empty?
    @container.size == 0
  end

  def place_ship(ship)
    @container << ship
  end

  def fired_upon?
    @has_been_hit
  end

  def fire_upon
    @has_been_hit = true
    if empty? == false
      ship.hit
    end
  end

  def render(has_ship = false)
    if empty? == false
      if ship.sunk? == true
        "X"
      elsif fired_upon? == true
        "H"
      elsif has_ship == true
        "S"
      else
        "."
      end
    else
      if fired_upon? == true
        "M"
      else
        "."
      end
    end
  end

end
