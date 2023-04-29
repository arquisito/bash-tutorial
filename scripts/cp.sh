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

read -p "(Press enter to continue.) >" ans

echo -e "\nIf you had the same list of files, but instead of only copying 1.txt into 4, you wanted to copy 2.txt and 3.txt as well, you would use the command:" | fold -w100 -s
echo -e "\n\tcp 1.txt 2.txt 3.txt 4"
echo -e "\nIn this case, all the specified files will be copied into the 4 directory:" | fold -w100 -s
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4"
echo -e "\n\t//contents of 4\n\t\t1.txt\t2.txt\t3.txt"

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
