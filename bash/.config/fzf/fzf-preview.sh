#!/bin/bash
FILE="$1"

if [[ -d "$FILE" ]]; then
  # If it's a directory, list its contents
  ls -lh "$FILE"
elif [[ -f "$FILE" ]]; then
  # If it's a file, preview it with bat or cat
  command -v bat &> /dev/null && bat --style=plain --color=always "$FILE" || head -n 100 "$FILE"
else
  echo "Not a valid file or directory"
fi
