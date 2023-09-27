#!/bin/bash

# Set UTF-8 encoding
export LANG=en_US.UTF-8

# Prompt the user to enter a comment
read -p "Please enter a comment: " var

# Display the user's input comment
echo "You entered the comment: $var"

# Perform Git operations
git pull
git add *.ipynb
git add *.sh
git add windowScript/*
git add linuxScript/*
git add ueScript/*
git add mysysScript/*

# Display the user's input comment again
echo "$var"

# Commit and push the changes
git commit -m "$var"
git push origin master:master
