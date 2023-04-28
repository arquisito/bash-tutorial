clear
echo -en "\n"
echo "4. sudo"

echo -en "\n"
echo "sudo stands for 'Super User Do'."
echo -e "\nThis command is actually less of its own command, and more of a prefix to other commands."
echo -e "The sudo command allows you to run another command with elevated privileges--basically, it runs the command as if you are the root user.\nSome bash commands will not execute properly (or at all) if the user running the command is not the root user. You can switch to the root user using different commands, but this runs the risk of you forgetting to switch back to your user. This could lead to you performing an irreversible action because you are doing them as root (such as accidentally erasing things permanently that you did not mean to).\nWith sudo, you can execute commands with elevated privileges without having to worry about switching between users." | fold -w100 -s
echo -en "\n"
echo "The syntax for the sudo command is as follows:"
echo -e "\tsudo [options] [command]"
echo -en "\n"
echo "sudo has a few flags that can be used before a command, but most of them have to do with switching users (which is unnecessary for any tutorials here), so we will only focus on one:" | fold -w100 -s
echo -e "\tsudo -b [command]\t\truns the command in the background (with elevated privileges)"
echo "This flag is useful for running commands that will output a lot of text, such as an update. It can be used for other commands as well, but keep in mind that it will not show the output for those commands." | fold -w100 -s

read -p "(Press enter to continue.) >" ans

skip=false
menu=false
keepGoing=true
while [ ${keepGoing} = true ]; do
	echo -en "\n"
  echo "The sudo command does not really need its own practice problem, as right now you have not learned any commands that can use it." | fold -w100 -s
  echo "However, the next command tutorial may require its use..."
  echo -en "\n"
	echo "Enter the number of the option you would like to proceed to:"
	echo "1. Next tutorial"
	echo "2. Return to menu"
	echo -en "\n"
	read -p "> " input

	if [ "${input}" == "1" ]; then
		echo -en "\n"
		echo "Moving on to the next command."
		keepGoing=false
		skip=true
	elif [ "${input}" == "2" ]; then
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
	bash ./scripts/mkdir.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	
