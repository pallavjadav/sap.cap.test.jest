#!/bin/bash

# Get the current date to use in the stash message
current_date=$(date +"%Y-%m-%d")

# Ask for an additional comment from the user
read -p "Enter additional comment for the stash: " user_comment

# Stash the changes with a message that includes the date and user's comment
git stash push -m "$current_date: $user_comment"

echo "Changes have been stashed. Please perform the manual pull now."

# Prompt the user to confirm they have completed the pull
read -p "Press [Enter] once you have completed the pull."

# Display the list of available stashes
echo "Here are the available stashes:"
git stash list

# Prompt user to select which stash to apply
read -p "Enter the stash reference (e.g., stash@{0}) you want to apply: " stash_ref

# Apply the selected stash
git stash apply "$stash_ref"

echo "The stash $stash_ref has been applied."
