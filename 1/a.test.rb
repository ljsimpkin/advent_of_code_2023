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

RSpec.describe 'strings_to_numbers' do
  it 'turns a list of strings of numbers into an array of numbers' do
    input = ['1', '2', '3', '4', '5']
    output = [1, 2, 3, 4, 5]
    expect(strings_to_numbers(input)).to eq(output)
  end
end

RSpec.describe 'sum_numbers' do
  it 'returns the sum of the numbers in an array' do
    input = [1, 2, 3, 4, 5]
    output = 15
    expect(sum_numbers(input)).to eq(output)
  end
end

RSpec.describe 'get result' do
  it 'gets the first and last numbers and then returns the sum of all the numbers' do
    string = "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet"
    sum = get_result(string)
    expect(sum).to eq(142)
  end
end

RSpec.describe 'add_website_to_string' do
  it 'gets a website and adds it to a string' do
    day = '1'
    response = add_website_to_string(day)
    expect(response.code.to_i).to eq(200)
  end
end
