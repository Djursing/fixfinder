# investigator

*Inspired by "Your Code as a Crime Scene" by Adam Tornhill (yet to be read)*

Investigator is a tool designed to analyze and highlight frequent modifications in files over a specified period based on commit messages.

This script helps to identify "hotspots" in your codebase, areas frequently adjusted in commits related to bug fixes or other issues might benefit from refactoring.

The tool isn't limited to finding bugs, it's versatile enough to handle any type of commit description and time frame you might be interested in exploring.

## Getting Started

To get Investigator up and running on your machine, follow these steps:

### Prerequisites
Make sure you have `git` and `sed` installed on your system, as they are essential for the script to function correctly.

### Installation
1. **Clone the repository:**
```bash
git clone https://github.com/djursing/investigator.git
```

2. **Navigate to the repository:**
```bash
cd investigator
```

3. **Make the script executable:**
```bash
chmod +x investigator.sh
```

### Usage
```
./investigator.sh [-g|--grep GREP_STRING] [-s|--since SINCE_DATE]
```

### Options
```
-g, --grep
        Extended Regex pattern to grep in commit messages.
        Follows git log -E --grep definition.
        Default is 'fix|bug'.

-s, --since 
        Time frame for the log search.
        Follows git log --since definition.
        Default is '1 year'.
```

### Examples
![picture of the script being used in a terminal](example.png)