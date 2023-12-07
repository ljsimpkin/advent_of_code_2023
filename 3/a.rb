def get_answer(puzzle)
  rows = puzzle.split("\n")
  sum = 0

  rows.each_with_index do |row, row_index|
    row.chars.each_with_index do |char, col_index|
      next if char == '.'

      # Check the characters around the current character
      (-1..1).each do |d|
        new_row_index, new_col_index = (row_index + d) % rows.size, (col_index + d) % row.size

        # Add the number to the sum if it's a number
        sum += rows[new_row_index][new_col_index].to_i if rows[new_row_index][new_col_index] =~ /\d/
      end
    end
  end

  sum
end
