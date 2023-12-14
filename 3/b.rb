require 'byebug'
require_relative "../lib/utils.rb"

def get_answer(puzzle = get_input("3").body)
  # Parse the puzzle into a 2D array
  grid = puzzle.split("\n").map { |row| row.split('') }

  # Initialize the total product, group product and gear found flag
  product = 0
  group_product = 1
  gear_found = false

  # Initialize the counted numbers
  counted = []

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
        if gear_found && !counted.include?(number)
          # Multiply the group product by the number
          group_product *= number.to_i
          # Mark the number as counted
          counted << number
        end

        neighbors.each do |x, y|
          # If the neighbor is a gear symbol
          if x.between?(0, grid.size-1) && y.between?(0, row.size-1) && grid[x][y] == '*'
            # Set gear found flag to true
            gear_found = true
            break
          end
        end
      if cell == '.' || i == grid.size-1 && j == row.size-1
        if gear_found
          # Add the group product to the total product
          product += group_product
          # Reset the group product and the gear found flag
          group_product = 1
          gear_found = false
        end
        # Reset the counted numbers
        counted = []
      end
    end
  end

  # Return the total product
  product
end

puts get_answer()
