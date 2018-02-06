#!/bin/bash

#while /bin/true; do
    RAWSTRING=$(speedtest-cli --csv);
    for i in {1..8}
    do
        CUTSTRING=$(echo $RAWSTRING | cut -d , -f $i);
        echo $CUTSTRING;
        bash pushtogsheet.sh $CUTSTRING
    done;
