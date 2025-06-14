#!/bin/bash

echo -n "Enter your name please:"
read username

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

        cat <<'BOF' > "$dir/app/reminder.sh"
#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Remaining days to submit: $DAYS_REMAINING days"
echo "----------------------------------------"

check_submissions "$submissions_file"
BOF

    cat <<'BOF' > "$dir/modules/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file="$1"
    echo "Checking submissions in $submissions_file"

    tail -n +2 "$submissions_file" | while IFS=',' read -r student assignment status days_remaining; do
        #removing the white space
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted $assignment."

        fi
    done
}

BOF

    chmod +x "$dir/modules/functions.sh"

   # submissions.txt
    cat <<BOF > "$dir/assets/submissions.txt"
student,assignment,submission status,days remaining
Mutoni,Shell navigation,submitted,2
Kagabo,SLTD,not submitted,3
Tom,Empathy in leadership,submitted, 5
Marc,Python,submitted,0
Uwase,Github navigation,not submitted,4
Makuza,Java script,submitted,1
BOF


   #config env
    cat <<BOF > "$dir/config/config.env"
ASSIGNMENT="Shell navigation"
DAYS_REMAINING=2
BOF
  
  #startup.sh
    cat <<'BOF' > "$dir/startup.sh"
#!/bin/bash

source ./config/config.env


tail -n +2 "./assets/submissions.txt" | while IFS=',' read -r student assignment status days_remaining; do
    student=$(echo "$student" | xargs)
    assignment=$(echo "$assignment" | xargs)
    status=$(echo "$status" | xargs)
    days_remaining=$(echo "$days_remaining" | xargs)

    if [[ "$assignment" == "$ASSIGNMENT" ]]; then
        if [[ "$status" == "not submitted" ]]; then
            echo "Reminder: $student, you have '$assignment' that isn't submitted yet, due in $days_remaining day(s)!"

        elif [[ "$status" == "submitted" ]]; then
            echo "$student already submitted $assignment assignment."
        fi
    fi

done 

BOF

    chmod +x "$dir/startup.sh"
fi
                                             
