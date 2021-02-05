#!/usr/bin/gawk -f

BEGIN{
	#Az adatok ';'-vel vannak elvalasztva egymastol
	FS=";"
	#Ebben tartjuk szamon, osszesen hany orat tud jatszani az ev folyaman
	ossz=0
}

#lehetnek benne 2022-es datumok is, tehat konkretan megmondjuk, hogy 2021-gyel kell kezdodjon: ^2021
#Ezt kovetoen helyes az is, ha '.'-tal vagy '-'-lel van elvalasztva az ev a honaptol: [\.-]   ahol '\' azért kell mert a '.'-nak specialis jelentese van, ezzel pedig megmondjuk explicit, hogy karakterkent vegye
#A feladat azt mondja, hogy azzal nem kell foglalkozni, hogy a honap biztosan a megfelelo ertekkeszlet kozott van-e, igy eleg csak azt mondanunk, hogy ez utan ket szam kovetkezik: [0-9]{2}
#ismet egy elvalaszto, most a honap es a nap kozott: [\.-]
#Azt tudjuk, hogy a NN kozul az elso 0 es 3 kozotti szam lehet: [0-3]
#majd azt mondja a feladat, hogy Tamas azokon a napokon nem jatszik, amelyek datum szerint 3 vagy 5 vagy 7-re vegzodnek: [^357]    ahol '^' jelentese, hogy "kiveve"
#ezzel a datum feldolgozva, ezt koveti egy ';' karakter: ;
#majd ezek kozul is csak kedden (K) vagy szerdan (SZE) vagy penteken (P) fog jatszani
#hogy ez utan mi van szamunkra lenyegtelen igy a regex szurest ezzel befejeztuk
#meg kell neznunk, hogy aznap jatszhat-e legalabb 7 orat, azaz 24 orabol kivonjuk az elfoglaltsagot (ami a harmadik oszlop $3) es ha ez >= 7 akkor megfelelo datum, tehat kiirjuk a kepernyore

/^2021[\.-][0-9]{2}[\.-][0-3][^357];((K)|(SZE)|(P))/{
	if(24-$3 >= 7){
		print $1
		ossz+=(24-$3)
	}
}

END{
	#vegul kiirjuk, hogy ez osszesen hany ora jatszast jelent
	print ossz
}