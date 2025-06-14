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

