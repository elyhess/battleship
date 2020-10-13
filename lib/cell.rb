class Cell

  attr_reader :coordinate, :container

  def initialize(coordinate)
    @coordinate = coordinate
    @container = []
  end

  def ship
    @container.first
  end

  def empty?
    @container.empty?
  end

end
