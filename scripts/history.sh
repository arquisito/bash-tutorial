clear
echo -en "\n"
echo "11. history"

echo -en "\n"
echo "The history command is self explanatory; it stands for 'History'."
echo "This command prints a numbered list of all of previously executed commands, including your execution of the history command."
echo -e "\nThis goes all the way back to the first command you ever used on your current operating system, so this could potentially be a very long list." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the history command:"
echo -e "\thistory [flags]"

flagInfo=("Here are some useful flags and shortcuts for the history command:"
"\thistory [#]\t\t\t\tprints the specified number of previously executed commands, including"
"\t\t\t\t\t\t   the history command"
"\t![event #]\t\t\t\texecutes the command with the specified event number (number assigned"
"\t\t\t\t\t\t   to the command in history)."
"\t![event #]:p\t\t\t\tprints the command with the specified event number before executing it"
"\thistory -d [event #]\t\t\tremoves the command with the specified event number from the history"
"\thistory -c\t\t\t\tfully clears the entire command history")

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
done

echo -en "\n"
read -p "(Press enter to continue.) >" ans
