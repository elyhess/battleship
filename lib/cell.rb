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

end
