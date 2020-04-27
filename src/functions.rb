require 'json'
require 'tty-prompt'
require 'colorize'
require_relative 'classes/job_class'
require_relative 'classes/errors'


# UPDATE JSON
def updateJSON(arr)
    json_arr = JSON.pretty_generate(arr)
    File.write('jobs.json', json_arr)
end

# GET JSON
def getJSON
    json_init = File.open('jobs.json').read
    File.write('jobs.json', Array.new) if json_init == ""
    json = File.open('jobs.json', 'r').read
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
    function_loop("add")
end

# SEARCH
def searchJobs
    clear
    values = user_input "search"
    clear
    puts "Results:\n"
    if values == "all"
        $jobs.select {|job| output job}
    else
        $jobs.select {|job| output job if job[values[0].downcase] == values[1].gsub(/u001b/, '\e')}
    end
    function_loop("search")
    
end

# DELETE
def deleteJob
    values = user_input "delete"
    job_list = []
    $jobs.select {|job| job_list << job if job["position"] == values[0] && job["employer"] == values[1]}
    job_list.length > 1 ? (trash = select_prompt "Multiple results got returned! Which one would you like to delete", job_list) : trash = job_list[0]
    index = $jobs.find_index(trash)
    $jobs.delete_at(index)
    updateJSON($jobs)
    puts "Deleted Job!"
    function_loop "delete"
end



# USER INPUT
def user_input function
    if function == "add"
        clear
        position = input " What is the job position?"
        clear
        employer = input " Who is the employer?"
        clear
        industry = input " What industry does this job fall under? (i.e. Retail, Construction, Hospitality, etc.)"
        clear
        progress = select_prompt " What is the progress of this job application?", ["Awaiting Response".colorize(:blue), "Successful".colorize(:green), "Unsuccessful".colorize(:red)]
        clear
        begin
            application_date = input " When did you apply for this job? (DD/MM/YYYY)"
            check_format(application_date)
        rescue DateFormatError => e
            puts e.message
            retry
        end
        clear
        notes = input " Any notes you may like to add: "
        return Job.new(position.downcase, employer.downcase, industry.downcase, progress, application_date, notes)
    end

    if function == "search"
        clear
        filter = select_prompt "What would you like to search by?", ["Position", "Employer", "Industry", "Progress", "Application_Date", "All"]
        clear
        return filter.downcase if filter == "All" 

        if filter == "Progress"
            item = select_prompt " What is the progress of this job application?", ["Awaiting Response".colorize(:blue), "Successful".colorize(:green), "Unsuccessful".colorize(:red)]
        else
            item = input "What #{filter.downcase} were you looking for?"
        end

        return [filter.downcase, item]     
    end
    
    if function == "delete"
        clear
        position = input "What is the position of the job you want to delete?"
        clear
        employer = input "Who is the employer of the job you want to delete?"
        return [position, employer]
    end

end


# QOL FUNCTIONS

# Clear Screen
def clear
    system('clear')
end

# user input (puts & gets.chomp)
def input msg
    puts msg
    print " "
    return STDIN.gets.chomp
end

# TTY-Prompts
$prompt = TTY::Prompt.new(symbols: {marker: '>'})
def select_prompt(message, options)
    result = $prompt.select("#{message} (Use ↑/↓ arrow keys, press Enter to select)", options)
    return result
end

def multi_select_prompt(message, options)
    result = $prompt.multi_select("#{message} (Use ↑/↓ arrow keys, press Space to select and Enter to finish)", options)
    return result
end


def function_loop(function)
    if function == "add"       
        $prompt.yes?("Would you like to add another job?") == true ? addJob : exit
    end

    if function == "delete"
        $prompt.yes?("Would you like to delete another job?") == true ? deleteJob : exit
    end

    if function == "search"
        $prompt.yes?("Would you like to search for another job?") == true ? searchJobs : exit
    end
end

def valid_args
    puts ""
    puts "  add             Add Job"
    puts ""
    puts "  update          Update Job"
    puts ""
    puts "  delete          Delete Job"
    puts ""
    puts "  search          Search Job"
    puts ""
end

def output job
    puts " "
    puts "Position: #{job["position"].capitalize}"
    puts "Employer: #{job["employer"].capitalize}"
    puts "Industry: #{job["industry"].capitalize}"
    puts "Progress: #{job["progress"].capitalize}"
    puts "Application Date: #{job["application_date"].capitalize}"
    puts "Notes: #{job["notes"].capitalize}"
    puts " "
end

def empty_string value
    if value == ""
        return true
    else
        return false
    end
end

def check_format(date)
    date = date.strip
    raise DateFormatError, "Incorrect date format for #{date}. Use DD/MM/YYYY like this: 01/05/2020" unless /^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/.match(date)
end

def greeting
    clear
    puts "WELCOME TO YOUR"
    puts <<-'EOF'
     __   ______   ______   ______   ______   ______   ______   ______   __  __    
    /\ \ /\  __ \ /\  == \ /\  ___\ /\  ___\ /\  __ \ /\  == \ /\  ___\ /\ \_\ \   
   _\_\ \\ \ \/\ \\ \  __< \ \___  \\ \  __\ \ \  __ \\ \  __< \ \ \____\ \  __ \  
  /\_____\\ \_____\\ \_____\\/\_____\\ \_____\\ \_\ \_\\ \_\ \_\\ \_____\\ \_\ \_\ 
  \/_____/ \/_____/ \/_____/ \/_____/ \/_____/ \/_/\/_/ \/_/ /_/ \/_____/ \/_/\/_/

            __    __   ______   __   __   ______   ______   ______   ______    
           /\ "-./  \ /\  __ \ /\ "-.\ \ /\  __ \ /\  ___\ /\  ___\ /\  == \   
           \ \ \-./\ \\ \  __ \\ \ \-.  \\ \  __ \\ \ \__ \\ \  __\ \ \  __<   
            \ \_\ \ \_\\ \_\ \_\\ \_\\"\_\\ \_\ \_\\ \_____\\ \_____\\ \_\ \_\ 
             \/_/  \/_/ \/_/\/_/ \/_/ \/_/ \/_/\/_/ \/_____/ \/_____/ \/_/ /_/ 
                                                              
    EOF
end