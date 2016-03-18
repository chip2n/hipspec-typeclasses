#!/bin/sh

scriptDir=$(dirname -- "$(readlink -e -- "$BASH_SOURCE")")
lawDir=$scriptDir/../tools/tip-haskell-frontend/src/Tip/Law
evalDir=$scriptDir/src/Evaluation/Example

function runEmna() {
    emna -p=z -v=2 --law-dir $lawDir "$@"
    #emna -p=z -v=2 "$@"
}

function testFolder {
  TOTAL=0.0
  for dir in $@; do
    for file in $dir/*.hs; do
      echo $dir
      filename=$(basename $file)
      dirname=$(basename $dir)
      printf "## $dirname/$filename ##\n"

      TIMEFORMAT=%R
      TIMETAKEN=$(time (runEmna $file > output.tmp 2>&1 ) 2>&1)

      ERRORCODE=$?

      # create output directory if it doesn't exist
      mkdir -p $scriptDir/Output/$dirname

      # print output to output directory
      cat output.tmp | sed -e ':loop' -e 's/[^]//g' -e 't loop'> $scriptDir/Output/$dirname/$filename.txt

      # FINISHED=$(grep "Finished" ../Output/$file.txt)

      if [ "$ERRORCODE" -ne "0" ]
      then
        printf '\033[0;31m'
      fi

      printf "$TIMETAKEN\n\n"
      printf '\033[0m'

      TOTAL=$(echo $TOTAL + $TIMETAKEN | bc -l)

    done
  done
  echo "=================="
  echo "Total time: $TOTAL"
  echo "=================="
}

cd src

if [ "$#" -eq 0 ]
then
  for folder in "$evalDir/*/"
  do
    testFolder $folder
  done
else
  for arg
  do
    testFolder $(realpath ../$arg)
  done
fi

rm output.tmp
