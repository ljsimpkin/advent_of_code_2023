require_relative "a.rb"

def get_answer_b(puzzle_input = get_puzzle(6))
  puzzle = parse_puzzle(puzzle_input)
  puzzle.map { |h| number_of_ways_you_can_win(h["Time"], h["Distance"]) }
end

puzzle = "Time:        53837288
Distance:   333163512891532"

print get_answer_b(puzzle)