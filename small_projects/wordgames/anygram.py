#!/usr/bin/python
#
# dnf install aspell aspell-en
# ./create_word_list.sh
# ./anygram.py maple 4|sort|comm -1 -2 wordlist -
#
# ./anygram.py maple 3|sort|uniq|more
#

from sys import argv

def wordToList(word):
    return sorted(list(word))

def anyGram(word,letList,letPick):
    if letPick<=0:
        print word
        return
    for x in range(len(letList)):
        anyGram(word+letList[x],
                letList[:x]+letList[(x+1):],
                letPick-1)
        
    

if __name__ == "__main__":
    myList=wordToList(argv[1])
    myLen=int(argv[2])
    if len(myList) < myLen:
        myLen=len(myList) 
    anyGram("",myList,myLen)
