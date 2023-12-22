require_relative "../lib/utils.rb"

def parse_puzzle(puzzle_input)
  result = {}
  puzzle_input.split("\n").each do |line|
    card_name, numbers = line.split(": ")
    card_name.gsub!(" ", "_")
    set1, set2 = numbers.split(" | ")
    result[card_name] = {set1 => set2}
  end
  result
end

def calc_score(card)
  # {"41 48 83 86 17"=>"83 86  6 31 17  9 48 53"}
  # expect 8

  score = 0
  card.values[0].split().each do |value|
    if card.keys[0].split().include? value
      if score == 0
        score = 1
      else
        score = score * 2
      end
    end
  end

  score
end

def get_answer(puzzle_input = get_puzzle(4))
  total = 0
  puzzle = parse_puzzle(puzzle_input)
  puzzle.keys.each do |card|
    total = total + calc_score(puzzle[card])
  end
  total
end

# print "\n\nanswer = \n\n  #{get_answer()} \n\n"