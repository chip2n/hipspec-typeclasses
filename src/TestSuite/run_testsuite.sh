#!/bin/bash

# Colours
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"

function emnaRunFile {
  output=$(emna "$@" 2> /dev/null)
  local status=$?

  # If not exited correctly
  if [ $status -ne 0 ]; then
    echo -e -n "${RED}FAILURE: $@"
  else
    # Correct proof prints "Finished!"
    # If not this is s case we may need to handle differently
    case "$output" in
      *Finished* ) echo -e -n "${GREEN}SUCCESS: $@";;
      * ) echo -e -n "${YELLOW}WARNING: $@";;
    esac
  fi

  # Return colour to normal
  echo -e "\033[0m"
  return $status
}

for file in ./*.hs
do
  emnaRunFile $file
done

