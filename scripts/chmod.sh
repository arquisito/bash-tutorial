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
