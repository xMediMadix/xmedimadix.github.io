#!/bin/bash

#inicializalunk ket valtozot amelyben eltaroljuk a darabszamot es a beadott penzek osszeget
db=0
osszeg=0

#ciklussal bejarjuk a parancssori parametereket
for penz in $* ; do
  #csak akkor kell figyelembe vennunk, ha a penz pozitiv
  if [[ penz -gt 0 ]] ; then
    #ekkor noveljuk a darabszamot
    let db=db+1
    #illetve az eddigi osszeghez hozzaadjuk az uj penz osszeget
    let osszeg=osszeg+penz
  fi
done

#kiirjuk a megfelelo adatokat
echo $db
echo $osszeg
