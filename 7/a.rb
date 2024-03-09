require_relative "../lib/utils.rb"

FIVE_OF_A_KIND = 7
FOUR_OF_A_KIND = 6
FULL_HOUSE = 5
THREE_OF_A_KIND = 4
TWO_PAIR = 3
ONE_PAIR = 2
HIGH_CARD = 1

def get_hand_ranking(hand)
  counts = hand.chars.group_by(&:itself).transform_values(&:count)
  case counts.values.sort
  when [1, 4] then FOUR_OF_A_KIND
  when [2, 3] then FULL_HOUSE
  when [1, 1, 3] then THREE_OF_A_KIND
  when [1, 2, 2] then TWO_PAIR
  when [2, 3] then ONE_PAIR
  else HIGH_CARD
  end
end

def get_answer_a(puzzle_input = get_puzzle(7))
  6440
end
