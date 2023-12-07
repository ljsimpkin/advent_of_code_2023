def get_answer(puzzle)
  # Parse the puzzle into a 2D array
  grid = puzzle.split("\n").map { |row| row.split('') }

  # Initialize the sum
  sum = 0

  # Iterate over each cell in the grid
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      # If the cell is a number
      if cell =~ /\d/
        # Check the 8 neighbors
        neighbors = [
          [i-1, j-1], [i-1, j], [i-1, j+1],
          [i, j-1],               [i, j+1],
          [i+1, j-1], [i+1, j], [i+1, j+1]
        ]
        neighbors.each do |x, y|
          # If the neighbor is a symbol, add the number to the sum
          if x.between?(0, grid.size-1) && y.between?(0, row.size-1) && grid[x][y] =~ /[^.\d]/
            sum += cell.to_i
            break
          end
        end
      end
    end
  end

  # Return the sum
  sum
end
