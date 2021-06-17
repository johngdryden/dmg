#!/bin/bash
 
folderMakerLocation=$HOME/scripts/portfolio/week2/foldermaker.sh 
folderCopierLocation=$HOME/scripts/portfolio/week2/foldercopier.sh
setPasswordLocation=$HOME/scripts/portfolio/week2/setPassword.sh

$HOME/scripts/portfolio/week2/passwordCheck.sh

exitCode=$?

if [ $exitCode -eq 0 ]; then

    echo -e "1. Create a folder"
    echo -e "2. Copy a folder"
    echo -e "3. Set a password"

    read -p "Please enter 1, 2 or 3: " option

    case $option in
        1)
            $folderMakerLocation
            exit 0
        ;;
        2)
            $folderCopierLocation
            exit 0
        ;;
        3)
            $setPasswordLocation
            exit 0
        ;; 
        *)    
            echo -e "invalid entry please enter option 1, 2 or 3"
            exit 1
    
    esac

else
    echo -e "You have entered the incorrect password - Goodbye"
    exit 1
fi 
exit 0
