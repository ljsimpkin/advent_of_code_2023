require_relative "b.rb"

puzzle_demo = ""

RSpec.describe 'get_answer_b' do
  it 'returns the answer' do
    expect(get_answer_b(puzzle_demo)).to eq(true)
  end
end
