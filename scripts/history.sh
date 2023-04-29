clear
echo -en "\n"
echo "11. history"

echo -en "\n"
echo "The history command is self explanatory; it stands for 'History'."
echo "This command prints a numbered list of all of previously executed commands, including your execution of the history command." | fold -w100 -s
echo -e "\nThis goes all the way back to the first command you ever used on your current operating system, so this could potentially be a very long list." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the history command:"
echo -e "\thistory [flags]"

flagInfo=("Here are some useful flags and shortcuts for the history command:"
"\thistory [#]\t\t\t\tprints the specified number of previously executed commands,"
"\t\t\t\t\t\t   including the history command"
"\t![event #]\t\t\t\texecutes the command with the specified event number (number"
"\t\t\t\t\t\t   assigned to the command in history)."
"\t![event #]:p\t\t\t\tprints the command with the specified event number"
"\t\t\t\t\t\t   executing it"
"\thistory -d [event #]\t\t\tremoves the command with the specified event number from"
"\t\t\t\t\t\t   the history"
"\thistory -c\t\t\t\tfully clears the entire command history")

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
done

echo -en "\n"
read -p "(Press enter to continue.) >" ans

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
    currentDir=`pwd`
	if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
        cd /home/${usr}/bash-tutorial
	fi
    # practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the history command to clear your entire command history." | fold -w100 -s
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true
        
        while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
		if [ "${answer}" == "sudo history -c" ] || [ "${answer}" == "history -c" ] ; then
			sudo history -c
                	echo -en "\n"
		        	echo "You've done it; you cleared your history!"
				echo -e "\nMoving on..."
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
                echo "Clearing your command history is quite simple; all you have to do is enter the following command:"
				echo -en "\n"
				echo "> history -c"
				history -c
                echo -e "\nThis simple command has cleared your entire command history, which you can check by using the history command again:" | fold -w100 -s
				history
				echo -e "\nAs you can see, your history has been cleared except for your new execution of history."
				echo -e "\n***\n"
				problemBoolean=false
				cd ..
				read -p "(Press enter to continue.)>" ans
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
if [ -d /home/${usr}/bash-tutorial/practice/chmodDir ]; then
    sudo rm -r /home/${usr}/bash-tutorial/practice/chmodDir
fi
if [ ${skip} = true ]; then
	sleep 2
	bash ./scripts/ending.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
