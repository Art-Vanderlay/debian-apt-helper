#!/bin/bash

# make file and directory if not there
    if [ ! -d ~/db-apt-helper ]; then
	mkdir -p ~/db-apt-helper
        touch ~/db-apt-helper/remove-all.sh
            printf "sudo apt-get remove --purge " > ~/db-apt-helper/remove-all.sh

    elif [ ! -f ~/db-apt-helper/remove-all.sh ]; then
        touch ~/db-apt-helper/remove-all.sh
            printf "sudo apt-get remove --purge " > ~/db-apt-helper/remove-all.sh

    else restart
fi

#######################

# start loop
restart() {

clear
echo ""
echo ""
echo "--------------------------------------------------"
echo ""
echo "* * * APT Helper for debian based distros:   * * *"
echo ""
echo "--------------------------------------------------"
echo ""
echo "Search package name or keyword:"
echo ""
echo "Ctrl & C to exit:"
echo ""
echo ""

# take user input and search repos for keyword
    read input

        case "$input" in

        [0-9A-Za-z]* ) sudo apt-cache search $input | grep $input ;;
        * ) echo "please enter again"
            sleep 2s
                restart ;;
        esac

#######################

# install menu
echo ""
echo "-------------------------------------------------"
echo ""
echo "Enter the app to install or press enter to go back"
echo ""
echo "-------------------------------------------------"
echo ""

    read second
    
    case "$second" in

        [0-9A-Za-z]* ) inst ;;
        * ) restart ;;
        esac         
}

#######################

# "inst" variable used above ^^
inst() {

sudo apt-get install $second
printf '%s' "$second " >> ~/db-apt-helper/remove-all.sh

}

restart
