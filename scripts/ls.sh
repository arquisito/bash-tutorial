clear
echo -en "\n"
echo "2. ls"

echo -en "\n"
echo "ls stands for 'List'."
echo "This command will print a list of the files and directories in your current directory."
echo -en "\n"
echo "This is the syntax for the ls command:"
echo "ls [flags] [directory]"

directoryInfo=("You can print the lists of other directories using these commands:"
"ls [path to directory]        	lists files and directories from said directory"
"ls /                          	lists from the root directory"
"ls ..                         	lists from the parent directory before the current one"
"ls ../..                      	lists from the parent directory two steps up"
"ls ~                          	lists from the user's home directory")

flagInfo=("Here are some useful flags for the ls command, which can be used in tandem with the directory shortcuts:"
"ls -d */			lists only directories"
"ls -R				lists all files and directories as well as their subdirectories down to the last file"

for ((x = 0; x < ${#directoryInfo[@]}; x++)) ; do
    echo "${directoryInfo[$x]}"
done

# echo "You can print the lists of other directories using these commands:"
# echo "ls [path to directory]        	lists files and directories from said directory"
# echo "ls /                          	lists from the root directory"
# echo "ls ..                         	lists from the parent directory before the current one"
# echo "ls ../..                      	lists from the parent directory two steps up"
# echo "ls ~                          	lists from the user's home directory"
# echo "Here are some useful flags for the ls command, which can be used in tandem with the previous directory shortcuts to work beyond your present working directory:"
# echo "ls -d */				lists only directories"
# echo "ls -R				lists all files and directories as well as their subdirectories down to the last file"
