#!/bin/bash

echo -en "\n"
echo "Welcome to the bash command tutorial!"
echo "The purpose of this program is to teach you how to use basic bash commands in your terminal."

echo -en "\n"
echo "You have the option to complete the entire tutorial at once, or pick a specific command to learn about."

echo -en "\n"
echo "What would you like to do?"
echo "1. Full tutorial"
echo "2. List commands"
echo "3. Exit"
read input

if [ "${input}" == "1" ]; then
	#go to full tutorial
	echo "You entered 1."
elif [ "${input}" == "2" ]; then
	#list commands
	echo "You entered 2."
elif [ "${input}" == "3" ]; then
	#exit
	echo "You entered 3."
else
	echo "You entered neither 1, 2, nor 3."
fi
