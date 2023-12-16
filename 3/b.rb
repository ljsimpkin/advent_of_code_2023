require 'byebug'
require_relative "../lib/utils.rb"

def multiply_and_sum(hash)
  result = 0

  hash.each do |key, values|
    if values.length == 2
      # Convert the array of strings to integers, then multiply and sum
      result += values.map(&:to_i).reduce(:*)
    end
  end

  result
end

def get_answer(puzzle = get_input("3").body)
  # Parse the puzzle into a 2D array
  grid = puzzle.split("\n").map { |row| row.split('') }

  # Initialize the sum
  sum = 0

  # Initialize the counted numbers
  counted = []

  # Initialize the counted numbers {[i,j] => [x,y,z]}
  gear_number_neighbors = {}

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
          # If the neighbor is a * and the number has not been counted
          if x.between?(0, grid.size-1) && y.between?(0, row.size-1) && grid[x][y] == '*' && !counted.include?(number)
            # Add the number to the hash {[i,j] => [x,y,z]}
            if gear_number_neighbors["#{x}#{y}"]
              gear_number_neighbors["#{x}#{y}"].push(number)
            else
              gear_number_neighbors["#{x}#{y}"] = [number]
            end
            sum += number.to_i
            # Mark the number as counted
            counted << number
            break
          end
        end
      elsif cell =~ /[^.\d]/
        # Reset the counted numbers
        counted = []
      end
    end
  end

  # Return the sum of multiples
  # puts gear_number_neighbors.inspect
  multiply_and_sum(gear_number_neighbors)
end

puts get_answer()