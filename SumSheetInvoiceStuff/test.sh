#!/bin/bash
cp SUM22685917.20817.1.1.0.xml.original SUM22685917.20817.1.1.0.xml
lSizeB=$(stat --format="%s" SUM22685917.20817.1.1.0.xml)
# 1st lCmd construction just to test for variable scripts.
lCmd='./StripXMLInvoiceBillSeqNo.sh SUM22685917.20817.1.1.0.xml'
echo "${lCmd}"
${lCmd}
# 1st lCmd construction end.
# 2nd lCmd construction just to test for variable scripts.
lCmd='stat --format="%s" SUM22685917.20817.1.1.0.xml'
# echo "${lCmd}"
# $(${lCmd}) gives "913" instead of 913, therefore the sed.
lSizeA=$(${lCmd} | sed -e 's/\"//g')
# 2nd lCmd construction end.
lDiff=$(( ${lSizeA} - ${lSizeB} ))
# echo "lSizeB=${lSizeB}, lSizeA=${lSizeA}, lDiff=${lDiff}."
if [ "-6" == "${lDiff}" ]
then
    echo "Test success!"
else
    echo "Test failure!"
fi
rm SUM22685917.20817.1.1.0.xml
