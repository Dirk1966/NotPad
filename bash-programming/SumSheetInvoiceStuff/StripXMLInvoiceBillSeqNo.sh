#!/bin/bash
IFS='
'
for lF in $*
do
    if [ -f "${lF}" ]
    then
        lFbn=$( basename "${lF}" )
        lFBillSeqno=$( echo "${lFbn}" | sed -e "s/^[A-Z][A-Z]*[0-9][0-9]*\.\([0-9][0-9]*\)\..*/\1/" )
        # echo "${lFBillSeqno} ${lFbn} ${lF}"
        # lCmd="perl -p -i -e 's/ BillSeqNo=\"${lFBillSeqno}\"/ BillSeqNo=\"bsno\"/g; s/^<Att Ty="CHRRI" Id=\"${lFBillSeqno}\" \/>$/<Att\ Ty="CHRRI"\ Id=\"bsno\" \/\>/g' \"${lF}\""
        lCmd='perl -p -i -e '\''s/ BillSeqNo="'${lFBillSeqno}'"/ BillSeqNo="bsno"/g; s/^<Att Ty="CHRRI" Id="'${lFBillSeqno}'" \/>$/<Att Ty="CHRRI" Id="bsno" \/>/g'\'' "'${lF}'"'
        echo "${lCmd}"
        # exec ${lCmd}
        # $(${lCmd})
        perl -p -i -e 's/ BillSeqNo="'${lFBillSeqno}'"/ BillSeqNo="bsno"/g; s/^<Att Ty="CHRRI" Id="'${lFBillSeqno}'" \/>$/<Att Ty="CHRRI" Id="bsno" \/>/g' "${lF}"
    else
        echo "\"${lF}\" is no file."
    fi
done
if [ "0" == "${#}" ]
then
    echo "Usage: \"$( basename ${0} ) SpaceSeparatedFileNames\""
fi
