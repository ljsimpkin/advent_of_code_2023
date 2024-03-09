require_relative "../lib/utils.rb"
require 'byebug'

def parse_puzzle(puzzle_input)
  parsed_puzzle = {}
  puzzle_input.split("\n").map do |line|
    parsed_puzzle[line.split(":")[0]] = line.split(":")[1].split(" ").map(&:to_i)
  end

  puzzle = []
  parsed_puzzle["Time"].each_with_index do |time, index|
    puzzle.push({ "Time" => time, "Distance" => parsed_puzzle["Distance"][index] })
  end

  puzzle
end

def get_answer_a(puzzle_input = get_puzzle(6))
end
