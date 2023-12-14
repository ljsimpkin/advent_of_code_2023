require_relative 'a.rb'

RSpec.describe 'True' do
  it 'equals true' do
    expect(true).to eq(true)
  end

  it 'get_answer sums all the numbers adjacent to a symbol' do
    puzzle = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    expect(get_answer(puzzle)).to eq(4361)
  end

end