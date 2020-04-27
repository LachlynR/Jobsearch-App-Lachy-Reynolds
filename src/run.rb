require_relative 'functions'
require_relative './classes/errors'

args = ARGV



if args[0] == "add"
    greeting
    $prompt.keypress("Press enter to add a job", keys: [:return])
    addJob
elsif args[0] == "search"
    greeting
    $prompt.keypress("Press enter to search jobs", keys: [:return])
    searchJobs
elsif args[0] == "delete"
    greeting
    $prompt.keypress("Press enter to delete a job", keys: [:return])
    deleteJob
elsif args.length > 1
    puts "Too many arguments please pick one from below"
    valid_args
elsif args.length < 1
    puts "No arguments were given, please pick one from below"
    valid_args
else
    puts "That is not a valid argument, please pick one from below"
    valid_args
end

