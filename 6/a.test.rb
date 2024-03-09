require_relative 'a'

puzzle_demo = "Time:      7  15   30
Distance:  9  40  200"

RSpec.describe 'parse_puzzle' do
  it 'parses the puzzle input' do
    parsed_puzzle = parse_puzzle(puzzle_demo)

    expect(parsed_puzzle[0]["Time"]).to eq(7)
    expect(parsed_puzzle[2]["Distance"]).to eq(200)
  end
end

RSpec.describe 'get_answer' do
  xit 'returns the answer' do
    expect(get_answer_a(puzzle_demo)).to eq(288)
  end
end
