#/usr/sh
lFilSource="abc-unix-lf"

lFilTarget="abc-test"
cp "${lFilSource}.txt" "${lFilTarget}.txt"
./NotPad.sh "${lFilTarget}.txt"
rm "${lFilTarget}.txt"

lFilTarget="abc test"
cp "${lFilSource}.txt" "${lFilTarget}.txt"
./NotPad.sh "${lFilTarget}.txt"
rm "${lFilTarget}.txt"

