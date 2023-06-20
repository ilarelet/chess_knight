class Step 
    attr_accessor :cell, :children 
    def initialize(cell, piece)
        @cell = cell
        @children = piece.make_move(@cell)
    end
end

class Tree
    attr_accessor :root, :tree
    def initialize(start_cell)
        @tree = []
        @root = build_tree(start_cell)
    end

    def search(arr)
        
    end