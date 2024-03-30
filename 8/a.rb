require_relative "../lib/utils.rb"

LEFT = 0
RIGHT = 1

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

puzzle_2 = "RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)"

def get_answer_a(puzzle_input = get_puzzle(8))
  puzzle = parse_input(puzzle_input)
  # byebug
  first_map = puzzle["map"].first

  key = first_map[0]
  count = 0
  
  puzzle["directions"].split("").each do |direction|
    if key == "ZZZ"
      return count
    end

    # puzzle_2 = "RL

    # AAA = (BBB, CCC)
    # BBB = (DDD, EEE)
    # CCC = (ZZZ, GGG)
    # DDD = (DDD, DDD)
    # EEE = (EEE, EEE)
    # GGG = (GGG, GGG)
    # ZZZ = (ZZZ, ZZZ)"

    if direction == "L" && count == 0
      key = first_map[1][LEFT]
    elsif direction == "R" && count == 0
      key = first_map[1][RIGHT]
    end

    if direction == "L" && count != 0
      key = puzzle["map"][key][LEFT]
    elsif direction == "R" && count != 0
      key = puzzle["map"][key][RIGHT]
    end
    
    count += 1
  end


  return count
end
