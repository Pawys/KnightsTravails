class Square
  attr_accessor :possible_moves, :possible_squares, :position

  def initialize(position)
    @position = position
    @possible_moves = []
    @possible_squares = []
    add_possible_moves()
  end

  def add_possible_moves()
    [-1, 1].each do |i|
      [-2, 2].each do |j|
        new_position = [@position[0] + i, @position[1] + j]
        @possible_moves.push(new_position) if vaild_move?(new_position)
        new_position = [@position[0] + j, @position[1] + i]
        @possible_moves.push(new_position) if vaild_move?(new_position)
      end
    end
  end

  def vaild_move?(position)
    position.all?{|coordinate| coordinate.between?(0,7)}
  end

  def to_s
    p position
  end
end
