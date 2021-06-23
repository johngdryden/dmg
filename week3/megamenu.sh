#!/bin/bash

checkPW=$HOME/scripts/portfolio/week3/passwordCheck.sh
folderMaker=$HOME/scripts/portfolio/week3/foldermaker.sh
folderCopy=$HOME/scripts/portfolio/week3/folderCopier.sh
passwordSet=$HOME/scripts/portfolio/week3/setPassword.sh
calculator=$HOME/scripts/portfolio/week3/calculator.sh
checkFile=$HOME/scripts/portfolio/week3/filenames.sh
fileDownload=$HOME/scripts/portfolio/week3/downloader.sh

maximumAttempts=3
currentAttempts=0

blue="\033[34m"
green="\033[32m"
red="\033[31m"
purple="\033[35m"

bold="\e[1m"
underline="\e[4m"
default="\e[0m"

checkPassword()
{
    $checkPW       
    passwordResult=$?           
    let currentAttempts++
    while [[ $passwordResult -eq 1 && $currentAttempts -lt $maximumAttempts ]] ; do

        echo -e "\nInvalid password. Attempt "$green$currentAttempts$default "of "$red$maximumAttempts$default". Please try again...\n"
        $checkPW
        passwordResult=$?
        let currentAttempts++

    done

    return $passwordResult
}

runMenu()
{

while [[ ! $optionSelected = "8" ]] ; do

    echo -e $underline"\nPlease select a number from the list below:"$default"
    "$bold$purple"1. "$default$underline"Create a folder"$default"
    "$bold$blue"2. "$default$underline"Copy a folder"$default"
    "$bold$green"3. "$default$underline"Set a password"$default"
    "$bold$purple"4. "$default$underline"Calculator"$default"
    "$bold$green"5. "$default$underline"Check Filenames"$default"
    "$bold$purple"6. "$default$underline"Download a file"$default"
    "$bold$blue"7. "$default$underline"Exit\n""$default"
    read -p "Choice: " optionSelected
    case $optionSelected in      
        1)
            isInputrequired=0
            runScript $folderMaker
        ;;
        2)
            isInputrequired=0
            runScript $folderCopy
        ;;
        3)
            isInputrequired=0
            runScript $passwordSet
        ;;
        4)
            isInputrequired=0
            runScript $calculator
        ;;
        5)
            isInputrequired=1
            echo -ne $green"\nPlease enter the full path to a text file containing file and folder names, or hit enter to accept the default: "
            read pathToFile
            runScript $checkFile $pathToFile
        ;;
        6)
            isInputrequired=1
            runScript $fileDownload
        ;;
        7 | [Ee][Xx][Ii][Tt])
            echo -e "\nGoodbye!\n"
            exit 0
            
        ;;
        *)
            echo -e "\nInvalid entry. Select inputs from 1 to 8 or type "$bold$purple"Exit"$default" to quit\n"
    esac

done

}

runScript()
{
$@
while [[ $? -ne 0 ]] ; do

    if [ $isInputrequired -eq 0 ] ; then
        echo -en $red"\nThe script encountered an error.\n"$default
        echo -en "\nPress "$green"\"r\""$default" to run it again or "$red\""m\""$default" to return to the main menu: "
        read userChoice
    else
        echo -en $red"\nThe script encountered an error.\n"$default
        echo -en $red"Returning to main menu as called script requires user input.\n"$default
        return
    fi

    case $userChoice in

        [Mm])
            return
        ;;
        [Rr])
            $@
        ;;
        *)
            echo -e $red$bold"\nInvalid input. Returning to main menu\n"$default
            return
    esac

done

}

echo -e $bold$underline$blue"\nWelcome to Mega Menu!\n"$default

checkPassword   
if [[ $passwordResult -eq 1 ]]; then     
    echo -e $red$bold"\nToo many failed password attempts! Exiting script.\n"$default
    exit 1
else
    runMenu                       
fi

exit 0
