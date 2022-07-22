#a small utility which lets the user create a port forward for a jail. Must be run inside the jail. 
pkg install bash
#gets user input and saves it in 2 variables.
echo "!!!this script is only to be run INSIDE the jail.!!!"
echo "Which port does the application expect ? 32400 for plex"
read from
echo "From which port do you want to reach the jail 80 for access with browser."
read to

#implements the variables into the ipfw config file
echo firewall_enable="YES" >> /etc/rc.conf
echo firewall_type="/media/ipfw_rules" >> /etc/rc.conf
echo "add 100 fwd 127.0.0.1,$from tcp from any to any $to in" >> /media/ipfw.rules
ipfw add 100 fwd 127.0.0.1,$from tcp from any to any $to in
