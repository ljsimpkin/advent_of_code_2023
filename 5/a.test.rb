require_relative 'a'

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

RSpec.describe 'parse_puzzle' do
  it 'returns the parsed puzzle input' do
    parsed_puzzle = parse_puzzle(puzzle_demo)
    
    print ("\n\nparsed puzzle:\n")
    puts (parsed_puzzle)
    print ("\n\n")

    expect(parsed_puzzle["seeds"]).to eq([79, 14, 55, 13])
    expect(parsed_puzzle["water-to-light"]).to eq([[88, 18, 7], [18, 25, 70]])
  end
end

RSpec.describe 'is_in_range' do
  xit 'given a single mapping, returns true if number is in range' do
    # e.g. (50 98 2) and 99 equals true
    expect(get_answer_a(puzzle_demo)).to eq(true)
  end
end

RSpec.describe 'translate_number' do
  xit 'returns the translated number' do
    expect(get_answer_a(puzzle_demo)).to eq(true)
  end
end

RSpec.describe 'get_answer' do
  xit 'returns the answer' do
    expect(get_answer_a(puzzle_demo)).to eq(true)
  end
end
