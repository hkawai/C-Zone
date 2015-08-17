#!/bin/bash
InputFile=$1;

#IPアドレスを【IP】に変換
cat $InputFile | sed 's/[0-9]\+\(\.[0-9]\+\)\{3\}/【IP】/g'

#Port(5桁)を【Port】に変換
cat $InputFile | sed 's/Port[0-9]\{5\}/【Port】/g;s/Port[0-9]\{4\}/【Port】/g;s/Port[0-9]\{3\}/【Port】/g;s/Port[0-9]\{2\}/【Port】/g;s/Port[0-9]\{1\}/【Port】/g'
cat $InputFile | sed 's/\(ランダムポート\)/【Port】/g'

#日時を【Day】【Time】に変換
cat $InputFile | sed 's/201[0-9]-[0-9][0-9]-[0-9][0-9]/(DAY)/g' | sed 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9]/(TIME)/g' | sed 's/[0-9]:[0-9][0-9]:[0-9][0-9]/(TIME)/g'

#定型文を【-----】に変換
-----------------------------------------------
#!/bin/bash
InputFile=$1;
cp $InputFile tmp
FilerList=$2;

while read str
do
    echo "$str";
    cat tmp | sed 's/'$str'/-----/g' > tmp2
    cp tmp2 tmp
done < $FilerList
-----------------------------------------------

#スペース、全角スペース、タブを除く
cat $InputFile | sed 's/\t//g;s/ //g;s/　//g'

#ソートして見やすくして、重複を除く
cat $InputFile | sort | uniq
