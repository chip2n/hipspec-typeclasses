#!/bin/bash

function emnaRunFile {
  output=$(emna "$@" 2> /dev/null)
  local status=$?

  if [ $status -ne 0 ]; then
    echo -e -n "\033[0;31mFAILURE: $@"
  else
    case "$output" in
      *Finished* ) echo -e -n "\033[0;32mSUCCESS: $@";;
      * ) echo -e -n "\033[0;33mWARNING: $@";;
    esac
  fi

  echo -e "\033[0m"
  return $status
}

for file in ./*.hs
do
  emnaRunFile $file
done

