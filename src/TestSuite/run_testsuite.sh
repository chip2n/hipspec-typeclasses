#!/bin/bash

# Colours
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"

function printFail {
  echo -e -n "${RED}FAILURE: $1"
}

function printSuccess {
  echo -e -n "${GREEN}SUCCESS: $1"
}

function printWarning {
  echo -e -n "${YELLOW}WARNING: $1"
}

function emnaRunFile {
  output=$(emna "$1" 2> /dev/null)
  local status=$?
  local returnVal=0

  # If not exited correctly
  if [ $status -ne 0 ]; then
    printFail $1
    returnVal=1
  else
    # Correct proof prints "Finished!"
    # If not this is s case we may need to handle differently
    case "$output" in
      *Finished* )
        printSuccess $1
        returnVal=0
        ;;
      * )
        printWarning $1
        returnVal=2
        ;;
    esac
  fi

  # Return colour to normal
  echo -e "\033[0m"
  return $returnVal
}

function testFolder {
  printf "\nNow running $1 tests\n----------------------\n"
  fileCntr=0
  passCntr=0
  for file in $@/*.hs
  do
    fileCntr=$((fileCntr+1))
    emnaRunFile $file
    if [ $? -eq 0 ]; then
      passCntr=$((passCntr+1))
    fi
  done
  printf "Passed $passCntr out of $fileCntr tests\n"
}

if [ $# -ne 0 ]; then
  for arg
  do
    case "$arg" in
      Core )
        testFolder Core
        ;;
      Pass )
        testFolder Pass
        ;;
      Fail )
        testFolder Fail
        ;;
    esac
  done
else
  testFolder Core
  testFolder Pass
  testFolder Fail
fi
