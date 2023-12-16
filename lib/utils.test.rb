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

RSpec.describe 'return_input' do
  before do
    FileUtils.rm_rf(Dir.glob('cache/cache_test/*')) # clear cache/cache_test directory
  end
  it 'return_input saves puzzle to /cache/cache_test/puzzle_1' do
    return_input('1', "./cache/cache_test")
    expect(File.exist?('./cache/cache_test/puzzle_1')).to eq(true)
  end

  it 'return_input returns the puzzle input' do
    return_input('1', "./cache/cache_test")
    expect(File.exist?('./cache/cache_test/puzzle_1')).to eq(true)
  end

  xit 'return_input does not get_input if puzzle file already exists' do
  end 

end

