require_relative "b.rb"

puzzle_demo = "seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4"

RSpec.describe 'get_aseeds' do
  it 'returns the seedsr' do
    seeds = [2, 4, 8, 2]
    expect(get_seeds(seeds)).to eq([2,3,4,5,8,9])
  end
end

RSpec.describe 'get_answer_b' do
  it 'returns the answer' do
    expect(get_answer_b(puzzle_demo)).to eq(46)
  end
end