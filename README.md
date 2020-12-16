# Internship-5-Hotel-Database
homework #5

Uvod u baze podataka domaći:
Modelirati i implementirati strukturu relacijske baze podataka koja služi lancu hotela za realizaciju poslovanja.
Svaki hotel ima sobe od kojih je svaka definirana brojem, kategorijom, cijenom noćenja, kapacitetom itd... Hotel ima i zaposlenike raznih uloga, od recepcionista  preko čistačica do sobne posluge. Svaki posjet svakoj sobi se bilježi i čuva u sustavu, i to na način da se ne pamti samo 'kupac' smještaja nego informacije o svim osobama koje su boravile u smještaju. Ono što osim vremena boravka definira boravak u hotelu je i to da li je osoba uzela polupansion, pansion ili obični boravak. U zapisu 'kupnje' smještaja treba biti navedeno kada je ostvarena transakcija, po kojoj je cijeni plaćeno te što je sve naručeno (koja je soba + ništa, polupansion, pansion).
Nakon implementacije strukture baze, ubaciti određenu količinu testnih podataka, neka svaki entitet ima bar 5 zapisa.
Napisati SQL upite koji će napraviti iduće:
Dohvatiti sve sobe hotela određenog imena, i to poredane uzlazno po svom broju
Dohvatiti sve sobe u svim hotelima kojima broj počinje sa brojem 1
Dohvatiti samo ime i prezime svih čistačica u određenom hotelu
Dohvatiti kupnje od 1.12.2020. koje prelaze cijenu od 1000
Dohvatiti sve boravke u svim hotelima koji su trenutno u tijeku
Izbrisati sve boravke koji su napravljeni prije 1.1.2020.
Sve sobe drugog hotela po redu koje imaju kapacitet 3 povećati kapacitet na 4
Dohvatiti povijesni pregled boravaka određene sobe, poredano po vremenu boravka
Dohvatiti sve boravke koji su bili ili pansion ili polupansion, i to samo u određenom hotelu
Promovirati 2 zaposlenika sobne posluge u recepcioniste
Zadatak implementirati kao jednu SQL skriptu sa naredbama jasno odvojenim praznim linijama. Ukoliko se ne može čitavi SQL izvršit odjednom, linijom komentara odvojiti blokove skripte u kojima se trebaju izvršavat naredbe (dakle komentari odvajaju dijelove skripte koje moramo samostalno pokrenit prije nego krenemo na idući). Single line komentari u MSSQL se pišu sa '--' na početku.

Repozitorij treba imenovati ovako: Internship-5-Hotel-Database
Rok: Nedjelja, 20.12.2020. u 23:59

