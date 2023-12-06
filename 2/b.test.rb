require_relative "b.rb"

RSpec.describe 'True' do
    it 'equals true' do
      expect(true).to eq(true)
    end
end

RSpec.describe 'question 2/b' do
    it 'get_answer for one set' do
        puzzle = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
        result = get_answer_2(puzzle)

        expect(result).to eq(48)
    end

    it 'get_answer' do
        puzzle = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green\nGame 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue\nGame 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red\nGame 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red\nGame 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
        result = get_answer_2(puzzle)

        expect(result).to eq(2286)
    end
end