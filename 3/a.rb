def get_answer(puzzle)
  sum = 0
  rows = puzzle.split("\n")
  rows.each_with_index do |row, i|
    row.chars.each_with_index do |char, j|
      if char =~ /\d/ && adjacent_to_symbol?(rows, i, j)
        sum += char.to_i
      end
    end
  end
  sum
end

def adjacent_to_symbol?(rows, i, j)
  [-1, 0, 1].product([-1, 0, 1]).any? do |di, dj|
    next if di == 0 && dj == 0
    ni, nj = i + di, j + dj
    next if ni < 0 || nj < 0 || ni >= rows.size || nj >= rows.first.size
    rows[ni][nj] =~ /[^.\d]/
  end
end
