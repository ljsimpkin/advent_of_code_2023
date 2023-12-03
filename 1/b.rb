require_relative "../lib/utils.rb"
require_relative "a.rb"

# This function takes a string and finds all the numbers spelt out in that string
def convert_string_to_numbers(string)
   word_to_nuber = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
   string_of_numbers = string
   word_to_nuber.each do |word, digit|
    if string.include?(word)
      string_of_numbers.gsub! word, digit.to_s
    end
  end
  string_of_numbers
end

def get_first_and_last_numbers(string)
  word_to_number = {"one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
  numbers = []
  i = 0
  first = 0
  last = 0

  while i < string.length do
    # puts string[0,i]
    # puts string[(-1*i)..-1]

    # break while look if first and last number found
    if first != 0 and last != 0
      break
    end
    
    # check first string index is a digit
    if first == 0 and string[i].match?(/\d/)
      first = string[i].to_i
    end

    # check last string index is a digit
    if last == 0 and string[(-1 * (i + 1))].match?(/\d/)
      # puts "hello index = #{i} letter = #{string[(-1 * (i + 1))]}"
      last = string[(-1 * (i + 1))].to_i
    end

    # look for a number word
    word_to_number.each do |word, digit|
      # incriment through the first characters of a string
      if first == 0 and string[0,i].include?(word)
        first = digit
      end

      # incrament throught the last characters of a string
      if last == 0 and string[(-1*i)..-1].include?(word)
        last = digit
      end
    end
    i += 1
  end

  [first,last]
end

def update_array_with_digits(array)
  updated_array = []
  array.each do |string|
    updated_array.push(convert_string_to_numbers(string))
  end
  updated_array
end

def get_result(input = get_input("1"))
  input_array = update_array_with_digits(input.split("\n"))
  puts input_array
  numbers = get_first_and_last_numbers(input_array)
  sum_numbers(strings_to_numbers(numbers))
end