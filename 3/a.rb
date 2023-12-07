def get_answer(puzzle)
  rows = puzzle.split("\n")
  sum = 0

  rows.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      next if char == '.'

      # Check the characters around the current character
      [-1, 0, 1].each do |di|
        [-1, 0, 1].each do |dj|
          next if di == 0 && dj == 0
          ni, nj = i + di, j + dj

          # Check if the new indices are within the bounds of the puzzle
          next if ni < 0 || ni >= rows.size || nj < 0 || nj >= row.size

          # Add the number to the sum if it's a number
          sum += rows[ni][nj].to_i if rows[ni][nj] =~ /\d/
        end
      end
    end
  end

  sum
end
