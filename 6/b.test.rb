require_relative "b.rb"

puzzle_demo = "Time:      71530
Distance:  940200"

puzzle = "Time:        53837288
Distance:   333163512891532"

RSpec.describe 'get_answer_b' do
  it 'returns the answer' do
    expect(get_answer_b(puzzle_demo)).to eq(71503)
  end
end
