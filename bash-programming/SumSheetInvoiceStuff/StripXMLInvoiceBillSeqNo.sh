#!/bin/bash
IFS='
'
for lF in $*
do
    if [ -f "${lF}" ]
    then
        lFbn=$( basename "${lF}" )
        lFBillSeqno=$( echo "${lFbn}" | sed -e "s/^[A-Z][A-Z]*[0-9][0-9]*\.\([0-9][0-9]*\)\..*/\1/" )
        # lPE=\''s/( BillSeqNo|<Att Ty="CHRRI" Id)="'${lFBillSeqno}'"/${1}="bsno"/g'\'
        lPE=\''s/'${lFBillSeqno}'/bsno/g'\'
        echo "perl -p -i -e ${lPE} \"${lF}\""
        perl -p -i -e 's/( BillSeqNo|<Att Ty="CHRRI" Id)="'${lFBillSeqno}'"/${1}="bsno"/g' "${lF}"
    else
        echo "\"${lF}\" is no file."
    fi
done
if [ "0" == "${#}" ]
then
    echo "Usage: \"$( basename ${0} ) SpaceSeparatedFileNames\""
fi
