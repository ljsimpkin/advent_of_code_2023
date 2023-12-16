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
  it 'return_input saves puzzle to a file' do
    return_input('5')
    expect(File.exist?('puzzle_5')).to eq(true)
  end

  xit 'return_input does not get_input if puzzle file already exists' do
  end 

end

