def get_first_and_last_numbers(strings)
  strings.map do |string|
    first_number = string[/\d/]
    last_number = string[/\d(?=\D*$)/]
    "#{first_number}#{last_number}"
  end
end
