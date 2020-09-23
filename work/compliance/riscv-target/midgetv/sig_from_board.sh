#!/bin/bash
exec 4<$1 5>$1
echo G >&5

while [ "$startofreply" != "Don" ]; do
    read reply <&4
    startofreply=${reply:0:3}
    if [ "$startofreply" = "sig" ]; then
        echo "${reply:3}"
    fi
done

#
# During debugging it may be advantageous to replace the above while-loop with:
# 
#while [ "$startofreply" != "Don" ]; do
#    read reply <&4
#    echo "${reply}"
#done

