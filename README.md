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

![Add Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q1.PNG)

![Add Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q2.PNG)

![Add Job Question 3](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q3.PNG)

![Add Job Question 4](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q4.PNG)

![Add Job Question 5](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q5.PNG)

![Add Job Question 6](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_q6.PNG)

![Successfully Added](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Add%20Function/Add_successful.PNG)

**How the user would use the search mode:**

INSERT DESCRIPTION HERE
![Search Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_q1.PNG)

![Search Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_q2.PNG)

![Search Job Results](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Search%20Function/Search_resuls.PNG)

**How the user would use the delete mode:**

INSERT DESCRIPTION HERE
![Search Job Question 1](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_q1.PNG)

![Search Job Question 2](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_q2.PNG)

![Search Job Results](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Delete%20Function/DeleteJob_successful.PNG)

## Features

**Add:**

**Delete:**

**Search:**

## Flowcharts

**Add:**

ruby runme.rb add > user input > goes to JSON

**Delete:**

**Search:**

## Trello

Trello Board During
![Trello Board During](https://github.com/LachlynR/Jobsearch-App-Lachy-Reynolds/blob/master/docs/images/Trello/Trello_Board_half.PNG)

Trello Board After

Done
