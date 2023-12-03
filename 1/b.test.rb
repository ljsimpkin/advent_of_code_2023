require_relative "b.rb"

RSpec.describe 'get_restult' do
  it 'test_get_result' do
    result = get_result("two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen")
    expect(result).to eq(281)
  end

  it 'test_convert_string_to_numbers' do
    result = convert_string_to_numbers("xyztwo1ninea")
    result_2 = convert_string_to_numbers("neightwothree")

    expect(result).to eq("xyz219a")
    expect(result_2).to eq("n8wo3")
  end

  it 'test_update_array_with_digits' do
    result = update_array_with_digits(["xyztwo1ninea", "xyztwo3ninea", "xyztwo1sevena"])
    expect(result).to eq(["xyz219a", "xyz239a", "xyz217a"])
  end
  it 'test_get_first_and_last_numbers' do
    result = get_first_and_last_numbers("123abc456def789")
    expect(result).to eq([123, 789])
  end
end
