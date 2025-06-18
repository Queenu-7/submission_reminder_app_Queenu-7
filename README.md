This is a an app that shows and reminds students of their pending submissions.

Create environment.sh is setting up the directory structure for an application called submission reminder app. This script creates the necessary directories and files for a program that shows students who need to be reminded of their pending submissions

For the submissions.txt file is going  to contain the records of the student’s submission status.

The files config.env, reminder.sh, functions.sh, and startup.sh  are going to facilitate the functioning of the application.

For the copilot shell script.sh prompts the user for the assignment name that allows you enter the new assignment and enables the startup to show pending assignments for the updated assignment.

Startup.sh file is the one which runs the reminder.sh to show assignment history.

This is the structure of the app`s files and directories that help it work;

Submission_reminder_{yourName}/
|__app/
|   |___ reminder.sh
|___modules/
|   |___functions.sh
|___assets/
|   |___ submissions.txt
|___config/
|   |___ config.env
|____startup.sh

THE STEPS FOR HOW TO USE THE APP
Step 1: save the setup file named create_environment.sh. Put on a convinient location on your laptop. 

Step 2: Navigate to your temirnal (command line). Got the file saved and run it
using bash create_environment.sh or ./create_environment.sh. You will get this;

Enter your name: 

Step 3: After entering your name, you will have a new folder named submission_reminder_YourName. This folder contains everything you need for the app to work.

Step 4: After setting the app, go to your terminal and replace YourName with first step. Then once your're in the folder run the startup script like this ./startup.sh or bash startup.sh.

Step 5:If you want to check for other assignments, you will save the copilot script in the submission reminder then run it in your terminal. You will get this;

Enter your name:
Enter the assignment name:

Now the assignment is updated, go back to app's folder then rerun the startup script. This time the app will check for non-submissions for this updated assignment. And that`s it!

The purpose for this app is to provide flexible solution for managing and checking assignment submissions and showing a practical demostration for automating tasks using shell scripting.
