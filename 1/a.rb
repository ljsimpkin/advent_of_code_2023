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

require 'net/http'
require 'uri'
require 'openssl'

require 'byebug'

def add_website_to_string(website)  
  url = URI("https://adventofcode.com/2023/day/1/input")
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Get.new(url)
  # request["cookie"] = '_ga=GA1.2.2086243366.1701409101; _gid=GA1.2.980036351.1701409101; session=53616c7465645f5f7ff100eeacaca0c6f8ebfe67ea150d15905488eca2216e626eaf4ef6f6b656d20e6585f0262780b5737d1cb27c35d21fedb0628e392dae4d; _ga_MHSNPJKWC7=GS1.2.1701415923.2.0.1701415923.0.0.0'
  request["cookie"] = ENV["AOC_COOKIE"]
  puts ENV["AOC_COOKIE"]
  response = http.request(request)
  response.body
end

def string_into_array(string)
  string.split("\n")
end

def get_result
  # byebug
  string = add_website_to_string("https://adventofcode.com/2023/day/1/input")
  numbers = get_first_and_last_numbers(string.split("\n"))
  sum_numbers(strings_to_numbers(numbers))
end

puts get_result