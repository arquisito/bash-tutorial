#!/bin/bash

currentDir=`pwd`
usr=`whoami`
if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
	cd /home/${usr}/bash-tutorial
fi

clear
echo -en "\n"
echo "Welcome to the bash command tutorial!"
echo "The purpose of this program is to teach you how to use basic bash commands in your terminal."

echo -en "\n"
echo "You have the option to complete the entire tutorial at once, or pick a specific command to learn about."
echo "This tutorial builds off of previous lessons, so if you pick a later command, keep in mind that the practice problems may reference or require previous commands." | fold -w100 -s
keepGoing=true

while [ "${keepGoing}" = true ]; do
	echo -en "\n"
	echo "What would you like to do?"
	echo "1. Full tutorial"
	echo "2. List commands"
	echo "3. Exit"
	echo -en "\n"
	read -p "> " input
	if [ "${input}" == "1" ]; then
		#go to full tutorial
		keepGoing=false
		bash ./scripts/pwd.sh
	elif [ "${input}" == "2" ]; then
		#list commands
		keepGoing=false
		bash ./scripts/allCommands.sh
	elif [ "${input}" == "3" ]; then
		#exit
		keepGoing=false
		echo -en "\n"
		echo "You have chosen to exit the bash tutorial. We hope you liked it!"
		echo "Remember, you can always run \`bash welcome.sh\` to do this tutorial again!"
		echo -en "\n"
	else
		echo -en "\n"
		echo "Your input did not match any of the options we gave you. Please try again."
		sleep 2
	fi
done
