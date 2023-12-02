require_relative "b.rb"

RSpec.describe 'get_restult' do
  it 'test_get_result' do
    result = get_result("two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen")
    expect(result).to eq(281)
  end

  it 'test_convert_string_to_numbers' do
    result = convert_string_to_numbers("xyztwo1ninea")
    expect(result).to eq("xyz219a")
  end

  it 'test_change_array_values' do
    result = change_array_values([1, 2, 3])
    expect(result).to eq([2, 3, 4])
  end
end
