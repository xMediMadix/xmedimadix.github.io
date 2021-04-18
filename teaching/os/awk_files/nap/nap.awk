#!/usr/bin/gawk -f

BEGIN{
    # db valtozoban fogjuk a mintara illeszkedo szavak darabszamat eltarolni
    db=0
}

{
    # Bejarunk minden sor minden szavat, NF az aktualis sor szavainak szamat jelenti jelen esetben
    for(i = 1; i <= NF; ++i){
        # Minden olyan szavat figyeleme veszunk, ami tartalmaz egy szamot, majd kozvetlen utana egy % jelet
        if ( $i ~ /[0-9]%/){
            # Kiirunk minden ilyen talalatot
            print $i
            # Majd noveljuk a db valtozo erteket
            db++
        }
    }
}

END{
    # Vegul kiirjuk, hogy hany ilyen szavat talaltunk
    print db
}
