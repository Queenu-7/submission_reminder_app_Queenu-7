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

