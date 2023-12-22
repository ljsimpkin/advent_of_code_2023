require_relative "a.rb"

puzzle_demo = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"

def calc_score(card)
  # {"41 48 83 86 17"=>"83 86  6 31 17  9 48 53"}
  # expect 4

  score = 0
  card.values[0].split().each do |value|
    if card.keys[0].split().include? value
      score = score + 1
    end
  end

  score
end

def get_card_duplicates(puzzle_input)
  total = []
  puzzle = parse_puzzle(puzzle_input)
  puzzle.keys.each do |card|
    total.push([calc_score(puzzle[card]),1])
  end
  total
end

# print get_test(puzzle_demo)

def get_answer_b(puzzle_input = get_puzzle(4))
  duplicate_counts = get_card_duplicates(puzzle_input)
  # print duplicate_counts.inspect

  duplicate_counts.each_with_index do |pair, index|
    # puts "pair #{pair} index #{index} duplicate_counts #{duplicate_counts[index]}"
    duplicate_count = duplicate_counts[index][0]
    index_add = 1

    while duplicate_count > 0 && (index_add + index) < duplicate_counts.length()
      duplicate_counts[index_add + index][1] = duplicate_counts[index_add + index][1] + pair[1]
      duplicate_count = duplicate_count - 1
      index_add = index_add + 1
    end
  end

  total = 0
  duplicate_counts.each do |pair|
    total = total + pair[1]
  end

  total
end

print "\n\nanswer b = \n\n  #{get_answer_b()} \n\n"