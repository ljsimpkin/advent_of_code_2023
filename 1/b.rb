require_relative "../lib/utils.rb"
require_relative "a.rb"

def get_first_and_last_numbers(string)
  word_to_number = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
  numbers = []
  i = 0
  first = 0
  last = 0

  while i < string.length do

    # break while look if first and last number found
    if first != 0 and last != 0
      break
    end

    # look for a number word
    word_to_number.each do |word, digit|
      # incriment through the first characters of a string
      if first == 0 and string[0,i].include?(word)
        first = digit
      end

      # incrament throught the last characters of a string
      if last == 0 and string[(-1 * (i + 1))..-1].include?(word)
        last = digit
      end
    end

    # check first string index is a digit
    if first == 0 and string[i].match?(/\d/)
      first = string[i].to_i
    end

    # check last string index is a digit
    if last == 0 and string[(-1 * (i + 1))].match?(/\d/)
      last = string[(-1 * (i + 1))].to_i
    end

    i += 1
  end

  [first, last]
end

# gets the answer of the puzzle
def get_result(input = get_puzzle("1"))
  total = 0
  input_array = input.split("\n")

  input_array.each do |string|
    number_array = get_first_and_last_numbers(string)
    total += (number_array[0] * 10) + number_array[1]
  end

  total
end

print get_result