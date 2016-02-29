#!/bin/sh

for folder in */
do
  TOTAL=0.0
  for file in $folder/*.hs
  do
    printf "#### $file ####\n"
    TIMEFORMAT=%R
    TIMETAKEN=$(time (emna -p=z -v=2 $file 2>&1 | sed -e :a -e 's/[^#]#//; ta' > ../Output/$file.txt)  2>&1)
    echo $TIMETAKEN
    TOTAL=$(echo $TOTAL + $TIMETAKEN | bc -l)
  done
  echo "Total time: $TOTAL"
done
