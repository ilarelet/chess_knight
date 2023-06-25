require_relative '../lib/knight.rb'
require_relative '../lib/board.rb'

describe Knight do
    describe "#find_path" do
        it "path between same cell equals 0" do
            board = Board.new
            knight1 = Knight.new(board)
            expect(knight1.find_path([3,3],[3,3])).to eql(0)
        end

        
        it "path between cells in a one-move distance equals 1" do
            board = Board.new
            knight1 = Knight.new(board)
            expect(knight1.find_path([3,3],[2,1])).to eql(1)
        end
    end
end