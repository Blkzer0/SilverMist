#!/bin/bash

 #Needs to run as root!!
if [[ $EUID -ne 0 ]]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

echo "  _______ __ __            ___ ___ __       __   "
echo " |   _   |__|  .--.--.----|   Y   |__.-----|  |_ "
echo " |   1___|  |  |  |  |   _|.      |  |__ --|   _|"
echo " |____   |__|__|\___/|__| |. \_/  |__|_____|____|"
echo " |:  1   |                |:  |   |              "
echo " |::.. . |                |::.|:. |              "
echo " |-------'                |--- ---'              "
echo "   Version 1.1"
echo "  Coded by: Blkzer0 "
echo ""
                                                 
    echo "Installing dhcpcd required to run this script"
    sleep 1
    apt-get install dhcpcd macchanger

    echo " You're ip is:"
    curl ipinfo.io/ip
    sleep 1
    echo  "Checking Interface.."   #target interface should be of your LAN such as eth0.
    iwconfig
    read -p "what is the interface?" interface
    ifconfig $interface down
    macchanger -r $interface
    ifconfig $interface up
    echo "interface has been changed"

    read -p  "Input a valid ip:" ip #(You need to enter either your ip or any other as long as its valid)
    dhcpcd -k $interface ; sleep 4s; dhcpcd -r $ip -l 1000 $interface
    
    echo "Verifying ip has been changed"
    echo " You're ip is:"
    curl ipinfo.io/ip
    	exit
