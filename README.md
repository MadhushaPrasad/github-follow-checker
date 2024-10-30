# GitHub Follow Checker

## Overview

The **GitHub Follow Checker** is a simple Bash script that allows users to check their GitHub account to find users they follow who do not follow them back. It utilizes GitHub's API for seamless interaction and requires a personal access token for authentication.

## Features

- Reads GitHub username and personal access token from a file (`github.txt`).
- Prompts the user for their credentials if the file does not exist or contains invalid data.
- Fetches the list of users you are following and those who follow you back.
- Identifies and lists users that you follow but who do not follow you back.

## Prerequisites

- **Bash**: The script is written for Bash and should run on any Unix-like operating system with Bash support.
- **cURL**: The script uses `curl` to make API requests to GitHub.
- **jq**: This script requires `jq` for processing JSON data returned by the GitHub API. You can install it via package managers like Homebrew or APT:
  - For macOS: `brew install jq`
  - For Ubuntu/Debian: `sudo apt-get install jq`

## Usage

1. **Clone the Repository** (if applicable):
   ```bash
   git clone https://github.com/yourusername/github-follow-checker.git
   cd github-follow-checker
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x github-follow-checker.sh
   ```

3. **Run the Script**:
   ```bash
   ./github-follow-checker.sh
   ```

4. **Input Your Credentials**:
   - If `github.txt` exists, the script will read your GitHub username and personal access token from this file.
   - If the file does not exist or contains invalid data, you will be prompted to enter your GitHub username and personal access token. The script will then save these credentials to `github.txt`.

5. **Review the Output**:
   - The script will display users you follow who do not follow you back, or inform you that all your followers reciprocate.

## Important Notes

- **Personal Access Token**: You must create a personal access token with the necessary permissions to access your follower and following information. You can create a token by following [GitHub's documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).
- **Rate Limiting**: Be aware that GitHub’s API has rate limits. If you make too many requests in a short period, you may be temporarily blocked.

## License

This project is licensed under the [MIT license](https://opensource.org/licenses/MIT). See the LICENSE file for more details.

## Author

[Madhusha Prasad](https://github.com/MadhushaPrasad)
