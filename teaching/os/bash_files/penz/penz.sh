#!/bin/bash

db=0
osszeg=0

for penz in $* ; do
  if [[ penz -gt 0 ]] ; then
    let db=db+1
    let osszeg=osszeg+penz
  fi
done

echo $db
echo $osszeg
