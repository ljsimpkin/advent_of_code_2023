require 'rspec'
require_relative 'a'

RSpec.describe 'True' do
  it 'equals true' do
    expect(true).to eq(true)
  end
end

RSpec.describe 'get_first_and_last_numbers' do
  it 'returns the first and last number for each string' do
    input = ['123abc456', '789def012', '345ghi678', '1abc2', 'pqr3stu8vwx', 'a1b2c3d4e5f', 'treb7uchet']
    output = ['16', '72', '38', '12', '38', '15', '77']
    expect(get_first_and_last_numbers(input)).to eq(output)
  end
end
