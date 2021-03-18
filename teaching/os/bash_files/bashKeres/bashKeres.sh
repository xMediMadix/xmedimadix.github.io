#!/bin/bash

# ellenorizni, hogy a megadott parancssori parameter konyvtar-e ezt a -d kapcsoloval tehetjuk meg
# viszont mi abban az esetben, ha nem konyvtart adtak meg, hibakoddal szeretnenk kilepni.
# '!'-hasznalva tudjuk megmondani, hogy abban az esetben ha NEM konyvtarat adtak meg akkor lepjen ki a program 31-es hibakoddal
if [[ ! -d $1 ]] ; then
	exit 31
fi

# Ha letezett a megoldas.txt fajl ekkor ujrairjuk a tartalmat,
# hogy az elso sor legyen a Megoldas: string
w# Ha nem letezett a fajl, akkor letrehozza elobb
echo "Megoldas:" > megoldas.txt

# Ne feledjuk, hogy a megadott mappat kell bejarni, es nem azt a konyvtarat, amelyben a szkript futtatva lett,
# ezert a $1/- mappan belul jarjuk be es csak a .txt kiterjesztesu fajlokat, amelyeknek nem szamit a nevuk,
# csak a kiterjesztesuk, igy egyben: $1/*.txt
for file in $1/*.txt ; do
  # az egrep soronkent ellenorizi, hogy hany sor illeszkedik a megadott regularis kifejezesre,
  # igy ha egy sorban tobbszor is elofordul a Bash string akkor is csak 1-nek fogja szamolni.
  # Esetunkben ez nem gond mert a feladat azt keri, hogy amelyekben legalabb 1x szerepel
  # csak akkor kell a feladatot vegrehajtani, erre pedig tokeletes lesz nekunk az alabbi:
	stringCount=`cat $file | egrep -c 'Bash'`
	# majd pedig megnezzuk, hogy a fajl tartalmazta-e legalabb 1x ezt a szavat:
	if [[ $stringCount -ge 1 ]] ; then
	  # amennyiben igen, a tartalmat hozzafuzzuk a megoldas.txt fajl tartalmahoz
		cat $file >> megoldas.txt
	fi
done
