require_relative 'tree.rb'
require_relative 'board.rb'
require_relative 'knight.rb'

board = Board.new
knight1 = Knight.new(board)
knight1.find_path([3,3],[4,3])