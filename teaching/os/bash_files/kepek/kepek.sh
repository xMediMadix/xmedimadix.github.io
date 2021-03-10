#!/bin/bash

# ezekben a valtozokban tartjuk szamon az eddig talalt png es gif kepeket
png=0
gif=0

# bejarjuk azon mappa allomanyait, amelyben a szkript futtatva van
for file in `ls` ; do
  # a valtozoba eltaroljuk az adott fajl kiterjeszteset
  kiterjesztes=`echo $file | cut -d '.' -f 2`

  # ha a fajl png keppfajl akkor megnoveljuk a png valtozonk erteket
  if [[ $kiterjesztes = 'png' ]] ; then
    let png=png+1
  elif [[ $kiterjesztes = 'gif' ]] ; then # ha pedig gif akkor noveljuk a gif valtozo erteket
    let gif=gif+1
  fi

done

#a kert formatumban kiirjuk:
echo "png:$png"
echo "gif:$gif"

#kiirhato igy is:
# echo 'png'${png}
# echo 'gif'${gif}


##############Megoldahto reguláris kifejezes hasznalataval is##############
png=0
gif=0

for file in `ls` ; do
  # Itt talalhato a valtozas, az =~ jelezhetjuk, hogy regularis kifejezest adunk meg.
  # Ezt az awk anyagresznel fogjuk reszletesebben targyalni
  # A .-nak specialis jelentese van, igy a \-t hasznalva elvehetjuk a specialis jelenteset es karakterkent tudjuk kezelni
  # majd a png sztring kovetkezik es a $ jellel azt mondjuk meg, hogy ez a fajl nevek vegen kell legyen
  if [[ $file =~ \.png$ ]] ; then
    let png=png+1
  elif [[ $file =~ \.gif$ ]] ; then # hasonloan az elobbihez
    let gif=gif+1
  fi

done

#a kert formatumban kiirjuk:
echo "png:$png"
echo "gif:$gif"
