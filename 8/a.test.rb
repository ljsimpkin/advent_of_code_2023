require_relative 'a'

puzzle_1 = "LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)"

puzzle_2 = "RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)"

RSpec.describe 'parse_input' do
  it 'parses input' do
    puzzle = parse_input(puzzle_2)
    expect(puzzle["directions"]).to eq("RL")
    expect(puzzle["map"]["AAA"]).to eq(["BBB", "CCC"])
  end
end

RSpec.describe 'get_answer' do
  it 'returns the answer' do
    expect(get_answer_a(puzzle_1)).to eq(6)
  end

  it 'returns the answer 2' do
    expect(get_answer_a(puzzle_2)).to eq(2)
  end
end
