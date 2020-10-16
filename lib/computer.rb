class Computer
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def board_keys
    @board.cells.keys
  end
  
end
