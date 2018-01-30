#!/bin/bash

#TODO: https://archive.is/TRzn4 Rewrite structure with getops

#Set default values
FORMID=$(sed -n 's/FORMID: //p' formdata.conf); #like grep, but with different syntax.
FIELDNUM=$(sed -n 's/FIELDNUM: //p' formdata.conf); #looks for everything matching "Everything after FIELDNUM:"
FIELDS[0]=$(sed -n 's/FIELDS: //p' formdata.conf);

for ((i=0;i<$FIELDNUM;i++)) #for some reason bash requires the (()) for for loops idk why
do
  #FIELDS[0]=$(sed -n 's/FIELDS[${i}]: //p' formdata.conf);
  read -p "Field value $i: " VALUES[$i]
done;


for ((i=0;i<${#FIELDS[*]};i++))
do
  echo "Done $i out of ${#FIELDS[*]}";
  curl https://docs.google.com/forms/d/$FORMID/formResponse -d ifq -d entry.${FIELDS[$i]}="${VALUES[$i]}" -d submit=Submit > /dev/null;
done;
