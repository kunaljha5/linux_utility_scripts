#!/bin/bash


#echo "What message you want to show to end user"

while true
do
    echo -e "                 ┌─────────────────────────────────────────────────────────────────────┐
                 │              • \033[01;92mSelect Operation $(hostname)\033[0m  •              │
                 │                                                                     │
                 │ ➤ \033[01;96m1. View indices \033[0m                                                  │
                 │                                                                     │
                 │ ➤ \033[01;96m2. Delete index\033[0m                                                   │
                 │                                                                     │
                 │ ➤ \033[01;96m3. Exit\033[0m                                                           │
                 │                                                                     │
                 │ ➤ \033[01;96m4. Clear\033[0m                                                          │
                 └─────────────────────────────────────────────────────────────────────┘"

    echo -ne  "Enter your choice: "
    read  input_user
#   echo $input_user
	
	case $input_user in
			1)
					echo "View indices command will be executed shortly."
					curl 'localhost:9200/_cat/inices?v'
					echo "View indices Operation ended"
					;;
			2)
					echo -ne "Enter the Index name that needs to \033[01;91mdeleted\033[0m: "
					read input_index
					echo "Delete index command will be executed shortly for $input_index."
					curl -XDELETE 'localhost:9200/$input_index/'
					echo "Delete index Operation ended for $input_index"
					;;
			3)
					echo "Exiting the script."
					exit
					;;
			4)
					clear
					;;
			*)
					echo "Enter a valid option"
					;;
	esac

done

