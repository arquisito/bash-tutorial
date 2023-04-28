clear
echo -en "\n"
echo "6. mv"

echo -en "\n"
echo "mv stands for 'Move'."
echo -e "\nThis command will move files or directories from one place to another. It has two different functions:\n"
echo -e "\t1.\tIt will rename the file/folder if the destination does not exist."
echo -e "\t2.\tIt will move the files/directory to the specified directory if it does exist."
echo -e "\tThis command, like most that involve modifying files, may require elevated permissions (sudo) to depending on your user permissions." | fold -w100 -s
echo -en "\n"
echo "This is the syntax for the mv command:"
echo -e "\tmv [flags] [source directory/file] [destination directory/file]"
echo -e "\nIf you had a list of files, such as:"
echo -e "\t1.txt\t\t2.txt\t\t3.txt\t\t4.txt"
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
"\t\t\t\t\t\t   overwriting a file. The user must press ‘y’ for confirmation."
"\tmv -f\t\t\t\tby default, the command will ask the user for confirmation when overwriting the"
"\t\t\t\t\t\t   destination file if that file is write-protected. This flag forcefully"
"\t\t\t\t\t\t   overwrites the destination file and deletes the source file."
"\tmv -n\t\t\t\tprevents an existing file from being overwritten if the destination"
"\t\t\t\t\t\t   file already exists."
"\tmv -b\t\t\t\tcreates a backup file for the file being overwritten when"
"\t\t\t\t\t\t   using the mv command. This new file will have a tilde (~) appended to it.")

echo -en "\n"
for ((x = 0; x < ${#flagInfo[@]}; x++)) ; do
    echo -e "${flagInfo[$x]}"
done

echo -en "\n"
read -p "(Press enter to continue.) >" ans
