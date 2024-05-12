require_relative 'lib/board'


def find_shortest_path(starting_square_position,destination_square_position)
  board = Board.new(starting_square_position,destination_square_position)
  shortest_path = board.find_shortest_path()
  puts "You made it in #{shortest_path.length - 1} moves!  Here's your path:"
  shortest_path.each do |v|
    if v.instance_of? Array
      p v
      return
    end
    p v.position
  end
end

find_shortest_path([0,0],[7,7])
