class Board
    attr_reader :cells
    def initialize
        @cells = Array.new(8) {Array.new(8)}
    end

    def display (knight_location = nil)
        @cells.each_with_index do |row, row_id|
            row.each_with_index do |cell, cell_id| 
                unless knight_location == [row_id,cell_id] 
                    print '# '
                else
                    print '0 '
                end
            end
            puts
        end
    end 
end