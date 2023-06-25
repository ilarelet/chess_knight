class Step 
    attr_accessor :cell, :children, :prev_step
    #class Step defines a cell and all possible next steps for a given piece, as well as a previous step (if given)
    def initialize(cell, piece, prev_step = nil)
        @cell = cell
        #method piece.move creates an array of next_locations for a given piece
        piece.move(cell)
        @children = piece.next_locations
        @prev_step = prev_step
    end
end

class Tree
    attr_accessor :root, :queue, :piece
    #The tree ovject defines all possible future moves that a given piece could do
    #... if it started from a given start_cell
    def initialize(start_cell, piece)
        @queue = []
        @piece = piece
        @root = Step.new(start_cell, piece)
    end

    def search(search, start = @root)
        #If the piece is already in a searched cell - stop the search
        return [start.cell] if search == start.cell
        # To start the search all children of the start cell are put in a queue
        start.children.each do |child| 
            @queue.append Step.new(child, @piece, start)
        end
        #We make a BFS search of the tree of the possible moves
        while queue[0]
            checking = queue[0]
            #We compare the cell with what we are searching for
            if checking.cell == search
                #If we found the cell we were searching for - return the array of the moves that lead us there
                return self.restore_prev_steps(checking)
            end
            #if there's no match add the currently checked cell's children to the queue
            checking.children.each do |child| 
                @queue.append Step.new(child, @piece, checking)
            end
            #...and go to the next cell in queue
            @queue.shift
        end    
    end

    #This method creates an array of cells a piece needs to step on to get to the searched cell 
    def restore_prev_steps(step)
        #The path ends with the searched location
        path = [step.cell]
        current = step
        while current.prev_step
            path.unshift current.prev_step.cell
            current = current.prev_step
        end
        path
    end
end