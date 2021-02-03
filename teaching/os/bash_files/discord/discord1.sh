#!/bin/bash


function keres (){
  #ellenorizzuk, hogy letezik-e a megadott mappa
	if [[ ! -e $1 ]] ; then
	  #ha nem akkor hibakoddal kilepunk
		exit 5
	fi
	#ellenorizzuk, hogy egyaltalan mappat kaptunk-e
	if [[ ! -d $1 ]] ; then
	  #ha nem akkor hibakoddal kilepunk
	  exit 2
	fi
	#listazzuk a parameterben kapott fajl tartalmat
	for i in `ls $1` ; do
	  #amennyiben az adott fajl "dc"-vel kezdodik, es a kiterjesztese ".png" akkor ezt atkell masolnunk
		if [[ $i = dc*.png ]] ; then
		  #mivel ezzel a keresessel $i csak a fajl nevet tartalmazza de az eleresi utvonalat nem
		  #de masolashoz a program konyvtartol szamitva kell megadni az eleresi utvonalat, tehat
		  #"$1/"-t ele irva mar elerjuk a fajlt es ezt atmasoljuk a ".megoldas/$i"-fajlba nevet nem valtoztatjuk meg
			cp "$1/$i" "./megoldas/$i"
		fi
	done
}

#meghivjuk a keres fuggvenyt a parancssori parameterben kapott mappanevvel
keres $1
