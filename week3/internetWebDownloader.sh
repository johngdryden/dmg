#!/bin/bash
purpleColour="\033[35m"
default="\e[0m\033[49m"

unset urlToSave
echo -ne $purpleColour"\nEnter the URL to download or type 'exit' to quit: "
read urlToSave

until [[ $urlToSave =~ ^[Ee][Xx][Ii][Tt] ]] ; do

    echo -en $purpleColour"Where would you like to save the file? "
    read saveLocation
    echo -en $default"\n"

    eval wget $urlToSave --directory-prefix $saveLocation

    if [[ $? = 0 ]] ; then
        echo -e "\033[42mFile Downloaded!\033[49m\n"
    else
        echo -e "\n\033[41mError downloading file. Please try again.\033[49m\n"
    fi

    echo -ne $purpleColour"Please enter the URL of a file to download or type 'exit' to quit: "
    read urlToSave

done 
