clear
echo -en "\n"
echo "5. mkdir"

echo -en "\n"
echo "mkdir stands for 'Make Directory'."
echo -e "\nThis command is used to create one or more directories in either the current directory (default) or a specified directory." | fold -w100 -s
echo -e "\nDepending on user permissions, the mkdir command may require elevated privileges (sudo) in order to execute."
echo -en "\n"
echo "This is the syntax for the mkdir command:"
echo -e "\tmkdir [flags] [directories]"

flagInfo=("Here are some useful flags for the mkdir command:"
"\tmkdir -v [directories]\t\t\tcreates the listed directories and displays a message for each one"
"\tmkdir -m a=rwx [directories]\t\tcreates the listed directories with a specified 'mode' (permissions)"
"\t\t\t\t\t\t   (Permissions are touched upon more in the chmod command; for now,"
"\t\t\t\t\t\t   just know that a=rwx refers to those permissions)"
"\tmkdir -p dir1/dir2/dir3\t\t\tcreates the listed directories with parent directories in the order"
"\t\t\t\t\t\t   specified (if they don't already exist; if they do exist, the"
"\t\t\t\t\t\t   non-existing ones get added to the existing ones)")

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
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
	
		usr=`whoami`
		if [ -d "/home/${usr}/bash-tutorial/practice/myDirectory" ] ; then
  			sudo rm -r /home/${usr}/bash-tutorial/practice/myDirectory
		fi
		# practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the mkdir command to create a directory called 'myDirectory' inside of the 'practice' directory.\nThen, enter 'done' when it is complete.\n"
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true

    usr=`whoami`
    answerKey="done"
		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "${answerKey}" ]; then
        if [ -d "/home/${usr}/bash-tutorial/practice/myDirectory" ] ; then
        	echo -en "\n"
		echo "Correct! Moving on to the next command."
		problemBoolean=false
		keepGoing=false
		skip=true
        else
          echo -e "\nWe could not find the directory we asked you to make. Did you spell it right? Is it in the correct location?\nPlease try again."
        fi
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
				echo -e "There are multiple ways to create a directory, but we did it with the following commands:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo -e "> sudo mkdir -p ./practice/myDirectory (This creates a directory in the 'practice' directory.)\n"
				sudo mkdir -p practice/myDirectory
				echo "> ls ./practice (This shows the files and directories inside of the 'practice' directory.)"
				ls ./practice
				echo -en "\n"
				echo "As you can see, 'myDirectory' has been added to the 'practice' directory."
				echo -e "\n***\n"
				problemBoolean=false
				cd ..
			elif [ "${answer}" == "menu" ]; then
				echo -en "\n"
				echo "Returning to the menu."
				problemBoolean=false
				keepGoing=false
				menu=true
      elif [ "${answer}" == "flags" ]; then
				echo -en "\n"
        for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
            echo -e "${flagInfo[$x]}"
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
	bash ./scripts/mv.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
