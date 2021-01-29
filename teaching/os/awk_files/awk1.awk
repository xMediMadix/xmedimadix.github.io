#!/usr/bin/gawk -f

#1. feladat
BEGIN{
	#elválasztó karakter
	FS = ";"
}

{
	#létrehozunk egy datum tömböt, ebben tároljuk el külön az év, hónap, és nap értékét
	#1:év, 2:hónap, 3:nap
	split($2,datum,".")
	
	#ha nem találkoztunk még ilyen kurzussal akkor a tömb ezen indexe üres lesz
	if(kurzus[$1] == ""){ 
		#ekkor értékül adjuk az első talált dátumot neki és lépünk a következő iterációra
		kurzus[$1] = $2
		next
	}
	#ha a mostani vizsga alkalom előbb van mint az eddig talált legjobb (leghamarabbi dátum) akkor kicseréljük
	if(datum[3] < kurzus[$1]){
		kurzus[$1] = $2
	}
}

END{
	for(i in kurzus){
		#Kiírás a feladat szerinti megfelelő formátumba
		printf("%s;%s\n",i,kurzus[i])
	}
}
