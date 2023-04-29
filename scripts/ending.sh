clear
echo -e "\nYou have completed the bash tutorial! Congratulations!"
echo -e "\nYou now have the option to return to the menu, or exit the tutorial."
keepGoing=true

while [ "${keepGoing}" = true ]; do
	echo -en "\n"
	echo "What would you like to do?"
	echo "1. Return to menu"
	echo "2. Exit"
	echo -en "\n"
	read -p "> " input
	if [ "${input}" == "1" ]; then
		#go to menu
		keepGoing=false
		bash ./scripts/welcome.sh
	elif [ "${input}" == "2" ]; then
		#exit
		keepGoing=false
		echo -en "\n"
		echo "You have chosen to exit the bash tutorial. We hope you liked it!"
		echo "Remember, you can always run \`bash welcome.sh\` to do this tutorial again!"
		echo -en "\n"
	else
		echo -en "\n"
		echo "Your input did not match any of the options we gave you. Please try again."
		sleep 2
	fi
done
