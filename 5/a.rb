require_relative "../lib/utils.rb"
require 'byebug'

def parse_puzzle(puzzle_input)
  lines = puzzle_input.split("\n")
  hash = {}
  key = nil

  lines.each do |line|
    if line.include?('seeds:')
      key, values = line.split(':')
      hash[key] = values.split.map(&:to_i)
    elsif line.include?(':')
      key = line.split(' ').first
      hash[key] = []
    elsif line =~ /\d/
      hash[key].push(line.split.map(&:to_i))
    end
  end

  hash
end

def is_in_range(mapping, number)
  mapping[1] <= number && number < (mapping[1] + mapping[2])
end

def translate_number(mappings, number)
  destination = number

  mappings.each do |mapping|
    if is_in_range(mapping, number)
      destination = number - mapping[1] + mapping[0]
      break;
    end
  end

  destination
end

def seed_to_location(mappings, seed_number)
  location = seed_number

  mappings.each do |mapping|
    if mapping[0] != "seeds"
      location = translate_number(mapping[1], location)
    end
  end
  location
end

def get_answer_a(puzzle_input = get_puzzle(5))
  puzzle = parse_puzzle(puzzle_input)
  locations = []

  puzzle["seeds"].each do |seed|
    locations.push(seed_to_location(puzzle, seed))
  end

  locations.min
end

# print get_answer_a()