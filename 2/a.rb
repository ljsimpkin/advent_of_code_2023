require_relative "../lib/utils.rb"

def sum_set(set)
	# set = "3 blue, 4 red, 5 blue"
	sum_set = {}

	set.split(",").each do |nb_colour|
		nb_colour_array = nb_colour.split(" ")
		if sum_set[nb_colour_array[1]]
			sum_set[nb_colour_array[1]] += nb_colour_array[0].to_i
		else
			sum_set[nb_colour_array[1]] = nb_colour_array[0].to_i
		end
	end
	sum_set	
end

def parse_max_colour(puzzle)
	# "Game 1: 3 blue, 4 red, 5 blue; 1 red, 2 green, 6 blue; 2 green"
	max_colours = {}
	summed_sets = []
	puzzle = puzzle.split(":")
	sets = puzzle[1].split(";")

	# add the id to max_colours
	max_colours["id"] = puzzle[0].split(" ")[1].to_i

	# summate each sets common colours
	sets.each do |set|
		summed_sets.push(sum_set(set))
	end

	summed_sets.each do |set|
		set.each do |colour, number|
			if max_colours[colour]
				if max_colours[colour] < number.to_i
					max_colours[colour] = number.to_i
				end
			else
				max_colours[colour] = number.to_i
			end
		end
	end

	max_colours
end

# Parse a string of puzzles, each on different rows
def parse_puzzles(puzzles)
	puzzles_array = puzzles.split("\n")
	max_puzzle_array = []
	puzzles_array.each do |puzzle|
		max_puzzle_array.push(parse_max_colour(puzzle))
	end
	max_puzzle_array
end

# returns true if puzzle meets criterea
def is_possible(puzzle, criterea)
	# puzzle = {"blue" => 6, "red" => 4, "green" => 2}
    # criterea = {"red" => 12, "green" => 13, "blue" => 14}

	possible = true

	criterea.each do |key, criterea_value|
		if puzzle[key] > criterea_value
			# puts "I want the puzzle's colour #{key} to be less than the #{criterea_value} but it is #{puzzle[key]}"
			possible = false
			break
		end
	end

	possible
end


def get_answer(puzzle_input = get_input("2").body)
	criterea = {"red" => 12, "green" => 13, "blue" => 14}

	max_puzzle_array = parse_puzzles(puzzle_input)

	count = 0
	max_puzzle_array.each do |puzzle|
		if is_possible(puzzle, criterea)
			count += puzzle["id"]
		end
	end
	count
end

puts get_answer