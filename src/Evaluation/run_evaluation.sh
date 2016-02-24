#!/bin/sh

for folder in ./*
do
  printf "$folder \n"
  for file in $folder/*.hs
  do
    time emna -p=z -v=2 $file > /dev/null 2> /dev/null
  done
done
