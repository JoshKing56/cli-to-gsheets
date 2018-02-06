#!/bin/bash

#TODO: https://archive.is/TRzn4 Rewrite structure with getops

CONFFILE="formdata.conf"
if [ -n $1 ]; then #-n says "if string is not zero"
    CONFFILE=$1;
fi

#Read from conf file
FORMID=$(sed -n 's/FORMID: //p' formdata.conf); #like grep, but with different syntax.
FIELDNUM=$(sed -n 's/FIELDNUM: //p' formdata.conf); #looks for everything matching "Everything after FIELDNUM:"
FIELDS[0]=$(sed -n 's/FIELDS: //p' formdata.conf);

for ((i=0;i<$FIELDNUM;i++)) #for some reason bash requires the (()) for for loops idk why
do
    FIELDS[$i]=$(sed -n "s/FIELDS\[$i\]: //p" formdata.conf); #uses the sed command to get values
    VALUES[$i]=$(sed -n "s/VALUE\[$i\]: //p" formdata.conf);
done;


ENTRYSTRING="";
for ((i=0;i<$FIELDNUM;i++))
do
    ENTRYSTRING+=" -d entry.${FIELDS[$i]}=${VALUES[$i]}";
done;

curl -s https://docs.google.com/forms/d/$FORMID/formResponse -d ifq$ENTRYSTRING -d submit=Submit > /dev/null;
echo "Done $i out of ${#FIELDS[*]}";
