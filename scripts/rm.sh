clear
echo -en "\n"
echo "8. rm"

echo -en "\n"
echo "rm stands for ‘Remove’."
echo -e "\nThis command will remove any specified data, such as files or directories, from the file system. It specifically removes any references to data from the file system." | fold -w100 -s
echo -en "\n"
echo "This command works silently, so be careful when running the rm command, as once a file is deleted, it cannot be recovered. By default, the command will NOT prompt the user before deletion." | fold -w100 -s
echo -e "\nYou must have sudo permission to run this command.\n"
echo "This is the syntax for the rm command:"
echo -e "\trm [flags] [file/directory name]"
echo -e "\nIf you had a list of files, for example:"
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4"
echo -e "\nand wanted to remove the ‘1.txt’ file, you would use the command:"
echo -e "\n\trm 1.txt"
echo -e "\nThe directory would now look like this:"
echo -e "\n\t2.xt\t\t3.txt\t\t4"
echo -en "\n"

read -p "(Press enter to continue.) >" ans

echo -e "\nIf you had that same list of files, but wanted to remove multiple files, you would use the following command, for example:" | fold -w100 -s
echo -e "\n\trm 1.txt 2.txt"
echo -e "\nThe directory would now look like this:"
echo -e "\n\t3.txt\t\t4"
echo -e "\nWorking with the same list of files again, if you wanted to remove everything within the working directory, you would use the command:" | fold -w100 -s
echo -e "\n\trm -r *"
echo -e "\nIn this case, two different flags are used: -r for the recursive deletion of all files from the bottom up, starting with the files contained in the 4 directory, and * to specify all files. This must be done if you would like to remove a directory, as you cannot do this using the rm command by default. The working directory will be empty once this command is finished running." | fold -w100 -s
echo -en "\n"

read -p "(Press enter to continue.) >" ans

flagInfo=("Here are some useful flags for the rm command."
"\trm -i\t\t\t\tmakes the command ask the user for confirmation before removing."
"\t\t\t\t\t   The user must press ‘y’ for confirmation."
"\trm -f\t\t\t\tby default, the command will ask the user for confirmation when removing a file"
"\t\t\t\t\t   if that file is write-protected. This flag forcefully removes the file."
"\trm -r\t\t\t\trecursively removes all files and sub-directories of the"
"\t\t\t\t\t   parent directory using a tree-walk. This flag is the only way"
"\t\t\t\t\t   the rm command can remove a directory.")

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
	    if [ -d "/home/${usr}/bash-tutorial/practice/myDirectory" ] ; then
  		    sudo rm -r /home/${usr}/bash-tutorial/practice/myDirectory
	    fi
        
        if [ ! -d "/home/${usr}/bash-tutorial/practice/removeThisDirectory" ] ; then
            sudo mkdir ./practice/removeThisDirectory
        fi
        
		# practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the rm command to remove the directory inside of the 'practice' directory.\nThen, enter the name of the directory you removed.\n"
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true

    usr=`whoami`
    answerKey="removeThisDirectory"
		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "${answerKey}" ]; then
                if [ ! -d "/home/${usr}/bash-tutorial/practice/removeThisDirectory" ] ; then
        	        echo -en "\n"
		            echo "Correct! Moving on to the next command."
		            problemBoolean=false
		            keepGoing=false
		            skip=true
                else
                    echo -e "\nYour answer was correct, but we detect that you did not remove that directory as instructed.\nPlease try again."
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
                echo "The answer to this question is ‘${answerKey}’."
				echo -e "\nThere are multiple ways to delete this directory, but we did it with the following commands:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves to the practice directory, which you can see here:)"
				cd practice
                pwd
				echo -e "\n> ls (This will list all non-hidden files in the practice directory)"
				ls
				echo -en "\n"
				echo "As you can see, '${answerKey}' is the directory we need to delete. We do so like this:"
                echo -e "\n> sudo rm -rf removeThisDirectory (This will forcefully remove all files within the specified directory, including the directory)"
                sudo rm -rf removeThisDirectory
				echo -e "\n${answerKey} is the answer, but now we can check to see that we copied it properly:"
				echo -e "\n> ls"
				ls
				echo -e "\nAs you can see, the ‘${answerKey}’ file has been removed from the 'practice' directory."
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
	bash ./scripts/rm.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
