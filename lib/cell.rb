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
    if @container.size == 0
      true
    else
      false
    end
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
    if has_ship == true && empty? == false
      "S"
    elsif empty? == true && fired_upon? == false
      "."
    elsif empty? == true && fired_upon? == true
      "M"
   elsif ship.sunk? == true
     "X"
   elsif empty? == false && fired_upon? == true # && ship.sunk? == false
     "H"
   else
     "."
   end
  end

end
