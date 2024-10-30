#!/bin/bash

# Function to read credentials from github.txt
read_credentials() {
  if [[ -f "github.txt" ]]; then
    read -r GITHUB_USERNAME GITHUB_TOKEN <github.txt
    if [[ -z "$GITHUB_USERNAME" || -z "$GITHUB_TOKEN" ]]; then
      echo "Invalid credentials in github.txt. Please enter your details."
      get_credentials
    else
      echo "Credentials loaded from github.txt."
    fi
  else
    echo "github.txt not found. Please enter your details."
    get_credentials
  fi
}

# Function to get credentials from the user
get_credentials() {
  read -p "Enter your GitHub username: " GITHUB_USERNAME
  read -sp "Enter your personal access token (input will be hidden): " GITHUB_TOKEN
  echo
  # Save the credentials to github.txt
  echo "$GITHUB_USERNAME $GITHUB_TOKEN" >github.txt
  echo "Credentials saved to github.txt."
}

# Read credentials
read_credentials

# Fetch the list of users you are following
echo "Fetching the list of users you follow..."
following=$(curl -s -u "$GITHUB_USERNAME:$GITHUB_TOKEN" \
  "https://api.github.com/users/$GITHUB_USERNAME/following" | jq -r '.[].login')

# Fetch the list of users who follow you
echo "Fetching the list of users who follow you..."
followers=$(curl -s -u "$GITHUB_USERNAME:$GITHUB_TOKEN" \
  "https://api.github.com/users/$GITHUB_USERNAME/followers" | jq -r '.[].login')

# Initialize an empty string to hold users who do not follow back
unreciprocated=""

# Check each user you follow
for user in $following; do
  # If the user is not in the followers list, add to unreciprocated
  if ! echo "$followers" | grep -q "^$user$"; then
    unreciprocated+="$user\n"
  fi
done

# Output the results
if [ -z "$unreciprocated" ]; then
  echo "Great! All the users you follow are following you back!"
else
  echo "Here are the users you follow who do not follow you back:"
  echo -e "$unreciprocated" | while read -r user; do
    echo " - $user"
  done
fi
