clear
echo -en "\n"
echo "6. mv"

echo -en "\n"
echo "mv stands for 'Move'."
echo -e "\nThis command will move files or directories from one place to another. It has two different functions:\n"
echo -e "\t1.\tIt will rename the file/folder if the destination does not exist."
echo -e "\t2.\tIt will move the files/directory to the specified directory if it does exist."
echo -e "\nThis command, like most that involve modifying files, may require elevated permissions (sudo) to depending on your user permissions." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the mv command:"
echo -e "\tmv [flags] [source directory/file] [destination directory/file]"
echo -e "\nIf you had a list of files, such as:"
echo -e "\n\t1.txt\t\t2.txt\t\t3.txt\t\t4.txt\n"
echo "and you wanted to rename one of the files, such as renaming 1.txt to 5.txt, you would use the following command:" | fold -w100 -s
echo -e "\n\tmv 1.txt 5.txt"
echo -e "\nSince the destination file does not exist, it will create a new file with the specified name, move the contents of the source file into it, and delete the source file:" | fold -w100 -s
echo -e "\n\t2.txt\t\t3.txt\t\t4.txt\t\t5.txt\n"

read -p "(Press enter to continue.) >" ans

echo -e "\nIf you had the same list of files and wanted to move the contents of, for example, 1.txt to 4.txt, you would use the following command:" | fold -w100 -s
echo -e "\n\tmv 1.txt 4.txt"
echo -e "\nBecause the destination file exists, the mv command will move the contents of the source file into the destination file, overriding any information already inside the destination file." | fold -w100 -s
echo "By default, the command will NOT warn the user that the destination file will be overwritten."
echo "Once moved into the destination file, the source file will be deleted:"
echo -e "\n\t2.txt\t\t3.txt\t\t4.txt\n"

read -p "(Press enter to continue.) >" ans

flagInfo=("Here are some useful flags for the mv command:"
"\tmv -i\t\t\t\tmakes the command ask the user for confirmation before moving and"
"\t\t\t\t\t   overwriting a file. The user must press ‘y’ for confirmation."
"\tmv -f\t\t\t\tby default, the command will ask the user for confirmation when overwriting the"
"\t\t\t\t\t   destination file if that file is write-protected. This flag forcefully"
"\t\t\t\t\t   overwrites the destination file and deletes the source file."
"\tmv -n\t\t\t\tprevents an existing file from being overwritten if the destination"
"\t\t\t\t\t   file already exists."
"\tmv -b\t\t\t\tcreates a backup file for the file being overwritten when"
"\t\t\t\t\t   using the mv command. This new file will have a tilde (~) appended to it.")

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
    
        if [ -f "renamed.txt" ./practice ] ; then
            sudo mv renamed.txt catMe.txt ./practice
        fi
		# practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the mv command to rename the text file inside of the 'practice' directory.\nThen, enter the name of the original file (including the '.txt').\n"
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true

    usr=`whoami`
    answerKey="catMe.txt"
		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "${answerKey}" ]; then
                if [ -f "renamed.txt" ./practice ] ; then
        	        echo -en "\n"
		            echo "Correct! Moving on to the next command."
		            problemBoolean=false
		            keepGoing=false
		            skip=true
                else
                    echo -e "\nYour answer was correct, but we detect that you did not rename the file correctly.\nPlease try again."
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
				echo -e "There are multiple ways to rename that file, but we did it with the following commands:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves us to the 'practice' directory, as seen here:)"
				cd practice
                pwd
				echo -e"\n> ls (This shows the files and directories inside of the 'practice' directory.)"
				ls
				echo -en "\n"
				echo "As you can see, 'catMe.txt' is the file we need to rename. We do so like this:"
                echo -e "\n> sudo mv catMe.txt renamed.txt (sudo permissions are required to rename files.)"
                sudo mv catMe.txt renamed.txt
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
	bash ./scripts/cp.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
