require_relative 'a'

puzzle_demo = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"

RSpec.describe 'parse_puzzle' do
  it 'converts puzzle into hash' do
    #  Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
    # {Card_1 => {"41 48 83 86 17" => "83 86 6 31 17 9 48 53"}, {Card_2 => {"13 32 20 16 61" => "61 30 68 82 17 32 24 19"}}
    input = "Card 1: 41 48 83 86 17 | 83 86 6 31 17 9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19"
    expected = {"Card_1" => {"41 48 83 86 17" => "83 86 6 31 17 9 48 53"}, "Card_2" => {"13 32 20 16 61" => "61 30 68 82 17 32 24 19"}}
    
    input_2 = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
    expected_2 = {"Card_1" => {"41 48 83 86 17" => "83 86  6 31 17  9 48 53"}}

    expect(parse_puzzle(input)).to eq(expected)
    expect(parse_puzzle(input_2)).to eq(expected_2)
  end
end

RSpec.describe 'calc_score' do
  puzzle = {"Card_1"=>{"41 48 83 86 17"=>"83 86  6 31 17  9 48 53"}, "Card_2"=>{"13 32 20 16 61"=>"61 30 68 82 17 32 24 19"}, "Card_3"=>{" 1 21 53 59 44"=>"69 82 63 72 16 21 14  1"}, "Card_4"=>{"41 92 73 84 69"=>"59 84 76 51 58  5 54 83"}, "Card_5"=>{"87 83 26 28 32"=>"88 30 70 12 93 22 82 36"}, "Card_6"=>{"31 18 13 56 72"=>"74 77 10 23 35 67 36 11"}}
  it 'calculates a cards score' do
    expect(calc_score(puzzle["Card_1"])).to eq(8)
    expect(calc_score(puzzle["Card_2"])).to eq(2)
    expect(calc_score(puzzle["Card_3"])).to eq(2)
    expect(calc_score(puzzle["Card_4"])).to eq(1)
    expect(calc_score(puzzle["Card_5"])).to eq(0)
    expect(calc_score(puzzle["Card_6"])).to eq(0)
  end
end

RSpec.describe 'get_answer' do
  it 'returns the answer' do
    expect(get_answer(puzzle_demo)).to eq(13)
  end
end