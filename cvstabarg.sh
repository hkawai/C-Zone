#!/bin/bash
FILE=$1;
LineNumber=0;
while read -r LINE; do
    eval ARRAYa=("$LINE")
        ArgNumber=0;
for array in "${ARRAYa[@]}"
do
        eval ARRAY${ArgNumber}${ArgNumber}=\$array;
        ArgNumber=$(( ArgNumber + 1 ))
done
        LineNumber=$(( LineNumber + 1 ))
done < <(sed -e "s/'/'\\\\''/g" -e "s/\t/'\t'/g" -e "s/^/'/" -e "s/$/'/" "$FILE")
#カンマ区切りのファイルを入力としたい場合はここを-e "s/,/'\t'/g"


x=0;
y=0;
  eval echo "\$ARRAY${x}${y}"
x=1;
y=1;
  eval echo "\$ARRAY${x}${y}"

exit;

for (( x = 0; x <= 5; x++ )) {
 for (( y = 0; y <= 5; y++ )) {
  RESULT=`eval echo \$ARRAY2${x}${y}`
  echo $RESULT
 }
}
