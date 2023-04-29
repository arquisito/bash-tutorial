clear
echo -en "\n"
echo "7. cp"

echo -en "\n"
echo "cp stands for 'Copy'."
echo "This command will copy files, groups of files, or directories. It creates an exact image of the specified file on the disk with a different name." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the cp command:"
echo -e "\tcp [flags] [source] [destination]\t\t\t\t(copies one file)"
echo -e "\tcp [flags] [source] [directory]\t\t\t\t\t(copies one file)"
echo -e "\tcp [flags] [source 1] [source 2] [source 3] [directory]\t\t(copies multiple files)"
echo -e "\nIf you had a list of files, for example:"
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4.txt"
echo -e "\nand you wanted to copy one of the files, for example copy ‘1.txt’ to ‘5.txt’, you would use the following command:" | fold -w100 -s
echo -e "\n\tcp 1.txt 5.txt"
echo -e "\nSince the destination file does not exist, it will create a new file with the specified name and copy the contents of the source file into it:" | fold -w100 -s
echo -e "\n\t1.txt\t\t2.txt\t\t3.txt\t\t4.txt\t\t5.txt"
echo -e "\nIf the destination file already exists, however, it will overwrite that file without any prior warning, so be careful when choosing a destination file." | fold -w100 -s
echo -en "\n"

read -p "(Press enter to continue.) >" ans

echo -e "\nIf you had a new list of files, for example:"
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4"
echo -e "\nand wanted to copy the contents of 1.txt into 4 (which is a directory), you would use the command:" | fold -w100 -s
echo -e "\n\tcp 1.txt 4"
echo -e "\nIn this case, since 4 is a directory, 1.txt will be copied into the 4 directory under the same name:" | fold -w100 -s
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4"
echo -e "\n\t//contents of 4\n\t\t1.txt"
echo -en "\n"

read -p "(Press enter to continue.) >" ans

echo -e "\nIf you had the same list of files, but instead of only copying 1.txt into 4, you wanted to copy 2.txt and 3.txt as well, you would use the command:" | fold -w100 -s
echo -e "\n\tcp 1.txt 2.txt 3.txt 4"
echo -e "\nIn this case, all the specified files will be copied into the 4 directory:" | fold -w100 -s
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4"
echo -e "\n\t//contents of 4\n\t\t1.txt\t2.txt\t3.txt"
echo -en "\n"

read -p "(Press enter to continue.) >" ans

flagInfo=("Here are some useful flags for the cp command:"
"\tcp -i\t\t\t\tmakes the command ask the user for confirmation before moving and"
"\t\t\t\t\t   overwriting a file. The user must press ‘y’ for confirmation."
"\tcp -f\t\t\t\tby default, the command will ask the user for confirmation when overwriting the"
"\t\t\t\t\t   destination file if that file is write-protected. This flag forcefully"
"\t\t\t\t\t   overwrites the destination file and deletes the source file."
"\tcp -b\t\t\t\tcreates a backup file for the file being overwritten when"
"\t\t\t\t\t   using the cp command. This new file will have a tilde (~) appended to it."
"\tcp *\t\t\t\tcopies all files that have the same ending following the asterisk"
"\t\t\t\t\t   (*.txt will copy all text files in the current directory)")

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
        usr=`whoami`
	    if [ -d "/home/${usr}/bash-tutorial/practice/myDirectory" ] ; then
  		    sudo rm -r /home/${usr}/bash-tutorial/practice/myDirectory
	    fi
        
        if [ -f "./practice/copied.txt" ] ; then
            sudo rm -r ./practice/copied.txt
        fi
        
		# practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Use the cp command to copy the text file inside of the 'practice' directory to a new file called 'copied.txt'.\nThen, enter the name of the original file (including the '.txt').\n"
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true

    usr=`whoami`
    answerKey="copyMe.txt"
		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "${answerKey}" ]; then
                if [ -f "./practice/copied.txt" ] ; then
        	        echo -en "\n"
		            echo "Correct! Moving on to the next command."
		            problemBoolean=false
		            keepGoing=false
		            skip=true
                else
                    echo -e "\nYour answer was correct, but we detect that you did not copy the file correctly.\nPlease try again."
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
				echo -e "\nThere are multiple ways to copy this file, but we did it with the following commands:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves to the practice directory, which you can see here:)"
				cd practice
                pwd
				echo -e "\n> ls (This will list all non-hidden files in the practice directory)"
				ls
				echo -en "\n"
				echo "As you can see, '${answerKey}' is the file we need to copy. We do so like this:"
                echo -e "\n> sudo cp copyMe.txt copied.txt (This will copy the copyMe.txt file into a new file called ‘copied.txt’)"
                sudo cp copyMe.txt copied.txt
				echo -e "\n${answerKey} is the answer, but now we can check to see that we copied it properly:"
				echo -e "\n> ls"
				ls
				echo -e "\nAs you can see, the ‘${answerKey}’ file has been copied to the specified file ‘copied.txt’."
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
	bash ./scripts/cp.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
