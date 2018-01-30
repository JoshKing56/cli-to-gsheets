#!/bin/bash

#TODO: https://archive.is/TRzn4 Rewrite structure with getops

#Set default values
FORMID="1gcF_E81EpBX6DaSV8pBwKeEY6XCBxKLslwtIKwI8WAE";
FIELDNUM=1;
FIELDS[0]=713884440;

echo ""
echo "Enter google form credentials"
#read -p "Form Id (in url): " FORMID
#read -p  "Enter number of fields: " FIELDNUM

#echo "Enter the field names and values. This is your html \"name\" attribute"

for ((i=0;i<$FIELDNUM;i++)) #for some reason bash requires the (()) for for loops idk why
do
#  read -p "Field name $i: " FIELDS[$i]
  read -p "Field value $i: " VALUES[$i]
done;

for ((i=0;i<${#FIELDS[*]};i++))
do
  echo "Done $i out of ${#FIELDS[*]}";
  curl https://docs.google.com/forms/d/$FORMID/formResponse -d ifq -d entry.${FIELDS[$i]}="${VALUES[$i]}" -d submit=Submit > /dev/null;
done;
