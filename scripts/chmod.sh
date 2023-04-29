clear
echo -en "\n"
echo "11. chmod"
echo -en "\n"
echo "chmod stands for 'Change Mode'."
echo -e "\nThis command is used to change the access mode of a file."
echo "Every file and directory in a file system has 3 sets of permissions: one for read, one for write, and one for execute. These permissions are indicated by the letters ‘r’, ‘w’, and ‘x’." | fold -w100 -s
echo -e "This command allows the user to modify permissions such to restrict or allow access to that directory/file.\nIn this tutorial, modifying the permissions of a file or directory requires elevated privileges (sudo), but in most circumstances this is dependent on user permissions." | fold -w100 -s
echo -e "\nThis is the syntax for the chmod command:"
echo -e "\n\tchmod [flags] [###] [file]"
echo -e "\nThe ‘###’ in this syntax is referencing the three numbers that determine permissions.\nThe first number determines the permissions for the owner of the file or directory, the second determines permissions for the group, and the third determines permissions for all others." | fold -w100 -s
echo -e "\nThe digits for each number is determined by a simple calculation. Each individual permission has a number assigned to it. ‘Read’ permission is assigned a value of ‘4’, ‘write’ permission is assigned a value of ‘2’, and ‘execute’ permission is assigned a value of ‘1’. To choose which permissions you would like to assign to a file/directory, simply add the values assigned to the different permissions." | fold -w100 -s

echo -en "\n"
read -p "(Press enter to continue.) >" ans

echo -e "\nAs an example: if you wanted to assign a file named ‘file.txt’ to have read, write, and execute owner permissions, read and execute group permissions, and read other permissions, you would use the following command:" | fold -w100 -s
echo -e "\n\t> chmod 754 file.txt"
echo -e "\nIn this case, the first number ‘7’ refers to all three permissions added together, 4 (read) + 2 (write) + 1 (execute) = 7. Similarly, the second number ‘5’ is determined by adding 4 (read) + 1 (execute) = 5. The last number, 4, simply refers to read permission." | fold -w100 -s

echo -en "\n"
read -p "(Press enter to continue.) >" ans

flagInfo=("Here are some useful flags for the chmod command:"
"\tchmod -R [directory]\t\t\tchanges permissions recursively to all files and directories"
"\t\t\t\t\t\t   within the specified directory"
"\tchmod -v [file]\t\t\t\tdisplays a message for each file that is processed indicating the"
"\t\t\t\t\t\t   permission change that was made"
"\tchmod -c [file]\t\t\t\tdisplays a message only for files that have its permissions changed")

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
    if [ ! -d /home/${usr}/bash-tutorial/practice/chmodDir ]; then
        sudo mkdir /home/${usr}/bash-tutorial/practice/chmodDir
        sudo touch /home/${usr}/bash-tutorial/practice/chmodDir/changeMyPermissions.txt
        sudo chmod 700 /home/${usr}/bash-tutorial/practice/chmodDir/changeMyPermissions.txt
    fi
    # practice
		echo -en "\n"
		echo -e "Practice Problem:\n"
		echo -e "Inside of the 'practice' directory, there is a new directory called 'chmodDir'.\nUse the chmod command to change the permissions of the file inside of that directory so that it is: 1. Readable, writable, and executable by the owner;\n2. Writable and executable by the group, and\n3. Writable and executable by everyone else.\n" | fold -w100 -s
		echo -e "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu'.\n" | fold -w100 -s
        	echo "If you need the list of flags, enter 'flags':"
		problemBoolean=true
        
        while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
            if [[ -r /home/${usr}/bash-tutorial/practice/chmodDir/changeMyPermissions.txt && -w /home/${usr}/bash-tutorial/practice/chmodDir/changeMyPermissions.txt && -x /home/${usr}/bash-tutorial/practice/chmodDir/changeMyPermissions.txt]]; then
                echo -en "\n"
		        echo "The file permissions have been changed! Moving on to the next command."
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
                echo "Here is how we changed the file permissions for the file in the 'chmodDir' directory:"
				echo "(Note: This assumes that you are starting in the bash-tutorial directory.)"
				echo -en "\n"
				echo "> cd practice (This moves to the practice directory, which you can see here:)"
				cd practice
                pwd
                echo -e "\n> cd chmodDir (This moves to the chmodDir directory, which you can see here:)"
				cd chmodDir
                pwd
				echo -e "\n> ls (This will list all non-hidden files in the chmodDir directory)"
				ls
				echo -en "\n"
				echo "You can see 'changeMyPermissions.txt' is located in this directory. So, we change its permissions using the chmod command:"
                echo -e "\n> sudo chmod 733 changeMyPermissions.txt (733 = RWX by owner, WX by group, and WX by everyone else)"
                sudo chmod 733 changeMyPermissions.txt
				echo -e "\nThis command requires sudo because we are technically not the owner, so we have to elevate our privileges to change the mode of this file." | fold -w100 -s
                echo -e "\nYou can now check the new permissions using the ls command:"
                echo -e "\n> ls -la"
                ls -la
                echo -e "\nAs you can see, the permissions have been changed for this file!"
				echo -e "\n***\n"
                sudo rm -r /home/${usr}/bash-tutorial/practice/chmodDir
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
	bash ./scripts/chmod.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
