#!/bin/bash
source ./create_environment.sh

config_file="./submission_reminder_$username/config/config.env"

if [[ -f "$config_file" ]]; then
        read -p "Enter the assignment name: " input
        input=$(echo "$input" |xargs) #Trimming spaces
        #input=$(echo "$input" | tr '[:upper:]' '[:lower:]')

        #Updating the assignment variable
        sed -i "s|^ASSIGNMENT=.*|ASSIGNMENT=\"$input\"|" "$config_file"

        echo "changed ASSIGNMENT in config.env to '$input'"
else
        echo "config.env not found at $config_file"
        exit 1
fi

#Moving into the right directory
cd "submission_reminder_$username" &&./startup.sh
