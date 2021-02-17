#Ahhoz, hogy kilistazzuk azokat a sorokat, amely utvonalaban minden telepules szerepel, pipeline segitsegevel egymas utan egreppel leszurjuk a telepuleseket, tehat:
#Listazzuk azokat a sorokat ahol benne van "Kaposvar", majd ezeken belul azokat amelyekben szerepel "Porboly"... es igy tovabb "Obecse"-ig
#cut-d ";" -f 2 jelentése: Azt akarjuk megnezni, hogy melyik utvonal lesz a legrovidebb, igy eloszor levagjuk a talalt sorokbol az utvonalakat, es megtartjuk csak a tavolsagokat, hiszen ezen akarunk rendezest elvegezni
#sort -n segitsegevel a szamokat novekvo sorrendben leirjuk, ergo a megfelelo utvonalak kozul az elso sorban lesz a legrovidebb, tehat:
#head -1 paranccsal megtartjuk az elso sort, ami a megfelelo telepuleseket tartalmazo utvonalak kozul a legrovidebb utat jeloli, es ezt elmentjuk az utvonal_km valtozoba
utvonal_km=`cat $1 | egrep "Kaposvar" | egrep "Porboly" | egrep "Ersekcsanad" | egrep "Kecel" | egrep "Oroshaza" | egrep "Bekescsaba" | egrep "Szeged" | egrep "Szajan" | egrep "Obecse" | cut -d ";" -f 2 | sort -n | head -1`


#Azt irta a feladat, hogy az ehhez tartozo tavolsag az egesz fajlban egyedi, ergo nem szerepel a fajlban ez a szam tobbszor, igy egyszeruen meghatarozhatjuk a hozza tartozo utvonalat is:
#egrep segitsegevel leszurjuk a megfelelo utvonalat, ahol ez a bizonyos tavolsag szerepel, majd cut -d ";" -f 1 segitsegevel vesszuk az elso oszlopot ami maga az utvonal lesz
utvonal=`cat $1 | egrep "$utvonal_km" | cut -d ";" -f 1`


#Megkell hataroznunk, hogy hany liter uzemanyagra lesz szukseg az ut megtetelehez. A masodik parameterben erkezik az a valtozo, ami megmondja, hogy 100 km megtetele eseten a jarmu mennyit fogyaszt, tehat egy egyszeru aranypar segitsegevel meghatarozzuk, hogy ehhez a tavolsaghoz hany liter uzemanyagra lesz szukseg, amit eltarolunk a szukseges_benzin valtozoba
let szukseges_benzin=($2*$utvonal_km)/100


#Harmadik parameterkent megkapjuk, hogy mennyibe kerul 1 liter uzemanyag, tehat ezt megkell szoroznunk a szukseges_benzin valtozonkkal
let penz=$3*$szukseges_benzin


#A megfelelo fomatumban eloallitjuk az eredmeny fajlt:

# '>' segitsegevel beleiranyitjuk az eredmeny.txt fajlba a fejlecet. Amennyiben mar letezik, igy felulirja es az elso sorban lesz, amennyiben pedig meg nem letezik, akkor letrehozza es szinten az elso sorban lesz
echo "utvonal;szukseges_penz_uzemanyagra(ft);tavolsag(km)" > eredmeny.txt

#masodik sorba pedig hozzafuzzuk a '>>' segitsegevel hozzafuzzuk az eredmenyt
echo "$utvonal;$penz;$utvonal_km" >> eredmeny.txt

