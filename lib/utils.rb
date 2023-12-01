require 'net/http'
require 'uri'
require 'openssl'


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
  raise RuntimeError, 'API returned status code other than 200' unless response.code.to_i == 200

  response
end
