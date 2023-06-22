require_relative 'tree.rb'

class Knight
    attr_reader :location, :next_locations
    def initialize(cell)
        @location = [cell[0],cell[1]]
        #after creating the piece we immediately scan for the possible next steps
        self.possible_moves
    end
    
    #method to update the location (and possibel next steps) of the piece
    def move(cell_to)
        @location = [cell_to[0],cell_to[1]]
        self.possible_moves
    end

    #the method that prints the path from one cell to another
    def find_path(start, goal)
        #A tree of possible moves from the start cell is created
        tree = Tree.new(start, self)
        #The .search method creates an array of cells - the path
        path = tree.search(goal)
        puts "You can get to that cell in #{path.length - 1} moves!"
        puts "Here is your path!"
        path.each {|cell| p cell}
    end

    private
    #metod defining where a Knight can move
    def possible_moves(cell = @location)
        @next_locations = []
        #Each possible next step is checked for fitting the board
        try_move_to([cell[0]+2,cell[1]+1])
        try_move_to([cell[0]+2,cell[1]-1])
        try_move_to([cell[0]-2,cell[1]+1])
        try_move_to([cell[0]-2,cell[1]-1])
        try_move_to([cell[0]+1,cell[1]+2])
        try_move_to([cell[0]+1,cell[1]-2])
        try_move_to([cell[0]-1,cell[1]+2])
        try_move_to([cell[0]-1,cell[1]-2])
    end

    #a method that checks if a given possible next step is allowed(fits the board) and adds it to the array if it is
    def try_move_to(cell)
        if cell[0] > 0 and cell[0] <= 8 and cell[1] > 0 and cell[1] <= 8
            @next_locations.append cell
        end
    end
end