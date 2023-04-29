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
