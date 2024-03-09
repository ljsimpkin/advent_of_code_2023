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
    
    # print ("\n\nparsed puzzle:\n")
    # puts (parsed_puzzle)
    # print ("\n\n")

    expect(parsed_puzzle["seeds"]).to eq([79, 14, 55, 13])
    expect(parsed_puzzle["water-to-light"]).to eq([[88, 18, 7], [18, 25, 70]])
  end
end

RSpec.describe 'is_in_range' do
  it 'given a single mapping, returns true if number is in range' do
    # e.g. (50 98 2) and 99 equals true
    mapping = [50, 98, 2]
    expect(is_in_range(mapping, 99)).to eq(true)
  end
end


RSpec.describe 'translate_number' do
  it 'returns the translated number' do
    mappings = parse_puzzle(puzzle_demo)
    seed_mappings = mappings["seed-to-soil"]

    expect(translate_number(seed_mappings, 79)).to eq(81)
    expect(translate_number(seed_mappings, 14)).to eq(14)
    expect(translate_number(seed_mappings, 55)).to eq(57)
    expect(translate_number(seed_mappings, 13)).to eq(13)
  end
end

RSpec.describe 'seed_to_location' do
  it 'returns the translated number' do
    mappings = parse_puzzle(puzzle_demo)

    expect(seed_to_location(mappings, 79)).to eq(82)
    expect(seed_to_location(mappings, 14)).to eq(43)
    expect(seed_to_location(mappings, 55)).to eq(86)
    expect(seed_to_location(mappings, 13)).to eq(35)
  end
end

RSpec.describe 'get_answer' do
  it 'returns the answer' do
    expect(get_answer_a(puzzle_demo)).to eq(35)
  end
end
