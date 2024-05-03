#! /bin/bash
set -euo pipefail

# Default values for parameters
grep_string='fix|bug'
since_date='1 year'

# Enhanced Help function with more details
Help() {
    echo "Usage: $0 [-g|--grep GREP_STRING] [-s|--since SINCE_DATE]"
    echo "Searches the git log for commits matching certain criteria and lists the occurrence count of each file that has been involved in descending order."
    echo
    echo "Options:"
    echo "  -g, --grep   Extended Regex pattern to grep in commit messages. Follows git log -E --grep definition. Default is 'fix|bug'."
    echo "  -s, --since  Time frame for the log search. Follows git log --since definition. Default is '1 year'."
    echo
    echo "Examples:"
    echo "  $0 --grep 'feature|add' --since '1 month ago'  # Search all commits where commit message contains 'feature' or 'add' in the past month."
    echo
}


# Helper function to check if a command exists on the system
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check necessary commands exists on system before proceeding
if ! command_exists git || ! command_exists sed; then
    echo "Error: Required commands are not installed. Please make sure 'git' and 'sed' are available." >&2
    exit 1
fi

# Parse options
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -g|--grep)
            grep_string="$2"
            shift 2
            ;;
        -s|--since)
            since_date="$2"
            shift 2
            ;;
        -h|--help)
            Help
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            Help
            exit 1
            ;;
    esac
done

# Main command
git log -E --grep "${grep_string}" --name-only --pretty=format: --since "${since_date}" |
    sed -r "/^\n*$/d" |
    sort |
    uniq -c |
    sort -r
