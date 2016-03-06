#!/bin/sh

function testFolder {
  TOTAL=0.0
  for file in $@/*.hs
  do
    printf "## $file ##\n"

    TIMEFORMAT=%R
    # TIMETAKEN=$(time (emna -p=z -v=2 --law-dir ../../../../tools/tip-haskell-frontend/src/Tip/Law $file 2>&1 | sed -e ':loop' -e 's/[^]//g' -e 't loop'> ../Output/$file.txt)  2>&1)
    TIMETAKEN=$(time (emna -p=z -v=2 --law-dir ../../../../tools/tip-haskell-frontend/src/Tip/Law $file > output.tmp 2>&1 ) 2>&1)

    ERRORCODE=$?

    cat output.tmp | sed -e ':loop' -e 's/[^]//g' -e 't loop'> ../Output/$file.txt

    # FINISHED=$(grep "Finished" ../Output/$file.txt)

    if [ "$ERRORCODE" -ne "0" ]
    then
      printf '\033[0;31m'
    fi

    printf "$TIMETAKEN\n\n"
    printf '\033[0m'

    TOTAL=$(echo $TOTAL + $TIMETAKEN | bc -l)

  done
  echo "=================="
  echo "Total time: $TOTAL"
  echo "=================="
}

if [ "$#" -eq 0 ]
then
  for folder in */
  do
    testFolder $folder
  done
else
  for arg
  do
    testFolder $arg
  done
fi

rm output.tmp
