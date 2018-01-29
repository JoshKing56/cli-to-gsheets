#!/bin/bash
echo ""
echo "Enter google form credentials"
read -p "Form Id (in url): " FORMID
read -p  "Enter number of fields: " FIELDNUM

echo "Enter the field names and values. This is your html \"name\" attribute"

  for ((i=0;i<$FIELDNUM;i++)) #for some reason bash requires the (()) for for loops idk why
  do
    read -p "Field name $i: " FIELDS[$i]
    read -p "Field value $i: " VALUES[$i] 
  done;

  for ((i=0;i<${#FIELDS[*]};i++))
  do
    echo "Done $i out of ${#FIELDS[*]}"
    curl https://docs.google.com/forms/d/$FORMID/formResponse -d ifq -d entry.$FIELDS[$i]=$VALUES[$i] submit=Submit
done;
