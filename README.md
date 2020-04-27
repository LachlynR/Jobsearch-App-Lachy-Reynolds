# Jobsearch Terminal App by Lachy Reynolds - README

## Purpose

This jobsearch manager app will allow job seekers who regularly apply for jobs to easily manage their job applications in one place. It will allow job seekers to add, remove, update and search their applied jobs.

## Problems it solved

- As a job seeker I found that I would always have trouble finding which job listing site (Seek, Indeed, Jora, etc.) I used to apply for a specific job. A job search manager can help significantly since I can easily look up a job in one place.

- When I got a phone call back from an employer I would sometimes forget that I applied for the job and the phone call became awkward or I seem uninterested. Being able to search through applied jobs on the spot when the employer says "Hi, I'm Jeff from Bunnings", I can search through my applied jobs for all applications for Bunnings.

- Not everyone will have access to the internet, so people who manually apply for jobs, can still keep track of their jobs offline.

- Having to create a table and do the organising yourself can be lots of work which is why I am doing the hard work to creating this wonderful tool for job seekers.

## User Story

- Text-based job application manager
- gems to use: 'json', 'tty-prompt', 'colorize'
- Job seeker can run the application in either add, delete, search or update mode by using the relevant argument when running file
- Job seeker can add a job to a local database providing the values for the job position, employer, industry, progress (options: Awaiting response, successful, unsuccessful), date of application, and some notes (optional).
- Job seeker can update a job in the event some details may change such as the progress or notes. If a user makes a mistake when adding a job application they may use this to fix that.
- Job seeker may be able to delete a job from the database.
- Job seeker will be able to search through their applied jobs. They can search by one of the attributes identified in the add function, or may be able to get all job applications. If they search by one of the attributes above give them the choice to search all or identify a specific item.
- Add a loop to each function to allow the user use more than once.

## User Experience / User Interface

**How the user will be greeted:**

The user will be greeted with an ASCII banner that says JOBSEARCH MANAGER, followed by a prompt asking them to press enter to perform the task that was chosen based on the ARGV option.

![Add Job Greeting UI](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/AddJob_greeting.PNG)

![Search Job Greeting UI](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/SearchJob_greeting.PNG)

![Delete Job Greeting UI](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/DeleteJob_greeting.PNG)

**How the user would use the add mode:**

The user will run 'ruby run.rb add' in their terminal to add a job. They will then be asked a series of questions to get information about their job application that will be used to store it in the jobs.json file.

![Add Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q1.PNG)

![Add Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q2.PNG)

![Add Job Question 3](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q3.PNG)

Using TTY-prompt's select prompt the user can easily navigate with the up/down arrow keys and enter key to select the progress of their application.

![Add Job Question 4](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q4.PNG)

![Add Job Question 5](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q5.PNG)

![Add Job Question 6](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q6.PNG)

Using TTY-prompt's yes? prompt the user can choose to add another job by entering 'y' or exit by entering 'n'.

![Successfully Added](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_successful.PNG)

**How the user would use the search mode:**

The user will run 'ruby run.rb search' in their terminal to search their applied jobs

Using TTY-prompt's select prompt the user can easily navigate with the up/down arrow keys and enter key to select an option they wish to search for their job(s) with.

![Search Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_q1.PNG)

![Search Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_q2.PNG)

Their search results will be printed in an easy to read format.

![Search Job Results](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_resuls.PNG)

[included but not in images] Using TTY-prompt's yes? prompt to choose to search for another job by entering 'y' or exit by entering 'n'.

**How the user would use the delete mode:**

The user will run 'ruby run.rb delete' in their terminal to delete an applied jobs

![Search Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_q1.PNG)

![Search Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_q2.PNG)

Using TTY-prompt's yes? prompt the user can choose to delete another job by entering 'y' or exit by entering 'n'.

![Search Job Results](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_successful.PNG)

## Features

**Add:**

- I chose to use the class called Job in order to create new instances of a job when adding a new applied job to the database.
- Get user input values for each attribute of job class and create a new instance. assign it to a values variable
- using the input, I created a hash called job
- appended the job hash to the global variable called jobs which contains the data from the jobs.json file as an array
- update the JSON file by re-writing the JSON with the updated jobs array
- use a yes? prompt from the TTY-prompt gem to ask the user if they want to add another job. If the prompt returns true (from entering 'y' for yes) the addJob method will be run, else the program will exit.

**Delete:**

- gets the position and employer of the job they want to delete
- tests to see if more than one result is returned to allow them to choose which item they want to delete
- find the index at which the job they want to delete is in the global jobs array
- delete the item at that index which will be the job they wanted to delete
- updates the JSON file as an item has been removed from the jobs array
- use a yes? prompt from the TTY-prompt gem to ask the user if they want to delete another job. If the prompt returns true (from entering 'y' for yes) the deleteJob method will be run, else the program will exit.

**Search:**

- gets the filter they wish to search with and the specific item in an array if the user chose not to search all.
- if the filter was all then all the values are selected from the array and printed out nicely.
- if there is a filter and a specific item then all results that match those will be printed out nicely.

**ARGV**

- checks to see if the user used the option 'add' when running run.rb. If true the user will go to the greeting screen for add then be able to add a job
- checks to see if the user used the option 'search' when running run.rb. If true the user will go to the greeting screen for search then be able to search their jobs
- checks to see if the user used the option 'delete' when running run.rb. If true the user will go to the greeting screen for delete then be able to delete a job
- if any of above returns false the user will be shown the valid options that can be used
- if the user inputs no or too much arguments a message will display for that and the valid options will be printed out too.

## Flowcharts

**Add:**

![Add Feature Flow Chart](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Trello/Trello_Board_half.PNG)

**Delete:**

**Search:**

## Trello

Trello Board During
![Trello Board During](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Trello/Trello_Board_half.PNG)
