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
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4(dir)"
echo -e "\nand wanted to copy the contents of 1.txt into 4 (which is a directory), you would use the command:" | fold -w100 -s
echo -e "\n\tcp 1.txt 4(dir)"
echo -e "\nIn this case, since 4 is a directory, 1.txt will be copied into the 4 directory under the same name:" | fold -w100 -s
echo -e "\n\t1.txt\t\t2.xt\t\t3.txt\t\t4(dir)"
echo -e "\t//contents of 4\n\t\t1.txt"
	1.txt	2.txt	3.txt	4

read -p "(Press enter to continue.) >" ans

