#!/bin/bash
read -rp "Enter your name please:" username

dir="submission_reminder_$username"

if [ ! -d "$dir" ]; then
        echo "the directory '$dir' doesn't exist. Creating it.."
        mkdir -p "$dir/app" "$dir/modules" "$dir/assets" "$dir/config"

        touch "$dir/app/reminder.sh"
        touch "$dir/modules/functions.sh"
        touch "$dir/assets/submissions.txt"
        touch "$dir/config/config.env"
        touch "$dir/startup.sh"

        chmod +x "$dir/app/reminder.sh"
# The reminder.sh has the assignment name and days remaining
        cat <<EOF > "$dir/app/reminder.sh"
#!/bin/bash
#Source environment variables and helper functions

source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Remaining days to submit: \$DAYS_REMAINING days"
echo "----------------------------------------"

check_submissions "\$submissions_file"
EOF
# This is the functions file that checks for submittion status
    cat <<EOF > "$dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}

EOF

    chmod +x "$dir/modules/functions.sh"

   # adding 5 more records to submissions.txt where we see the students and their assignments
    cat <<EOF > "$dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Chelsea, Python, not submitted
Tom, C++, not submitted
Keza, Communication, submitted
Mugabo, Networking, not submitted
Ted, Marketing, submitted
Melissa, Flowcharts, not submitted
EOF


   #this is config env file where we will be able to change/modify the assignments
    cat <<EOF > "$dir/config/config.env"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
  
  #Creating the startup.sh file runs the remider.sh and shows the pending assignments
    cat <<EOF > "$dir/startup.sh"
#!/bin/bash
cd "\$(dirname "\$0")" || exit 1
bash app/reminder.sh 
EOF

    chmod +x "$dir/startup.sh"
        fi    

