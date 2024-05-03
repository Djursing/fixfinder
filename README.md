# investigator

Inspired by *Your Code as a Crime Scene* by Adam Tornhill (yet to be read).

Investigator is a tool designed to analyze and highlight frequent modifications in files over a specified period based on commit messages.

This simple yet effective script helps identify "hotspots" in your codebase—areas frequently adjusted in commits related to bug fixes or other issues that might benefit from refactoring.

The tool isn't limited to finding bugs—it's versatile enough to handle any type of commit description and time frame you might be interested in exploring.


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
![alt text](example.png)