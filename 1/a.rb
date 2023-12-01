require 'dotenv'
require 'net/http'
require 'uri'
require 'openssl'

require 'byebug'

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

def add_website_to_string(day)  
  urlstring = "https://adventofcode.com/2023/day/#{day}/input"
  url = URI(urlstring)
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Get.new(url)
  cookie = ENV['AOC_COOKIE']
  request["cookie"] = cookie
  response = http.request(request)
  response
end

def string_into_array(string)
  string.split("\n")
end

def get_result(string = add_website_to_string(1).body)
  strings = string.split("\n")
  numbers = get_first_and_last_numbers(strings)
  sum_numbers(strings_to_numbers(numbers))
end

puts get_result