#!/usr/bin/gawk -f

# A fajl adatai ';' karakter szerint vannak elvalasztva, igy az FS erteket megvaltoztatjuk ";"-re
# Tovabba letrehozunk egy osszeg valtozot, amelyben az A csapat osszpontszamat fogjuk szamon tartani
BEGIN{
	FS=";"
	osszeg=0
}

# A nev oszlopra szeretnenk mintailleszteni, ez a $1 oszlop.
# A nev 1 nagybetuvel kezdodik: ^[A-Z]
# Minimum 5 es maximum 17 kis- vagy nagybetu koveti: [a-zA-Z]{5,17}
# Egy '.' karakter koveti: ne feledjuk, hogy a '.'-nak specialis jelentese van,
# ezert vagy '\.'-t vagy [.]-t hasznaljunk
# 4 darab szamjegy koveti, melyek egyike sem lehet 3 vagy 7:
# pl: [01245689]{4} vagy mivel jelen esetben latjuk, hogy minden esetben csak szamok szerepelnek a nevek vegen,
# igy hasznalhato ez is: [^37]{4}
# Erre kell, hogy vegzodjon, ezert a vegere tegyunk '$' karaktert

$1~/^[A-Z][a-zA-Z]{5,17}\.[^37]{4}$/{
    # Noveljuk az A csapat tagjanak pontszamaval ($2) az osszeg valtozonk erteket
	osszeg+=$2
}

END{
    # Vegul pedig irjuk ki az osszeget a kepernyore
	print osszeg
}
