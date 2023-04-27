clear
echo -en "\n"
echo "2. ls"

echo -en "\n"
echo "ls stands for 'List'."
echo "This command will print a list of the files and directories in your current directory."
echo -en "\n"
echo "This is the syntax for the ls command:"
echo "  ls [flags] [directory]"

directoryInfo=("You can print the lists of other directories using these commands:"
"   ls [path to directory]        	lists files and directories from said directory"
"   ls /                          	lists from the root directory"
"   ls ..                         	lists from the parent directory before the current one"
"   ls ../..                      	lists from the parent directory two steps up"
"   ls ~                          	lists from the user's home directory")

flagInfo=("Here are some useful flags for the ls command, which can be used in tandem with the directory shortcuts:"
"   ls -d */			lists only directories"
"   ls -R				lists all files and directories as well as their subdirectories down to the last file"
"   ls -l              lists all files in a table form with columns for permissions, number of links, group owner,"
"                          size (in bytes), last modified date / time, and file or directory name"
"   ls -a              lists all files and directories, including hidden ones (any that begin with a . )"
"   ls -t              lists all files and directories sorted by last modified date in descending order (of size in bytes)"
"   ls -S              lists all files and directories in descending order of size (in bytes)"
"   ls -r              lists all files and directories in reverse of the default (or specified) sorting order"
"You can use multiple flags at the same time and in any order to retrieve specific info. For example:"
"   ls -l -a        ls -a -l        ls -la      ls -al      -- these all return the same information"
"You can also store the results of your command in a text file rather than print the results outright."
"   ls -la > file.txt"
"You can access this non-printed information using the cat command, although for now you don't have to worry about that, as the cat tutorial is later on.")

echo -en "\n"
for ((x = 0; x < ${#directoryInfo[@]}; x++)) ; do
    echo "${directoryInfo[$x]}"
done
echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo "${flagInfo[$x]}"
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
		echo "Practice Problem:"
		echo "Use the ls command to find the name of the file or directory that is the smallest size. Then, enter the name of that directory or file."
		echo "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu':"
        echo "If you need the list of directory info, enter 'directory info'; for flags, enter 'flags'."
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
				echo -en "\n"
				echo "The answer to this question is \'${answerKey}\'."
				echo "There are multiple ways to find this answer, but the way we did it was with the command 'ls -rS'."
                echo "The '-rS' flags sort the list according to size in reverse order."
				echo -en "\n"
				echo "> ls -rS"
				ls -rS
				echo -en "\n"
				echo "As you can see, \'${answerKey}\' appears at the top, indicating that it is the smallest-sized."
				problemBoolean=false
			elif [ "${answer}" == "menu" ]; then
				echo -en "\n"
				echo "Returning to the menu."
				problemBoolean=false
				keepGoing=false
				menu=true
            elif [ "${answer}" == "directory info" ]; then
				echo -en "\n"
                for ((x = 0; x < ${#directoryInfo[@]}; x++)) ; do
                    echo "${directoryInfo[$x]}"
                done
            elif [ "${answer}" == "flag" ]; then
				echo -en "\n"
                for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
                    echo "${flagInfo[$x]}"
                done
			else
				${answer}
				if [ $? -eq 0 ]; then
    					#the command just works
				else
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
	bash ./scripts/cd.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
