#!/usr/bin/gawk -f

/(^TTAGCGGA)(A{2}|T{2}|G{2}|C{2}){4}([ATGC]{4})$/{
    #A DNS szekvencia az AATCGCCT szekvencia KOMPLEMENTERÉVEL kell kezdődjön:
    #^(TTAGCGGA), mivel A komplementere T és C komplomentere G, a '^' karakter jelenti azt, hogy ezzel a mintával kell kezdődnie a soroknak.

    #Az utolsó 4 karakternek egyező kell legyen a 4 bázis valamelyikével: ([ATGC]{4})$ ahol
    #az [ATGC] közül vesz egy karaktert, ezt pontosan 4x ({4}) kell egymás után leírnia,
    #és ezzel a sorozattal kell befejeződnie, ezért kell a $ karakter a végére

    #Eddig lefedtünk összesen 8 kezdő karaktert és a végén még 4-et, ami összesen 12,
    #továbbá tudjuk, hogy az egész DNS szekvencia hossza összesen 20 karakter hosszú,
    #tehát még 8 karakter kerül ezek közé. A feladat azt mondja, hogy itt a DNS bázisok csak duplázódva jelenhetnek meg
    #tehát VAGY szerepel egymás mellett 2x az 'A' VAGY szerepel egymás mellett 2x a 'T'... ennek a szintaxisa pedig:
    #(A{2}|T{2}|G{2}|C{2}){4} ahol a '|' karakter jelenti a logikai megengedő vagyolást (ergó legalább az egyik kifejezésre illeszkedik)
    #és ebből mivel kettessével ismétlődnek, hogy lefedjük a maradék 8 karaktert így ezekből kell összesen 4 drb ({4})

	#Azon sorokat kiírjuk amelyekre illeszkedik ez a reguláris kifejezés, majd a program lefutása után bemásoljuk a kiértékelőbe.
	print($0)
}
