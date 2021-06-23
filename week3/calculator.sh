#Var declaration
unset x
unset y

#Colour schemes
blue="\033[34m"
green="\033[32m"
red="\033[31m"
purple="\033[35m"
default="\e[0m"

numRegEx=^[0-9]+$

echo -e $purple"Bash Calculator
Please select one of the following operations:"$default"
1. Addition ($blue"+"$default)
2. Subtraction ($green"-"$default)
3. Multiplication ($purple"\*"$default)
4. Division ($red"/"$default)\n"

echo -en $purple"Selected operator: "
read choice
echo -en $default

case $choice in
    1 | + | [Aa]ddition | [Aa]dd) 
        operator=\+
        operation=add
        textColour=$blue
    ;;
    2 | - | [Ss]ubtraction | [Ss]ubtract | [Mm]inus )
        operator=\-
        operation=subtract
        textColour=$green
    ;;
    3 | [\*] | [Mm]ultiplication | [Mm]ultiply | [Tt]imes)
        operator=\*
        operation=multiply
        textColour=$purple
    ;;
    4 | / | [Dd]ivision | [Dd]ivide)
        operator=\/
        operation=divide
        textColour=$red
    ;;
    *)
        echo -e $red"\nError: Invalid Entry!"$default
        exit 1
esac

echo -ne $purple"\nPlease enter two numbers, \"x\" and \"y\", to"$textColour $operation $purple"seperated by a space: "
read x y

if [[ -z $x || -z $y || ! $x =~ $numRegEx || ! $y =~ $numRegEx ]] ; then
    echo -en $red"\nError: Invalid entry - I need Numbers!\n"$default
    exit 1
fi

result=`echo "scale=2; $x "$operator" $y" | bc`

echo -e $purple"\nAnswer:$textColour" $result"$default"

exit 0
