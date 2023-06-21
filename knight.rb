class Knight
    attr_reader :location, :next_locations
    def initialize(cell)
        @location = [cell[0],cell[1]]
        self.possible_moves
    end
    
    def move(cell_to)
        @location = [cell_to[0],cell_to[1]]
        self.possible_moves
    end

    private

    def possible_moves(cell = @location)
        @next_locations = []
        try_move_to([cell[0]+2,cell[1]+1])
        try_move_to([cell[0]+2,cell[1]-1])
        try_move_to([cell[0]-2,cell[1]+1])
        try_move_to([cell[0]-2,cell[1]-1])
        try_move_to([cell[0]+1,cell[1]+2])
        try_move_to([cell[0]+1,cell[1]-2])
        try_move_to([cell[0]-1,cell[1]+2])
        try_move_to([cell[0]-1,cell[1]-2])
    end

    def try_move_to(cell)
        if cell[0] > 0 and cell[0] <= 8 and cell[1] > 0 and cell[1] <= 8
            @next_locations.append cell
        end
    end
end