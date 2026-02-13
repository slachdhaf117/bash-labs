#!/bin/bash
# Clear empty lines from a file and create a cleaned copy
#Example usage: ./clear_lines.sh

read -p "Introduce a file to clear: " file
file_name="${file%.*}"
if [[ ! -f "$file" ]]; then
    echo "The file does not exist."
    exit 1
fi

deleted=$(grep -c "^[[:space:]]*$" "$file")
echo "$deleted empty lines were deleted."

echo "A copy of your file was created, the number of lines it has is: "
grep -v "^[[:space:]]*$" "$file"|tee "$file_name"_clear.txt|wc -l
