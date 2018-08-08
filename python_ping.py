#!/usr/bin/env python3

import platform
import subprocess as sp
import sys


def platform_check(os_type):
    if os_type == 'Windows':
        print('win')
    elif os_type == 'Linux':
        print('linux')
    else:
        print('none')

def ping_system(ip,os_type):
    if os_type == 'Windows':
        status,result = sp.getstatusoutput("ping " + ip)
    elif os_type == 'Linux':
        status,result = sp.getstatusoutput("ping -c1 -w2 " + ip)
    else:
        status,result = '127','127'
    if status == 0 and sys.argv[2] == 'd':
        print(result)
        print( str(ip) + " is reachable")
    elif status == 0 and sys.argv[2] == '':
        print(str(ip) + " is reachable")
    elif status != 0 and sys.argv[2] == 'd':
        print(result)
        print(str(ip) + " not reachable")
    else:
        print(str(ip) + " not reachable")

try:
    if len(sys.argv) == 1:
        ip= '172.21.100.16'
    else:
        ip_input = sys.argv[1]
        ip = ip_input
    os_1 = platform.system()
    ping_system(ip,os_1)
except:
    print("kindly use "+  str(sys.argv[0]) + " ip address")
    print("for debug use " + str(sys.argv[0]) + " 127.0.0.1  d")



