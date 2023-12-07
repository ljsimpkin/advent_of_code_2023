def get_answer(puzzle)
  rows = puzzle.split("\n")
  sum = 0

  rows.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      next if char == '.'

      # Check the characters around the current character
      (-1..1).each do |d|
        ni, nj = (i + d) % rows.size, (j + d) % row.size

        # Add the number to the sum if it's a number
        sum += rows[ni][nj].to_i if rows[ni][nj] =~ /\d/
      end
    end
  end

  sum
end
