green="\033[32m"
red="\033[31m"
default="\e[0m"

inputFile=$HOME/scripts/portfolio/week3/filenames.txt        

if [ ! $1 ] ; then 
    source=$inputFile
else
    source=$1
fi

if [[ ! -e $source ]] ; then
    echo -en $red"\nCan't find file \""$source\""!\n"$default
    exit 1
elif [[ ! -r $source ]] ; then
    echo -en $red"\nCan't read file \""$source\""!\n"$default
    exit 1
fi

readarray fileNames < $source

echo

for f in ${fileNames[*]} ; do
    if [[ -f $f ]] ; then
        echo $f" - That file exists"
    elif [[ -d $f ]] ; then
        echo $f" - That's a directory"
    else
        echo $f" - I don't know what that is!"

fi

done
