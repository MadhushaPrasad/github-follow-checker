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
  read -sp "Enter your personal access token: " GITHUB_TOKEN
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

