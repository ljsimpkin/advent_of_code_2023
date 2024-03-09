require_relative "../lib/utils.rb"

FIVE_OF_A_KIND = 7
FOUR_OF_A_KIND = 6
FULL_HOUSE = 5
THREE_OF_A_KIND = 4
TWO_PAIR = 3
ONE_PAIR = 2
HIGH_CARD = 1

def parse_puzzle(puzzle_input)
  puzzle_input.split("\n").map { |line| line.split(' ') }
end

def get_card_strength(card)
  case card
  when 'T' then 10
  when 'J' then 11
  when 'Q' then 12
  when 'K' then 13
  when 'A' then 14
  else card.to_i
  end
end

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

# Compares two poker hands and determines the winner.
#
# @param hand1 [String] The first poker hand.
# @param hand2 [String] The second poker hand.
# @return [Boolean] Returns true if hand1 wins, false if hand2 wins, and nil if it's a tie.
def compare_hands(hand1, hand2)
  ranking1 = get_hand_ranking(hand1)
  ranking2 = get_hand_ranking(hand2)

  # If the hand rankings are different, the hand with the higher ranking wins.
  return ranking1 > ranking2 if ranking1 != ranking2

  # If the hand rankings are the same, compare the card strengths.
  strength1 = hand1.chars.map { |card| get_card_strength(card) }.sort.reverse
  strength2 = hand2.chars.map { |card| get_card_strength(card) }.sort.reverse

  # Compare the card strengths from highest to lowest.
  strength1.each_with_index do |card1, i|
    card2 = strength2[i]
    return true if card1 > card2
    return false if card1 < card2
  end

  # If all card strengths are equal, it's a tie.
  nil
end

def sort_hands(hands)
  hands.sort do |hand1, hand2|
    compare_hands(hand1[0], hand2[0]) ? 1 : -1
  end
end

def get_answer_a(puzzle_input = get_puzzle(7))
  
end
