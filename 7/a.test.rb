require_relative 'a'

puzzle_demo = "32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483"

# FIVE_OF_A_KIND = 7
# FOUR_OF_A_KIND = 6
# FULL_HOUSE = 5
# THREE_OF_A_KIND = 4
# TWO_PAIR = 3
# ONE_PAIR = 2
# HIGH_CARD = 1

RSpec.describe 'parse_puzzle' do
  it 'parses the puzzle' do
    parsed_puzzle = parse_puzzle(puzzle_demo)
    expect(parsed_puzzle[0][0]).to eq('32T3K')
  end
end

RSpec.describe 'get_hand_ranking' do
  it 'returns the answer' do
    expect(get_hand_ranking('QQQJA')).to eq(THREE_OF_A_KIND)
    expect(get_hand_ranking('KTJJT')).to eq(TWO_PAIR)
    expect(get_hand_ranking('T56J2')).to eq(HIGH_CARD)
  end
end

RSpec.describe 'compare_hands' do
  it 'returns true if hand1 is better than hand2 otherwise false' do
    expect(compare_hands('QQQJA', 'T55J4')).to eq(true)
    expect(compare_hands('KK677', 'KKQQQ')).to eq(false)
    expect(compare_hands('T55J5', 'QQQJA')).to eq(false)
    expect(compare_hands('KK677', 'KTJJT')).to eq(true)
  end
end

# 32T3K 765
# T55J5 684
# KK677 28
# KTJJT 220
# QQQJA 483

RSpec.describe 'sort_hands' do
  it 'sort the puzzle input' do
    parsed_puzzle = parse_puzzle(puzzle_demo)
    sorted_puzzle = sort_hands(parsed_puzzle)
    expect(sorted_puzzle[0][0]).to eq("32T3K")
    expect(sorted_puzzle[1][0]).to eq("KTJJT")
    expect(sorted_puzzle[2][0]).to eq("KK677")
    expect(sorted_puzzle[3][0]).to eq("T55J5")
    expect(sorted_puzzle[4][0]).to eq("QQQJA")
  end
end

RSpec.describe 'get_answer' do
  it 'returns the answer' do
    expect(get_answer_a(puzzle_demo)).to eq(6440)
  end
end
