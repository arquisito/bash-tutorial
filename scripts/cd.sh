clear
echo -en "\n"
echo "2. cd"

echo -en "\n"
echo "cd stands for 'Change Directory'."
echo -e "\nThe default directory when you open your terminal is the home directory. You can use the cd command to move into other directories using various methods." | fold -w100 -s
echo "In fact, in order to access this tutorial, you already used the cd command at least once--to enter the directory for this project." | fold -w100 -s

echo -en "\n"
echo "The syntax for cd is as follows:"
echo -e "\tcd [options] [directory]"
echo "The options primarily revolve around symlinks, which won't be covered in this tutorial, so we're skipping them."

info=("There a many shortcuts and options that you can use to change to various directories:"
"\tcd [path to directory]\t\tchanges directly to the directory specified in the path"
"\tcd [directory name]\t\tchanges to the directory specified if it is within the current working directory"
"\tcd .. OR cd ../\t\tmoves to the parent directory of the current working directory (one step above)"
"\tcd ../.. OR cd ../../\t\tmoves to the parent directory two steps above the current directory"
"\tcd ../[directory name]\t\tmoves into the specified directory of the current directory's parent directory"
"\tcd -\t\t\t\tmoves to the previous working directory"
"\tcd ~\t\t\t\tmoves to the home directory"
"\nIf you need to navigate to a directory with spaces in the directory name, you can do so by typing '\' before every space, as such:"
"\tcd [dir\ name]")

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
        
        answerKey=`ls -rS | head -n 1`

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
				echo -e "\n***"
				echo -en "\n"
				echo -e "The answer to this question is '${answerKey}'.\n"
				echo "There are multiple ways to find this answer, but the way we did it was with the command 'ls -rS'."
                		echo "The '-rS' flags sort the list according to size in reverse order."
				echo -en "\n"
				echo "> ls -rS"
				ls -rS
				echo -en "\n"
				echo "As you can see, '${answerKey}' appears at the top, indicating that it is the smallest-sized."
				echo -e "\n***\n"
				problemBoolean=false
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

if [ ${skip} = true ]; then
	sleep 2
	bash ./scripts/sudo.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
