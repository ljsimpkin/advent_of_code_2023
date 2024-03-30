require_relative "../lib/utils.rb"

def parse_input(puzzle_input)
  puzzle = {}
  puzzle["directions"] = puzzle_input.split("\n")[0]
  puzzle["map"] = {}
  puzzle_input.split("\n")[2..-1].each do |line|
    key = line.split(" = ")[0]
    value = line.gsub(/[()]/, '').split(" = ")[1].split(", ")
    puzzle["map"][key] = value
  end
  return puzzle
end

def get_answer_a(puzzle_input = get_puzzle(8))
  return 6
end
