#!/bin/bash

# letrehozunk ket valtozot amelyben eltaroljuk a paros szamok osszeget es a paratlan szamok szorzatat
parosOsszeg=0
paratlanSzorzat=1

# for ciklussal bejarjuk elemenkent a parancssorban megadott szamokat
for i in $* ; do
  # ellenorizzuk, hogy az aktualis szam paros-e (azaz 2-vel osztva 0-t ad-e maradekul)
	if (( $i % 2 == 0 )) ; then
	  # ha paros akkor noveljuk az osszeget
		let parosOsszeg=$parosOsszeg+$i
	else
	  # ha paratlan akkor a szorzatot noveljuk
		let paratlanSzorzat=$paratlanSzorzat*$i
	fi
done

# vegul kiirjuk az eredmenyeket
echo $parosOsszeg
echo $paratlanSzorzat
