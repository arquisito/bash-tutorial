#!/bin/bash

echo -en "\n"
echo "Enter the number of the command you would like to learn about. If you would like an overview of bash terminology, enter 1:"

echo "0. Bash terminology"
echo "1. pwd (Print Working Directory)"
echo "2. cd (Change Directory)"
echo "3. ls (List)"
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
read input

if [ "${input}" == "0" ]; then
	#list bash terminology
	echo "You entered 0."
elif [ "${input}" == "1" ]; then
	#go to pwd
	echo "You entered 1."
elif [ "${input}" == "2" ]; then
	#go to cd
	echo "You entered 2."
elif [ "${input}" == "3" ]; then
        #go to ls
        echo "You entered 3."
elif [ "${input}" == "4" ]; then
        #go to sudo
        echo "You entered 4."
elif [ "${input}" == "5" ]; then
        #go to mkdir
        echo "You entered 5."
elif [ "${input}" == "6" ]; then
        #go to mv
        echo "You entered 6."
elif [ "${input}" == "7" ]; then
        #go to cp
        echo "You entered 7."
elif [ "${input}" == "8" ]; then
        #go to rm
        echo "You entered 8."
elif [ "${input}" == "9" ]; then
        #go to echo
        echo "You entered 9."
elif [ "${input}" == "10" ]; then
        #go to cat
        echo "You entered 10."
elif [ "${input}" == "11" ]; then
        #go to chmod
        echo "You entered 11."
elif [ "${input}" == "12" ]; then
        #go to history
        echo "You entered 12."
elif [ "${input}" == "13" ]; then
        #return to menu
        echo "You entered 13."
else
	#invalid input
	echo "You did not enter a number between 0-13. Please try again."
fi
