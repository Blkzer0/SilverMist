# SilvrMist
Script changes your dynamic ip address. If you have a dynamic ip address that you want changed thru linux terminal, 
this script does exactly that. You must be sure that You Have a Dynamic IP Address or this script may not work.
I noticed that you cant use this script too often as sometimes you'd get the same ip as you already have. 

You Must be connected via LAN directly to your modem or you'll end up asking your router for new ip.
Script Requirements: dhcpcd

+ -k flag is for lan interface.
+ sleep flag is for interface to sleep for 4 segments.
+ -r flag is to request this address, which in turn the ISP will give you new one. It can be any ip as long as its a valid one.
+ -l flag is amount of time for you new lease.
+ eth0 is the lan interface that is connected directly to modem, make sure to check with ifconfig for right #interface.
+ make sure to have dhcpcd installed.
+ make sure to have mac address spoofed or you will receive a error.

- If you lose internet connection, make sure you make the following changes:
- (change interface from dhcp to static in /etc/network/interface/).
- (change router settings from dynamic to static).
- (make sure to change dns to 8.8.8.8 in /etc/resolv.conf).

# Use At Your Own Risk!!
