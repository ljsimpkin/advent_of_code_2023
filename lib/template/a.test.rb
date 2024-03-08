require_relative 'a'

puzzle_demo = ""

RSpec.describe 'get_answer' do
  it 'returns the answer' do
    expect(get_answer_a(puzzle_demo)).to eq(true)
  end
end