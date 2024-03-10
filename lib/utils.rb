require 'net/http'
require 'uri'
require 'openssl'
require 'dotenv/load'
require 'byebug'


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

# get_puzzle gets the puzzle for that day and caches it
def get_puzzle(day, cache_path = "./cache/puzzles")
  # check if file exists and if not request puzzle
  if (!File.exists?("#{cache_path}/puzzle_#{day}"))
    response = get_input(day)
    File.open("#{cache_path}/puzzle_#{day}", 'w') { |file| file.write(response.body) } unless File.exists?("#{cache_path}/puzzle_#{day}")
  end
  File.read("#{cache_path}/puzzle_#{day}")
end
