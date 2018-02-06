#!/bin/bash

while /bin/true; do
    cp formtemplate.conf formdata.conf;
    echo "" >> formdata.conf;

    RAWSTRING=$(speedtest-cli --csv);
    FIELDS=(701604493 40350831 761314166 1882583532 1039993291 1098080092 958097284 2132018028)
    PUSHSTRING=""
    for i in {1..8}
    do
        CUTSTRING=$(echo $RAWSTRING | cut -d , -f $i);
        PUSHSTRING="FIELDS[$(expr $i - 1)]: ${FIELDS[$(expr $i - 1)]}\nVALUE[$(expr $i - 1)]: $CUTSTRING";
        echo -e $PUSHSTRING >> formdata.conf
    done;

    bash pushtogsheet.sh

    sleep 5m;

done;
