
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
end

def get_answer(puzzle)
  13
end
