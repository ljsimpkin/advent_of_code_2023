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

# Copy the template files to the new directory
FileUtils.cp_r('lib/template/.', "#{next_dir}/")
