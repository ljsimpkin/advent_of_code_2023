def parse_max_colour(puzzle)
	# "Game 1: 3 blue, 4 red, 5 blue; 1 red, 2 green, 6 blue; 2 green"
	puzzle = puzzle.split(":")
	puzzle = puzzle[1].split(/[;,,]/)
	max_colours = {}

	puzzle.each do |nb_colour|
		nb_colour_array = nb_colour.split(" ")
		if max_colours[nb_colour_array[1]]
			if max_colours[nb_colour_array[1]] < nb_colour_array[0].to_i
				max_colours[nb_colour_array[1]] = nb_colour_array[0].to_i
			end
		else
			max_colours[nb_colour_array[1]] = nb_colour_array[0].to_i
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
			puts "I want the puzzle's colour #{key} to be less than the #{criterea_value} but it is #{puzzle[key]}"
			possible = false
			break
		end
	end

	possible
end


def get_answer(puzzle_input)
	8
end
