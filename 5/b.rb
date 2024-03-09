require_relative "a.rb"

def get_seeds(seed_map)
  all_seeds = []

  seed_map.each_with_index do |seed, index|
    if index.even?
      all_seeds.push(seed)
      # byebug
      (1..(seed_map[index + 1] - 1)).each do |i|
        all_seeds.push(seed + i)
      end
    end
  end

  all_seeds
end

def get_answer_b(puzzle_input = get_puzzle(5))
  puzzle = parse_puzzle(puzzle_input)
  locations = []

  all_seeds = get_seeds(puzzle["seeds"])

  all_seeds.each do |seed|
    locations.push(seed_to_location(puzzle, seed))
  end

  locations.min
end

print get_answer_b