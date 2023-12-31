require 'fileutils'
require_relative "utils.rb"

RSpec.describe 'get_input' do
  it 'gets the puzzle input for a day and returns it' do
    response = get_input('1')
    expect(response.code.to_i).to eq(200)
  end

  it 'raises an error when the API returns a status code other than 200' do
    expect { get_input('-1') }.to raise_error(RuntimeError, 'API returned status code other than 200')
  end
end

RSpec.describe 'get_puzzle' do
  before do
    FileUtils.rm_rf(Dir.glob('cache/cache_test/*')) # clear cache/cache_test directory
  end

  it 'get_puzzle saves puzzle to /cache/cache_test/puzzle_1' do
    get_puzzle('1', "./cache/cache_test")
    expect(File.exist?('./cache/cache_test/puzzle_1')).to eq(true)
  end

  it 'get_puzzle returns the puzzle input' do
    result = get_puzzle('1', "./cache/cache_test")
    expect(result).to be_a(String)
  end

  it 'raises an error when the function fails' do
    expect { get_puzzle('-1', "./cache/cache_test") }.to raise_error(RuntimeError)
  end

end

