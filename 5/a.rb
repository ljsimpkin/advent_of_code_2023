require_relative "../lib/utils.rb"
require 'byebug'

def parse_puzzle(puzzle_input)
  lines = puzzle_input.split("\n")
  hash = {}
  key = nil

  lines.each do |line|
    if line.include?('seeds:')
      key, values = line.split(':')
      hash[key] = values.split.map(&:to_i)
    elsif line.include?(':')
      key = line.split(' ').first
      hash[key] = []
    elsif line =~ /\d/
      hash[key].push(line.split.map(&:to_i))
    end
  end

  hash
end

      # key, values = line.split(':')
      # hash[key.strip.to_sym] = values.strip.split(' ').map(&:to_i)
    # elsif line.include?('map')
    #   key = line.split(' ').first.to_sym
    #   hash[key] = []
    # else
      # hash[key] << line.split(' ').map(&:to_i)
    # end

def get_answer_a(puzzle_input = get_puzzle(5))
end