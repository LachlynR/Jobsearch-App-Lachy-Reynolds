require 'json'
require 'tty-prompt'
require 'colorize'
require_relative 'job_class'


# UPDATE JSON
def updateJSON(arr)
    json_arr = JSON.pretty_generate(arr)
    File.write('jobs.json', json_arr)
end

# GET JSON
def getJSON
    json = File.open('jobs.json', 'r').read
    File.write('jobs.json', Array.new) if json == ""
    json_arr = JSON.parse(json)
    return json_arr
end

# ADD
$jobs = getJSON
def addJob
    values = user_input("add")
    job = {:position => values.position, :employer => values.employer, :industry => values.industry, :progress => values.progress, :application_date => values.application_date, :notes => values.notes}
    $jobs << job
    updateJSON($jobs)
    puts "Successfully Added! ^_^"
end

# SEARCH
# UPDATE
# DELETE
# USER INPUT


def user_input function
    if function == "add"
        clear
        position = input "What is the job position?"
        clear
        employer = input "Who is the employer?"
        clear
        industry = input "What industry does this job fall under? (i.e. Retail, Construction, Hospitality, etc.)"
        clear
        progress = select_prompt "What is the progress of this job application?", ["Awaiting Response".colorize(:blue), "Successful".colorize(:green), "Unsuccessful".colorize(:red)]
        clear
        application_date = input "When did you apply for this job? (DD/MM/YYYY)"
        clear
        notes = input "Any notes you may like to add: "
        return Job.new(position, employer, industry, progress, application_date, notes)
    end
end


# PROGRESS COLORIZING
# RAISE ERROR
# BEGIN AND RESCUE ERROR

# MAKING MY LIFE EASIER FUNCTION
def clear
    system('clear')
end

def input msg
    puts msg
    return gets.chomp
end

$prompt = TTY::Prompt.new

def select_prompt(message, options)
    result = $prompt.select("#{message} (Use ↑/↓ arrow keys, press Enter to select)", options)
    return result
end

