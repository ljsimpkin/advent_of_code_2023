require 'rspec'

# Add any other requires or configurations here

# This will include all the files in the lib directory
Dir[File.join(__dir__, '..', 'lib', '**', '*.rb')].sort.each { |file| require file }
