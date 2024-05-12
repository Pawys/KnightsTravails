require_relative 'square'


class Board
  attr_accessor :squares

  def initialize(starting_square_position, destination_square_position)
    @squares = []
    create_board()
    @starting_square = get_starting_square(starting_square_position)
    @destination_square_position = destination_square_position
  end

  def create_board()

    8.times do |x|
      8.times do |y|
        @squares << Square.new([x,y])
      end
    end

    @squares.each do |square|
      @squares.each do |possible_square|
        next if square == possible_square
        square.possible_moves.each do |possible_move|
          if possible_move == possible_square.position
            square.possible_squares.push(possible_square)
          end
        end
      end
    end
  end

  def get_starting_square(starting_square_position)
    squares.each do |square|
      return square if square.position == starting_square_position
    end
  end

  def find_shortest_path(all_paths = [[@starting_square]], current_path = all_paths[0])
    # return shortest path
    if current_path[-1].possible_moves.include?(@destination_square_position)
      return current_path.push(@destination_square_position)
    end
    current_path[-1].possible_squares.each do |possible_move|
      # create all the new potential paths 
      all_paths.push(current_path.dup.push(possible_move))
    end
    all_paths.shift()
    find_shortest_path(all_paths,all_paths[0])
  end

  def find_shortest_path_itaretive()
    all_paths = [[@starting_square]]
    all_paths.each do |current_path|
      return current_path.push(@destination_square_position) if current_path[-1].possible_moves.include?(@destination_square_position)
      correct_path = current_path
      current_path[-1].possible_squares.each do |possible_move|
        all_paths.push(current_path.dup.push(possible_move))
      end
    end
  end
end
