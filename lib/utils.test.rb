require_relative "utils.rb"

RSpec.describe 'get_input' do
  it 'gets the puzzle input for a day and raises an error if the API returns a status code other than 200' do
    expect { get_input('1') }.to raise_error(RuntimeError, 'API returned status code other than 200')
  end

  it 'raises an error when the API returns a status code other than 200' do
    expect { get_input('-1') }.to raise_error(RuntimeError, 'API returned status code other than 200')
  end
end
