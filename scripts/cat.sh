clear
echo -en "\n"
echo "9. cat"

echo -en "\n"
echo "cat is short for 'Concatenate'."
echo -e "This command has two functions:"
echo -e "\n1. It reads the contents of a readable file and outputs it to the terminal as a standard output (such as text.)" | fold -w100 -s
echo -e "\n2. It allows the user to write text to a new file and add text to an existing file." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the cat command:"
echo -e "\tcat [flags] [file]"
echo -e "\nIf you run the cat command without a file output, it will read from standard input; this means that it will just read in your next input lines and echo them back to you." | fold -w100 -s
echo "You can stop running the command by pressing CTRL+D."
echo -e "\n\t> cat"
echo -e "\t> Hello world!"
echo -e "\tHello world!"
echo -e "\t> CTRL+D"

echo -en "\n"
read -p "(Press enter to continue.) >" ans

flagInfo=("Here are some useful flags for the cat command:"
"\tcat -b [file]\t\t\t\tprints the file contents with all non-empty lines numbered."
"\t\t\t\t\t\t   This flag overrides the -n flag."
"\tcat -b [file]\t\t\t\tprints the file contents with all lines numbered"
"\tcat -E [file]\t\t\t\tprints the file contents with $ displayed at the end of each line."
"\tcat > [file]\t\t\t\twrites the standard input into a new file. This command is"
"\t\t\t\t\t\t   terminated by entering CTRL+D."
"\tcat >> [file]\t\t\t\tadds the standard input to the end of an already existing file."
"\nYou can also use 'here' document syntax to terminate the command using your own"
"input, as follows:"
"\n\t> cat > file.txt << EOF"
"\tThis is input text"
"\tEOF"
"\nThe EOF text is a token that indicates the beginning and end of a file. Entering"
"it at the end will terminate the command."
"Neither the first instance nor the last instance of the token will appear in the"
"actual file when this syntax is used.")

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
    # practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the cat command to read the catMe.txt file inside of the 'practice' directory.\nThen, enter the word that was inside that file (including punctuation!).\n"
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true

        usr=`whoami`
        currentDir=`pwd`
			if [ "${currentDir}" != "/home/${usr}/bash-tutorial" ]; then
        		    cd /home/${usr}/bash-tutorial
			fi
        answerKey="Meow!"
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
                echo "The answer to this question is ‘${answerKey}’."
				echo -e "\nHere is how we found that answer:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves to the practice directory, which you can see here:)"
				cd practice
                pwd
				echo -e "\n> ls (This will list all non-hidden files in the practice directory)"
				ls
				echo -en "\n"
				echo "You can see 'catMe.txt' is located in this directory. So, we read its contents using the cat command:"
                echo -e "\n> cat catMe.txt"
                cat catMe.txt
				echo -e "\nThe text inside of this file is '${answerKey}'!"
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
if [ ${skip} = true ]; then
	sleep 2
	bash ./scripts/chmod.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
