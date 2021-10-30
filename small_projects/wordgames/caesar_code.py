#!/usr/bin/python
#

from sys import argv

z=ord('z')

def add_caesar(crypto,number):
    result=""
    for c in crypto:
        if c != ' ':
            x=ord(c)+number
            if x > z: x=x-26
            result+=chr(x)
        else:
            result+=c
    return result

if __name__ == "__main__":
    crypto=list(argv[1].lower())
    print(crypto)
    for i in range(1,26):
        print(add_caesar(crypto,i))
