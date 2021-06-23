
#!/bin/bash 
      
# Get info about networking from the ifconfig command 
      
net_info="$(ifconfig)" 
      
# Parse out the ip address lines using sed 
      
addresses=$(echo "$net_info" | sed -n '/inet / { 
      s/inet/IP Address:/ 
      s/netmask/\n\t\tSubnet Mask:/ 
      s/broadcast/\n\t\tBroadcast Address:/ 
      p 
}') 
      
# Format output 
      
echo -e "IP addresses on this computer are:\n$addresses" 

exit 0
