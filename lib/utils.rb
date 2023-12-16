require 'net/http'
require 'uri'
require 'openssl'
require 'dotenv/load'


# get_input takes the day and returns the puzzle input for that day
def get_input(day)  
  urlstring = "https://adventofcode.com/2023/day/#{day}/input"
  url = URI(urlstring)
  
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Get.new(url)
  request["cookie"] = ENV['AOC_COOKIE']

  response = http.request(request)
  raise RuntimeError, 'Advent of code cookie not found' unless request["cookie"]
  raise RuntimeError, 'API returned status code other than 200' unless response.code.to_i == 200
  response
end

# cache_input saves the puzzle input to a file
def cache_input(day, response)
  Dir.mkdir('data/test_data') unless File.exists?('data/test_data')
  File.open("data/test_data/puzzle_#{day}", 'w') { |file| file.write(response.body) }
end

# return_input gets the puzzle input and saves it to a file if it's not already saved
def return_input(day, cache_path = "/cache/puzzles")
  response = get_input(day)
  # cache_input unless it is already cached
  File.open("#{cache_path}/puzzle_#{day}", 'w') { |file| file.write(response.body) } unless File.exists?("#{cache_path}/puzzle_#{day}")
end
