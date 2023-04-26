clear
echo -en "\n"
echo "2. ls"

echo -en "\n"
echo "ls stands for 'List'."
echo "This command will print a list of the files and directories in your current directory."
echo "This is the syntax for the ls command:"
echo "ls [flags] [directory]"

str1="You can print the lists of other directories using these commands:"
str2="ls [path to directory]        	lists files and directories from said directory"
str3="ls /                          	lists from the root directory"
str4="ls ..                         	lists from the parent directory before the current one"
str5="ls ../..                      	lists from the parent directory two steps up"
str6="ls ~                          	lists from the user's home directory"

directoryInfo=(str1 str2 str3 str4 str5 str6)

for str in ${directoryInfo[@]} ; do
  echo "${str}"
done

# echo "You can print the lists of other directories using these commands:"
# echo "ls [path to directory]        	lists files and directories from said directory"
# echo "ls /                          	lists from the root directory"
# echo "ls ..                         	lists from the parent directory before the current one"
# echo "ls ../..                      	lists from the parent directory two steps up"
# echo "ls ~                          	lists from the user's home directory"
# echo "Here are some useful flags for the ls command, which can be used in tandem with the previous directory shortcuts to work beyond your present working directory:"
# echo "ls -d */				lists only directories"
# echo "ls -R				lists all files and directories as well as their subdirectories down to the last file"

# skip=false
# menu=false
# keepGoing=true
# while [ ${keepGoing} = true ]; do
# 	echo -en "\n"
# 	echo "Enter the number of the option you would like to proceed to:"
# 	echo "1. Practice problem"
# 	echo "2. Skip practice / Next tutorial"
# 	echo "3. Return to menu"
# 	echo -en "\n"
# 	read -p "> " input

# 	if [ "${input}" == "1" ]; then
# 		# practice
# 		echo -en "\n"
# 		echo "Practice Problem:"
# 		echo "Use the pwd command to find the name of the current directory (it is included in the full path). Then, enter the name of the current directory."
# 		echo "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu':"
# 		problemBoolean=true

# 		while [ ${problemBoolean} = true ]; do
# 			echo -en "\n"
# 			read -p "> " answer
# 			if [ "${answer}" == "pwd" ]; then
# 				echo -en "\n"
# 				${answer}
# 			elif [ "${answer}" == "bash-tutorial" ]; then
# 				echo -en "\n"
# 				echo "Correct! Moving on to the next command."
# 				problemBoolean=false
# 				keepGoing=false
# 				skip=true
# 			elif [ "${answer}" == "skip" ]; then
# 				echo -en "\n"
# 				echo "Moving on to the next command."
# 				problemBoolean=false
# 				keepGoing=false
# 				skip=true
# 			elif [ "${answer}" == "solve" ]; then
# 				echo -en "\n"
# 				echo "The answer to this question is 'bash-tutorial'."
# 				echo "To find this answer, you would have to enter 'pwd'. This would show you the full path of the current directory, with the current directory appearing at the end:"
# 				echo -en "\n"
# 				echo "> pwd"
# 				pwd
# 				echo -en "\n"
# 				echo "As you can see, 'bash-tutorial' is the directory name."
# 				problemBoolean=false
# 			elif [ "${answer}" == "menu" ]; then
# 				echo -en "\n"
# 				echo "Returning to the menu."
# 				problemBoolean=false
# 				keepGoing=false
# 				menu=true
# 			else
# 				${answer}
# 				if [ $? -eq 0 ]; then
#     					#the command just works
# 				else
#     					echo "Command failed. Try another input."
# 					sleep 2
# 				fi
# 			fi
# 		done
# 	elif [ "${input}" == "2" ]; then
# 		echo -en "\n"
# 		echo "Moving on to the next command."
# 		keepGoing=false
# 		skip=true
# 	elif [ "${input}" == "3" ]; then
# 		echo -en "\n"
# 		echo "Returning to the menu."
# 		keepGoing=false
# 		menu=true
# 	else 
# 		echo "You entered an invalid input. Please try again."
# 	fi
# done

# if [ ${skip} = true ]; then
# 	sleep 2
# 	bash ./scripts/ls.sh
# elif [ ${menu} = true ]; then
# 	sleep 2
# 	bash ./welcome.sh
# fi	
