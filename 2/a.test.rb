require_relative "a.rb"

RSpec.describe '2/a tests' do
  it 'get_answer inputs a string and returns a sum of the possble combinations' do
    result = get_answer("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green\nGame 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue\nGame 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red\nGame 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red\nGame 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green")
    expect(result).to eq(8)
  end
  
  it 'parse_max_colour returns a hash of a single puzzles max values' do
    puzzle = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    result = parse_max_colour(puzzle)
    expected_result = {"blue" => 6, "red" => 4, "green" => 2}

    puzzle_2 = "Game 1: 3 blue, 4 red, 5 blue; 1 red, 2 green, 6 blue; 2 green"
    result_2 = parse_max_colour(puzzle_2)
    expected_result_2 = {"blue" => 8, "red" => 4, "green" => 2}
    
    expect(result["blue"]).to eq(6)
    expect(result["red"]).to eq(4)
    expect(result["green"]).to eq(2)

    expect(result_2["blue"]).to eq(8)
    expect(result_2["red"]).to eq(4)
    expect(result_2["green"]).to eq(2)
  end

  it 'parse_puzzles returns an array of a single puzzle' do
    puzzle = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green\nGame 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green\nGame 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    result = parse_puzzles(puzzle)
    expected_result = [{"blue" => 6, "red" => 4, "green" => 2}, {"blue" => 6, "red" => 4, "green" => 2}, {"blue" => 6, "red" => 4, "green" => 2}]  
    
    expect(result).to eq(expected_result)
  end

  it 'is_possible returns true if puzzle meets criterea' do
    puzzle = {"blue" => 6, "red" => 4, "green" => 2}
    criterea = {"red" => 12, "green" => 13, "blue" => 14}
    
    result = is_possible(puzzle, criterea)

    expect(result).to eq(true)
  end
end
