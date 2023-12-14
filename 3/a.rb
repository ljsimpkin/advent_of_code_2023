require 'byebug'

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
        # Initialize the number
        number = cell
        # Check the left neighbor
        k = j - 1
        while k >= 0 && row[k] =~ /\d/
          # If the neighbor is a number, prepend it to the current number
          number = row[k] + number
          k -= 1
        end

        # Check the right neighbor
        k = j + 1
        while k < row.size && row[k] =~ /\d/
          # If the neighbor is a number, append it to the current number
          number += row[k]
          k += 1
        end
        # Check the 8 neighbors
        neighbors = [
          [i-1, j-1], [i-1, j], [i-1, j+1],
          [i, j-1],               [i, j+1],
          [i+1, j-1], [i+1, j], [i+1, j+1]
        ]
        neighbors.each do |x, y|
          # If the neighbor is a symbol, add the number to the sum
          if x.between?(0, grid.size-1) && y.between?(0, row.size-1) && grid[x][y] =~ /[^.\d]/
            sum += number.to_i
            byebug
            break
          end
        end
      end
    end
  end

  # Return the sum
  sum
end
