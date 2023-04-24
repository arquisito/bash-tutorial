#!/bin/bash

echo -en "\n"
echo "Enter the number of the command you would like to learn about:"
echo -en "\n"
echo "1. pwd (Print Working Directory)"
echo "2. ls (List)"
echo "3. cd (Change Directory)"
echo "4. sudo (Super Do)"
echo "5. mkdir (Make Directory)"
echo "6. mv (Move)"
echo "7. cp (Copy)"
echo "8. rm (Remove)"
echo "9. echo (Echo Text)"
echo "10. cat (Concatenate)"
echo "11. chmod (Change Mode)"
echo "12. history (Print History)"
echo "13. Return to menu"
echo -en "\n"
read -p "> " input

keepGoing=true
while [ ${keepGoing} = true ]; do
	if [ "${input}" == "1" ]; then
		#go to pwd
		echo "Loading tutorial 1: pwd..."
		keepGoing=false
		sleep 2
		bash ./scripts/pwd.sh
	elif [ "${input}" == "2" ]; then
		#go to ls
		echo "Loading tutorial 2: ls..."
		keepGoing=false
		sleep 2
		bash ./scripts/ls.sh
	elif [ "${input}" == "3" ]; then
		#go to cd
		echo "Loading tutorial 3: cd..."
		keepGoing=false
		sleep 2
		bash ./scripts/cd.sh
	elif [ "${input}" == "4" ]; then
		#go to sudo
		keepGoing=false
		echo "You entered 4."
	elif [ "${input}" == "5" ]; then
		#go to mkdir
		keepGoing=false
		echo "You entered 5."
	elif [ "${input}" == "6" ]; then
		#go to mv
		keepGoing=false
		echo "You entered 6."
	elif [ "${input}" == "7" ]; then
		#go to cp
		keepGoing=false
		echo "You entered 7."
	elif [ "${input}" == "8" ]; then
		#go to rm
		keepGoing=false
		echo "You entered 8."
	elif [ "${input}" == "9" ]; then
		#go to echo
		keepGoing=false
		echo "You entered 9."
	elif [ "${input}" == "10" ]; then
		#go to cat
		keepGoing=false
		echo "You entered 10."
	elif [ "${input}" == "11" ]; then
		#go to chmod
		keepGoing=false
		echo "You entered 11."
	elif [ "${input}" == "12" ]; then
		#go to history
		keepGoing=false
		echo "You entered 12."
	elif [ "${input}" == "13" ]; then
		#return to menu
		keepGoing=false
		echo "Returning to the menu."
		sleep 2
		bash ./welcome.sh
	else
		#invalid input
		echo "You did not enter a number between 1-13. Please try again."
	fi
done
