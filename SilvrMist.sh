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
echo "   Version 1.0"
echo "  Coded by: Blkzer0 "
echo ""
echo ""
                                                 

    echo "Installing dhcpcd required to run this script"
    sleep 1
    apt-get install dhcpcd

    #sudo anonsurf myip   <--##Uncomment only if you have Anonsurf, flag is used to retreive your external ip address for quick verification.
    sleep 1
    echo  "Checking Interface.."
    iwconfig
    sleep 3
    read -p "what is the interface?" interface
    ifconfig $interface down
    macchanger -r $interface
    sleep 2
    ifconfig $interface up
    echo "interface has been changed"

    read -p "Select the interface to renew:" interface
    read -p  "Input a valid ip:" ip
    dhcpcd -k $interface ; sleep 4s; dhcpcd -r $ip -l 1000 $interface

    echo "IP should be changed now"
    sleep 1
    echo "Verifying ip has been changed"
    sleep 1
    #anonsurf myip <--##Uncomment only if you have Anonsurf, flag is used to retreive your external ip address for quick verification.
    sleep 3
    firefox https://dnsleaktest.com

        exit
