def get_answer(puzzle)
  puzzle.split("\n").each do |line|
    line.each_char do |char|
      puts char unless char == "\n"
    end
  end
end
