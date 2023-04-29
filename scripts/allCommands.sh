#!/bin/bash

clear

currentDir=`pwd`
usr=`whoami`
if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
	cd /home/${usr}/bash-tutorial
fi

echo -en "\n"
echo -e "Enter the number of the command you would like to learn about.\n"
echo "This tutorial builds off of previous lessons, so if you pick a later command, keep in mind that the practice problems may reference or require previous commands." | fold -w100 -s
echo -en "\n"
echo "1. pwd (Print Working Directory)"
echo "2. ls (List)"
echo "3. cd (Change Directory)"
echo "4. sudo (Super Do)"
echo "5. mkdir (Make Directory)"
echo "6. mv (Move)"
echo "7. cp (Copy)"
echo "8. rm (Remove)"
echo "9. cat (Concatenate)"
echo "10. chmod (Change Mode)"
echo "11. history (Print History)"
echo "12. Return to menu"
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
		echo "Loading tutorial 4: sudo..."
		sleep 2
		bash ./scripts/sudo.sh
	elif [ "${input}" == "5" ]; then
		#go to mkdir
		keepGoing=false
		echo "Loading  tutorial 5: mkdir..."
		sleep 2
		bash ./scripts/mkdir.sh
	elif [ "${input}" == "6" ]; then
		#go to mv
		keepGoing=false
		echo "Loading tutorial 6: mv..."
		sleep 2
		bash ./scripts/mv.sh
	elif [ "${input}" == "7" ]; then
		#go to cp
		keepGoing=false
		echo "Loading tutorial 7: cp..."
		sleep 2
		bash ./scripts/cp.sh
	elif [ "${input}" == "8" ]; then
		#go to rm
		keepGoing=false
		echo "Loading tutorial 8: rm..."
		sleep 2
		bash ./scripts/rm.sh
	elif [ "${input}" == "9" ]; then
		#go to cat
		keepGoing=false
		echo "Loading tutorial 9: cat..."
		sleep 2
		bash ./scripts/cat.sh
	elif [ "${input}" == "10" ]; then
		#go to chmod
		keepGoing=false
		echo "Loading tutorial 10: chmod..."
		sleep 2
		bash ./scripts/chmod.sh
	elif [ "${input}" == "11" ]; then
		#go to history
		keepGoing=false
		echo "Loading tutorial 11: history..."
		sleep 2
		bash ./scripts/history.sh
	elif [ "${input}" == "12" ]; then
		#return to menu
		keepGoing=false
		echo "Returning to the menu."
		sleep 2
		bash ./welcome.sh
	else
		#invalid input
		echo "You did not enter a number between 1-12. Please try again."
	fi
done
