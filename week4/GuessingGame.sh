#!/bin/bash 
      
finalNum=42
msg="Please type a number between 1 and 100"
lowNum=1
maxNum=100

      
printError()
{       
    echo -e "\033[31mERROR:\033[0m $1" 
} 
            
getNumber() 
{       
    read -p "$1: " number 
    while (( $number < $2 || $number > $3 )) ; do 
      
        printError "Input must be between $2 and $3" 
        read -p "$1: " number

    done
} 

checkNumber()
{

    while (( $number != $finalNum )) ; do

        if [[ $number -lt $finalNum ]] ; then
            echo "Too Low!"
            getNumber "$msg" $lowNum $maxNum
        else 
            echo "Too High!"
            getNumber "$msg" $lowNum $maxNum
        fi

    done

    echo "Correct!"

}

getNumber "$msg" $lowNum $maxNum
checkNumber
