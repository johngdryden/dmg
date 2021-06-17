
       #!/bin/bash 
      
secret='shhh' #Don't tell anyone! 
read -s -p "what's the secret code?" REPLY    
#if the user types in the correct secret, tell them they got it right! 

if [ "$secret" = $REPLY ]; then 
    echo -e "\nYou got it right!" 
    correct=true  
else 
    echo -e "\nYou got it wrong :("
    correct=false 
fi
      
echo 
      
case $correct in 
      
    false)
        echo "Go Away you Dirty Rat!"
        exit 1  
    ;;  
    true) 
        echo "Champion, you have unlocked the secret menu!"
        exit 0
        #TODO: add a secret menu for people in the know.
    ;;  
esac 
exit 0    