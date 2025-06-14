#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Remaining days to submit: $DAYS_REMAINING days"
echo "----------------------------------------"

check_submissions "$submissions_file"
