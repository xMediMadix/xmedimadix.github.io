#!/usr/bin/gawk -f

BEGIN{
    # db valtozoban fogjuk a mintara illeszkedo szavak darabszamat eltarolni
	db=0
}

{
	# Bejarunk minden sor minden szavat, NF az aktualis sor szavainak szamat jelenti jelen esetben
	for(i=1;i<=NF;++i){
		# Az adott $i szora kell illeszkedjen az a regularis kifejezes, hogy:
		# Vagy kis vagy nagy m betuvel kell kezdodjon: [Mm]
		# Ezt koveti az 'ama' karaktersorozat, melynek utolso 'a' karaktere legalabb 1x de tetszoleges szamban szerepelhet,
		# ezert a vegere kell meg a '+' karakter
		if($i~/[Mm]ama+/){
			# Ha talaltunk ilyen szot, akkor noveljuk a db valtozo erteket eggyel
			db++
		}
	}
}

END{
	# Vegul kiirjuk, hogy hany ilyen szavat talaltunk
	print db
}
