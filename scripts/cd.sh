clear
echo -en "\n"
echo "3. cd"

echo -en "\n"
echo "cd stands for 'Change Directory'."
echo -e "\nThe default directory when you open your terminal is the home directory. You can use the cd command to move into other directories using various methods." | fold -w100 -s
echo "In fact, in order to access this tutorial, you already used the cd command--to enter this directory." | fold -w100 -s

echo -en "\n"
echo "The syntax for cd is as follows:"
echo -e "\tcd [flags] [directory]"
echo "The flags primarily revolve around symlinks, which won't be covered in this tutorial, so we're skipping them."

info=("There a many shortcuts and options that you can use to change to various directories:"
"\tcd [path to directory]\t\tchanges directly to the directory specified in the path"
"\tcd directoryName\t\tchanges to the directory specified if it is within the current working directory"
"\tcd .. OR cd ../\t\t\tmoves to the parent directory of the current working directory (one step above)"
"\tcd ../.. OR cd ../../\t\tmoves to the parent directory two steps above the current directory"
"\tcd ../directoryName\t\tmoves into the specified directory of the current directory's parent directory"
"\tcd -\t\t\t\tmoves to the previous working directory"
"\tcd ~\t\t\t\tmoves to the home directory"
"\nIf you need to navigate to a directory with spaces in its name, you can do so by typing '\' before every space:"
"\tcd dir\ name\ with\ spaces")

echo -en "\n"
for ((x = 0; x < ${#info[@]}; x++)) ; do
    echo -e "${info[$x]}"
done

skip=false
menu=false
keepGoing=true
while [ ${keepGoing} = true ]; do
	echo -en "\n"
	echo "Enter the number of the option you would like to proceed to:"
	echo "1. Practice problem"
	echo "2. Skip practice / Next tutorial"
	echo "3. Return to menu"
	echo -en "\n"
	read -p "> " input

	if [ "${input}" == "1" ]; then
		# practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the cd command to navigate to the 'practice' directory.\nWhat is the name of the first file inside of that directory? Use whatever commands you need to find out, and enter the answer here.\n" | fold -w100 -s
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of directory info, enter 'info':"
		problemBoolean=true

		usr=`whoami`
		answerKey=`ls /home/${usr}/bash-tutorial/practice | head -n 1`

		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "${answerKey}" ]; then
				echo -en "\n"
				echo "Correct! Moving on to the next command."
				problemBoolean=false
				keepGoing=false
				skip=true
			elif [ "${answer}" == "skip" ]; then
				echo -en "\n"
				echo "Moving on to the next command."
				problemBoolean=false
				keepGoing=false
				skip=true
			elif [ "${answer}" == "solve" ]; then
				currentDir=`pwd`
				if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
        				cd /home/${usr}/bash-tutorial
				fi
				echo -e "\n***"
				echo -en "\n"
				echo -e "The answer to this question is '${answerKey}'.\n"
				echo "There are multiple ways to find this answer, but we did it with the following commands:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves to the practice directory, which you can see here:)"
				cd practice
				pwd
				echo "> ls"
				ls
				echo -en "\n"
				echo "As you can see, '${answerKey}' is the first file in this directory."
				echo -e "\n***\n"
				problemBoolean=false
				cd ..
			elif [ "${answer}" == "menu" ]; then
				echo -en "\n"
				echo "Returning to the menu."
				problemBoolean=false
				keepGoing=false
				menu=true
            		elif [ "${answer}" == "info" ]; then
				echo -en "\n"
                		for ((x = 0; x < ${#info[@]}; x++)) ; do
    					echo -e "${info[$x]}"
				done
			else
				${answer}
				if [ $? -ne 0 ]; then
					echo "Command failed. Try another input."
					sleep 2
				fi
			fi
		done
	elif [ "${input}" == "2" ]; then
		echo -en "\n"
		echo "Moving on to the next command."
		keepGoing=false
		skip=true
	elif [ "${input}" == "3" ]; then
		echo -en "\n"
		echo "Returning to the menu."
		keepGoing=false
		menu=true
	else 
		echo "You entered an invalid input. Please try again."
	fi
done

currentDir=`pwd`
usr=`whoami`
if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
	cd /home/${usr}/bash-tutorial
fi
if [ ${skip} = true ]; then
	sleep 2
	bash ./scripts/sudo.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
