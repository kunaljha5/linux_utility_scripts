#!/bin/bash




###################################################################################################
#####
#####
##### This script will help to create the banner for login, will also share the details of the nodes 
##### This script tracks
#+---------------------------------------------------------------------------------------+
#|                   Username    |                                           kjha        |
#|                       Time    |                   Tue Jul 10 09:53:46 CDT 2018        |
#+-------------------------------+-------------------------------------------------------+
#|            Static hostname    |                                        testbed        |
#|                     Kernel    |               Linux 3.10.0-514.16.1.el7.x86_64        |
#|           Operating System    |                       RHEL Server release 7.4         |
#|                    IP-Addr    |                                  192.168.0.112        |
#|               Product-Name    |                        VMware Virtual Platform        |
#+-------------------------------+-------------------------------------------------------+
#|               Load Average    |                               0.15, 0.27, 0.25        |
#|                Login Users    |                                              2        |
#|                Uptime Days    |                                       427 days        |
#+-------------------------------+-------------------------------------------------------+
#|                  Swap Used    |                                          2.20%        |
#|                   RAM Used    |                                         49.17%        |
#+-------------------------------+-------------------------------------------------------+
###################################################################################################
#####  Owner : Kunal Jha
#####  Github id: kunaljha5
#####  Date: 10/July/2018
#####  Version : 1.0
#####
#####
###################################################################################################

echo "+---------------------------------------------------------------------------------------+"


### set username variable from id command
username=$(id|cut -d')' -f1|cut -d'(' -f2)


### set the date for the timestamp in dt variable
dt=$(date)





####print the username and system date and time


echo -e "Username:$username" |awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
echo "Time-$dt"|awk -F'-' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'

### extract hostnamectl details from system
echo "+-------------------------------+-------------------------------------------------------+"





hostnamectl_func_7()
{

## function for rhel 7 start




#######################################################################
#### hostnamectl command will on run on rhel 7 node types. 
#### here  we will be getting details like below
#+-------------------------------+-------------------------------------------------------+
#|            Static hostname    |                            corp-confluence0a01        |
#|                    Chassis    |                                             vm        |
#|             Virtualization    |                                         vmware        |
#|           Operating System    |                        Oracle Linux Server 7.4        |
#|                     Kernel    |               Linux 3.10.0-514.16.1.el7.x86_64        |
#|               Architecture    |                                         x86-64        |
#+-------------------------------+-------------------------------------------------------+
#######################################################################
hostnamectl | egrep -v "Icon|CPE|ID"| awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'



#######################################################################
#### Storing host ip details in ipdet variable
ipdet=$(hostname -i)
echo "+-------------------------------+-------------------------------------------------------+"

echo "IP-Addr: $ipdet" |awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
#sys_vendor=$(cat /sys/devices/virtual/dmi/id/sys_vendor)
#echo "Sys-Vendor: $sys_vendor"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'

#######################################################################
#### Storing host product name details in product_name variable
product_name=$(cat /sys/devices/virtual/dmi/id/product_name)

echo "Product-Name: $product_name"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'


## function for rhel 7 ended
}


hostnamectl_func_6()
{

## for rhel 6.x
echo "Static hostname:$(hostname)" | egrep -v "Icon|CPE|ID"| awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
os_version=$(cat /etc/redhat-release| cut -d'(' -f1|sed "s|Red Hat Enterprise Linux |RHEL |g")
os_ker_verison=$( uname -r)
ipdet=$(hostname -i)
echo "Kernel:Linux $os_ker_verison" |awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
echo "Operating System:$os_version" |awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
echo "IP-Addr: $ipdet" |awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'
#sys_vendor=$(cat /sys/devices/virtual/dmi/id/sys_vendor)
#echo "Sys-Vendor: $sys_vendor"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'


product_name=$(cat /sys/devices/virtual/dmi/id/product_name)

echo "Product-Name: $product_name"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;96m%40s\t\033[0m|\n",$1,$2}'


}
hostnamectl_func_6
echo "+-------------------------------+-------------------------------------------------------+"

#######################################################################
#### Storing host uptime days details in uptime_days variable



uptime_days=$(uptime|cut -d, -f1| awk -F'p' '{print $2}'|sed "s|^ ||g")

#######################################################################
#### Storing host logged in users count in logged_in variable



logged_in=$(uptime|cut -d, -f3| awk '{print $1}')



#######################################################################
#### Storing host load average in load_avg variable

load_avg=$(uptime| grep load| cut -d':' -f5)

echo "Load Average: $load_avg"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'
echo "Login Users: $logged_in"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'
echo "Uptime Days: $uptime_days"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'
echo "+-------------------------------+-------------------------------------------------------+"






mem_space_usage()
{



#### Memory usage
Mem_used=$(free -m | grep "^Mem"| awk '{printf "%0.2f%\n", ($3/$2)*100}')
swap_used=$(free -m | grep "^Swap"| awk '{printf "%0.2f%\n", ($3/$2)*100}')

echo "Swap Used: $swap_used"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'
echo "RAM Used: $Mem_used"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'

echo "+-------------------------------+-------------------------------------------------------+"


}

mem_space_usage

run_level()
{
who -r | awk '{print $2}' | sed "s|^|Run Level:|g"|awk -F':' '{printf "|\t\033[01;92m%20s\t\033[0m|\t\033[01;91m%40s\t\033[0m|\n",$1,$2}'
echo "+-------------------------------+-------------------------------------------------------+"

}
run_level



