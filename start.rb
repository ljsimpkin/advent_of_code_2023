# This script creates a new directory with the next number in the current directory
# and copies the template files into the new directory.
require 'fileutils'

# Find the highest numbered directory
max_dir = Dir.glob('*').select { |f| File.directory? f }.map { |d| d.to_i }.max

# If no numbered directories exist, start at 1
max_dir = 0 if max_dir.nil?

# Increment the max directory number
next_dir = max_dir + 1

# Create the new directory
Dir.mkdir(next_dir.to_s)

# Copy the template files to the new directory and replace "PUZZLE_DAY" with the name of the new directory
FileUtils.cp_r('lib/template/.', "#{next_dir}/")

# Open each file in the new directory
Dir.glob("#{next_dir}/*").each do |file|
  text = File.read(file)

  # Replace "PUZZLE_DAY" with the name of the new directory
  new_contents = text.gsub("PUZZLE_DAY", next_dir.to_s)

  # Write the changes to the file
  File.open(file, "w") {|file| file.puts new_contents }
end
