#!/bin/bash


function keresrekurziv (){
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
	  #amennyiben az adott allomany konyvtar, akkor arra rekurzivan meghivjuk ezt a fuggvenyt,
	  #parameterkent a teljes utvonalat atadva
		if [[ -d "$1/$i" ]] ; then
			keresrekurziv "$1/$i" #rekurziv hivas
		else
		  #amennyiben nem konyvtar volt, megnezzuk, hogy a fajl neve "dc"-vel kezdodik-e, es a kiterjesztese ".png"-e, ekkor ezt atkell masolnunk
			if [[ $i = dc*.png ]] ; then
				file="./$1/$i"            #rekurziv hivas eseten is $1-ben a fuggveny parameterkent megadott eleresi utvonal talalhato, igy ezt a fajlt
				cp $file "./megoldas/$i"  #atmasoljuk a megoldas mappaba ugyanazzal a nevvel
			fi
		fi
	done
}

keresrekurziv $1
ls -1 megoldas/
