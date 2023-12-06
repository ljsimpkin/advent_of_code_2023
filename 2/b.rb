require_relative "a.rb"
require "byebug"

def get_answer_2(puzzle_input = get_input("2").body)

	max_puzzle_array = parse_puzzles(puzzle_input)

	count = 0
	max_puzzle_array.each do |puzzle|
        power = 1
        puzzle.each do |colour, number|
            if colour != "id"
                power *= number
            end
        end
        count += power
	end
	count
end

puts get_answer_2