#!/bin/bash
# Small bash practice script.
# Asks for a log file and a word to search,
# checks inputs, runs grep, saves matches.

log_file=""
echo "Welcome $(whoami) your current path is $(pwd)"

until [[ -f "$log_file" ]];do
    read -p "Introduce the path to the log file: " log_file
    if [[ -f "$log_file" ]];then
        echo "Path succesfully found."
    else
        echo "The path does not exist."
        sleep 1
    fi
done

clear
read -p "What word do you want to search for in $log_file: " pattern

if [[ -z "$pattern" ]]; then
  echo "Empty pattern — abort"
  exit 1
fi

sleep 1
clear

echo "Lines that matched:" > matches.txt

{
    grep -Fin "$pattern" "$log_file" || 
    echo "None"
}>> matches.txt

echo "Results saved in matches.txt"
