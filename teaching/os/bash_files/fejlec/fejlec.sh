#!/bin/bash

# Letre hozunk ket seged szovegfajlt
touch elso.txt
touch masodik.txt

# head paranccsal a fejleceket bele iranyitjuk az ujonnal letrehozott fajlokba
head -1 $1 > masodik.txt
head -1 $2 > elso.txt

# A tartalmat visszahelyezni ugy, hogy a megfelelo fejlechez tartozzon
# De elotte meg a feladat leirasa szerint abc szerint rendezzuk es nagybetusitjuk
tail -n +2 $1 | sort | tr a-z A-Z >> elso.txt
tail -n +2 $2 | sort | tr a-z A-Z >> masodik.txt

# Igy a seged fajlok tartalma megfelelo, felul kell hat irni az input fileokat
cat elso.txt > $1
cat masodik.txt > $2

#vegul toroljuk a seged fajlokat
rm elso.txt
rm masodik.txt