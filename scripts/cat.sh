clear
echo -en "\n"
echo "9. cat"

echo -en "\n"
echo "cat is short for 'Concatenate'."
echo -e "This command has two functions:"
echo -e "\n1. It reads the contents of a readable file and outputs it to the terminal as a standard output (such as text.)" | fold -w100 -s
echo -e "\n2. It allows the user to write text to a new file and add text to an existing file." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the cat command:"
echo -e "\tcat [flags] [file]"
echo -e "\nIf you run the cat command without a file output, it will read from standard input; this means that it will just read in your next input lines and echo them back to you." | fold -w100 -s
echo "You can stop running the command by pressing CTRL+D."
echo -e "\n\t> cat"
echo -e "\t> Hello world!"
echo -e "\tHello world!"
echo -e "\t> CTRL+D"

flagInfo=("Here are some useful flags for the cat command:"
"\tcat -b [file]\t\t\t\tprints the file contents with all non-empty lines numbered."
"\t\t\t\t\t   This flag overrides the -n flag."
"\tcat -b [file]\t\t\t\tprints the file contents with all lines numbered"
"\tcat -E [file]\t\t\t\tprints the file contents with $ displayed at the end of each line."
"\tcat > [file]\t\t\t\twrites the standard input into a new file. This command is"
"\t\t\t\t\t   terminated by entering CTRL+D."
"\tcat >> [file]\t\t\t\tadds the standard input to the end of an already existing file."
"\nYou can also use 'here' document syntax to terminate the command using your own"
"input, as follows:"
"\n\t> cat > file.txt << EOF"
"This is input text"
"EOF"
"\nThe EOF text is a token that indicates the beginning and end of a file. Entering"
"it at the end will terminate the command."
"Neither the first instance nor the last instance of the token will appear in the"
"actual file when this syntax is used.")

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
done

echo -en "\n"
read -p "(Press enter to continue.) >" ans
