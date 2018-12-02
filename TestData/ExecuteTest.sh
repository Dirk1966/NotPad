#!/bin/bash
echo "file \"CreateTestData-with-bash.sh\""
file "CreateTestData-with-bash.sh"
./CreateTestData-with-bash.sh
lFileList="cr.txt lf.txt crlf.txt lfcr.txt GermanSpecialCharacters.txt"
for lF in $lFileList
do
   echo "file \"$lF\""
   file "$lF"
done

# Inside of \"\", in the message, you have to escape the backspaces
# This works in   sed -n -e s/\\r/\\n/pg cr.txt
#   the command   sed -n -e "s/\r/\n/pg" cr.txt
#          line:  sed -n -e "s/\\r/\\n/pg" cr.txt
echo "sed -n -e s/\\\\r/\\\\n/pg cr.txt"
sed -n -e s/\\r/\\n/pg cr.txt
echo "sed -n -e \"s/\\\\r/\\\\n/pg\" cr.txt"
sed -n -e "s/\r/\n/pg" cr.txt
echo "sed -n -e \"s/\\r/\\n/pg\" cr.txt"
sed -n -e "s/\\r/\\n/pg" cr.txt

T=7
A=""
while [ "0" -lt "${T}" ] && [ "z" == "z${A}" ]
do
   echo -n -e "\r${T}: Press ctrl-c to not delete test files."
   T=$((${T}-1))
   read -t 1 -n 1 -s A
done
echo -n -e "\r                                                 \r"

echo "Remove test files:"
for lF in $lFileList
do
   echo "rm \"$lF\""
   rm "$lF"
done
