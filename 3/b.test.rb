require_relative 'b.rb'

RSpec.describe 'True' do
  it 'equals true' do
    expect(true).to eq(true)
  end

  it 'get_answer multiplies all the numbers next to a gear * and then retuns the sum' do
    puzzle = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    expect(get_answer(puzzle)).to eq(467835)
    expect(get_answer("1*1..\n.....\n1....")).to eq(1)
  end

end
