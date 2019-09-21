#!/bin/bash
key='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
num=${#key}
pass=''
for i in {1..8}
do
        index=$[RANDOM%num]
        pass=$pass${key:$index:1}
done
echo $pass

