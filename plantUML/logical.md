
### ER diagram
```plantuml
entity Kategoria {
    *kategoria_nev: TEXT
    --
    leiras:TEXT
}

entity Versenyzo {
    *versenyzo_id: INTEGER
    --
    *nev: TEXT
    *szuletesi_datum: date
    lakcim: TEXT
    emailcim: TEXT

 
}


entity Versenyzo_kategoria {
    *versenyzo_kategoria_id: INTEGER
    --
    *nevezes_datum: DATE
    nevezesi_dij: INTEGER

    
}

entity Fordulo {
    *fordulo_id: INTEGER
    --
    *fordulo_elnevezes: TEXT
    *fordulo_datum: datetime

    }
entity Helyszin {
    *helyszin: INTEGER
    --
    *helyszin_elnevezes: TEXT
    *helyszin_cim: TEXT
    }    
entity Szereples {
    *szereples_id: INTEGER
    --
    produkcio: TEXT
    tovabbjutott: BOOLEAN
    helyezes: INTEGER
    dij_neve: TEXT
}

entity Ertekeles {
    *ertekeles_id: INTEGER
    --
   
    *pontszam: INTEGER
    megjegyzes: TEXT
}



entity Zsuri {
    zsuri_id: INTEGER
    --
    *nev: TEXT
    szakma: TEXT
}

Kategoria ||--o{ Versenyzo_kategoria
Versenyzo ||--o{ Versenyzo_kategoria
Versenyzo_kategoria||--o{ Szereples
Helyszin||--o{ Fordulo
Fordulo||--o{ Szereples
Szereples ||--o{ Ertekeles
Zsuri ||--o{ Ertekeles

```