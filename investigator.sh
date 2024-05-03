#! /bin/bash
set -euo pipefail

# Default values for parameters
grep_string="${1:-fix\|bug}"
since_date="${2:-1 year}"

Help() {
    echo "Usage: $0 [GREP_STRING] [SINCE_DATE]"
    echo "Searches the git log for commits matching certain criteria and lists the occurence count of each file in the commits."
    echo
    echo "Parameters:"
    echo "  GREP_STRING   Regex pattern to grep in commit messages. Follows git log --grep definition. Default is 'fix\|bug'."
    echo "  SINCE_DATE    Time frame for the log search. Follows git log --since definition. Default is '1 year'."
    echo 
    echo "Examples:"
    echo "  $0 'feature\|add' '1 month ago'  # Return all files and number of occurences where commit message contained 'feature' or 'add' in the past month."
    echo
}

# Helper function to check if a command exists on the system
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if necessary commands exists on the system
if ! command_exists git || ! command_exists sed; then
    echo "Error: Required commands are not installed. Please make sure 'git' and 'sed' are available." >&2
    exit 1
fi

# Parse options
while getopts ":h" option; do
    case $option in
        h) # display Help
            Help
            exit 0
            ;;
        \?) # Invalid option
            echo "Invalid option: -$OPTARG" >&2
            Help
            exit 1
            ;;
    esac
done


# Main command
git log --grep "${grep_string}" --name-only --pretty=format: --since "${since_date}" |
    sed -r "/^\n*$/d" |
    sort |
    uniq -c |
    sort -r
