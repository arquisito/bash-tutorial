clear
echo -en "\n"
echo "2. ls"

echo -en "\n"
echo -e "ls stands for 'List'.\n"
echo "This command will print a list of the files and directories in your current directory."
echo -en "\n"
echo "This is the syntax for the ls command:"
echo -e "\tls [flags] [directory]"

directoryInfo=("You can print the lists of other directories using these commands:"
"\tls [path to directory]\t\tlists files and directories from said directory"
"\tls /\t\t\t\tlists from the root directory"
"\tls ..\t\t\t\tlists from the parent directory before the current one"
"\tls ../..\t\t\tlists from the parent directory two steps up"
"\tls ~\t\t\t\tlists from the user's home directory")

flagInfo=("Here are some useful flags for the ls command, which can be used in tandem with the directory shortcuts:"
"\tls -d */\t\t\tlists only directories"
"\tls -R\t\t\t\tlists all files and directories as well as their subdirectories down to"
"\t\t\t\t\t   the last file"
"\tls -l\t\t\t\tlists all files in a table form with columns for permissions, number of links,"
"\t\t\t\t\t   group owner, size (in bytes), last modified date / time, and file or"
"\t\t\t\t\t   directory name"
"\tls -a\t\t\t\tlists all files and directories, including hidden ones (any that begin with '.')"
"\tls -t\t\t\t\tlists all files and directories sorted by last modified date in descending order"
"\t\t\t\t\t   (of size in bytes)"
"\tls -S\t\t\t\tlists all files and directories in descending order of size (in bytes)"
"\tls -r\t\t\t\tlists all files and directories in reverse of the default (or specified)"
"\t\t\t\t\t   sorting order\n"
"You can use multiple flags at the same time and in any order to retrieve specific info. For example:"
"\tls -l -a\tls -a -l\tls -la\t\tls -al\t\t-- these all return the same information\n"
"You can also store the results of your command in a text file rather than print the results outright."
"\tls -la > file.txt"
"\nYou can access this non-printed information using the cat command, although for now you don't have to worry about that,"
"as the cat tutorial is later on.\n")

echo -en "\n"
for ((x = 0; x < ${#directoryInfo[@]}; x++)) ; do
    echo -e "${directoryInfo[$x]}"
done

echo -en "\n"
read -p "(Press enter to continue.) >" ans

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
done

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
		echo -e "Use the ls command to find the name of the file or directory that is the smallest size.\nThen, enter the name of that directory or file.\n" | fold -w100 -s
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        echo "If you need the list of directory info, enter 'info'; for flags, enter 'flags':"
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
                for ((x = 0; x < ${#directoryInfo[@]}; x++)) ; do
                    echo -e "${directoryInfo[$x]}"
                done
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
	bash ./scripts/cd.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
