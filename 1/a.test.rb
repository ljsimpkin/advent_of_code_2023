require 'rspec'

RSpec.describe 'True' do
  it 'equals true' do
    expect(true).to eq(true)
  end
end

RSpec.describe 'get_first_and_last_numbers' do
  it 'returns the first and last number for each string' do
    input = ['123abc456', '789def012', '345ghi678']
    output = [['123', '456'], ['789', '012'], ['345', '678']]
    expect(get_first_and_last_numbers(input)).to eq(output)
  end
end
