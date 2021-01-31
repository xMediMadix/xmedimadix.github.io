#letrehozok egy i valtozot amellyel azt fogom szamon tartani, hogy eppen melyik sort dolgozom fel
i=1

#lekerdezzuk, hogy hany sort tartalmaz a bemeneti fajl (az elso es masodik parameterben erkezo fajl is ugyanannyi sort tartalmaz igy eleg az egyiket lekerdezni
#a wc -l $1 parancs altal megkapjuk azt hogy hany sorbol all az adott fajl, de mellette outputkent szerepel a fajl neve is szokozzel elvalasztva, viszont mivel aritmetikai osszehasonlitast fogunk vegezni ezert ezt a cut paranccsal levagjuk es csak a szamot tartjuk meg.
sor=`wc -l $1 | cut -d " " -f 1`  
#ez csak egy pelda, hogy igy is meglehet oldani, amit a felev vege fele fogunk targyalni awk programozast (hiszen awk eseteben alapertelmezetten szokoz az elvalaszto karakter, igy ennek csak lekerjuk az elso ($1) elemet) De ez csak erdekesseg:
sor2=`wc -l $1 | awk '{print $1}'`

#A feladat azt kerte, hogy amennyiben letezik a fajl (ezt a -e azaz exists kapcsoloval kerhetjuk le) toroljuk es hozzuk letre ujbol, amennyiben nem letezik akkor pedig csak siman hozzuk letre
if [[ -e eredmeny.txt ]] ; then
	rm eredmeny.txt
	touch eredmeny.txt
else
	touch eredmeny.txt
fi

#egy while ciklussal fogok vegig menni a fajlok sorain, ahol az i valtozoban tartom szamon, hogy eppen melyik sornal tartok, a fent lekerdezett sor valtozo pedig azt jelenti, hogy osszesen hany sor van, igy tehat addig megyunk mig az i erteke -le (less or equal tehat kisebb vagy egyenlo) mint a sorok szama:
while [[ $i -le $sor ]] ; do
	#karakter valtozo ertekeben eltarolom az elso fajl i-edik sorat
	karakter=`head -$i $1 | tail -n +$i`
	#ascii valtozo ertekeben eltarolom a masodik fajl i-edik sorat
	ascii=`head -$i $2 | tail -n +$i`
	#majd az eredmeny fajl tartalmahoz hozzafuzom a kert formatumban a ket fajlbol szarmazo adatokat a ">>" segitsegevel 
	echo "$karakter;$ascii" >> eredmeny.txt
	#ezek utan pedig novelem az i erteket, hogy a kovetkezo iteracioban a kovetkezo sort tudjuk feldolgozni
	let i=$i+1
done
