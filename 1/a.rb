def get_first_and_last_numbers(strings)
  strings.map do |string|
    first_number = string[/\d/]
    last_number = string[/\d(?=\D*$)/]
    "#{first_number}#{last_number}"
  end
end

def sum_numbers(numbers)
  numbers.sum
end

def strings_to_numbers(strings)
  strings.map(&:to_i)
end

def get_result(strings)
  numbers = get_first_and_last_numbers(strings)
  sum_numbers(strings_to_numbers(numbers))
end

