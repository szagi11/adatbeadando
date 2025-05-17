```plantuml

skinparam roundcorner 5
skinparam linetype ortho
skinparam shadowing false

skinparam class {
    BackgroundColor white
    ArrowColor #2688d4
    BorderColor #2688d4
}
!define primary_key(x) <b><color:#b8861b><&key></color> x</b>
!define foreign_key(x) <color:#aaaaaa><&key></color> x
!define column(x) <color:#000000><&media-record></color> x
!define opt_column(x) <color:#efefef><&media-record></color> x
!define table(x) entity x << (T, white) >>
table( Kategoria ) {
  primary_key( kategoria_nev ): TEXT
  column( kategoria_leiras ): TEXT NOT NULL 
  }

  table( Versenyzo ) {
  primary_key( versenyzo_id ): INTEGER
  column( versenyzo_nev ): TEXT NOT NULL 
  column(szuletesi_datum): date NOT NULL
    opt_column(lakcim): TEXT
    opt_column(emailcim): TEXT
  }

table( Zsuri ) {
  primary_key( zsuri_id ): INTEGER
  column( zsuri_nev ): TEXT NOT NULL 
  opt_column(szakma): TEXT
  }

table( Helyszin ) {
  primary_key( helyszin_id ): INTEGER
  column( helyszin_elnevezes ): TEXT NOT NULL 
  column( helyszin_cim ): TEXT NOT NULL 
}
table( Fordulo ) {
  primary_key( fordulo_id ): INTEGER
  column( fordulo_elnevezes): TEXT NOT NULL
  column( fordulo_datum): datetime NOT NULL 
  foreign_key( helyszin_id): INTEGER <<FK> NOT NULL
}
  table( Versenyzo_kategoria ) {
  primary_key( versenyzo_kategoria_id ): INTEGER
  column(nevezes_datum): date
  opt_column(nevezesi_dij): date
foreign_key( versenyzo_id): INTEGER <<FK> NOT NULL
foreign_key( kategoria_nev): TEXT <<FK> NOT NULL
  }
table( Szereples) {
  primary_key( szereples_id ): INTEGER
    opt_column(produkcio): TEXT
    opt_column(tovabbjutott): BOOLEAN
    opt_column(helyezes): INTEGER
    opt_column(dij_neve): TEXT
    foreign_key( versenyzo_kategoria_id): INTEGER <<FK> NOT NULL
 foreign_key(fordulo_id): INTEGER <<FK>> NOT NULL

  }
table( Ertekeles) {
  primary_key( ertekeles_id ): INTEGER
  column(pontszam): INTEGER NOT NULL
  opt_column(megjegyzes): TEXT
  foreign_key( szereples_id ): INTEGER <<FK> NOT NULL
foreign_key( zsuri_id ): INTEGER <<FK> NOT NULL

  }



Kategoria ||--o{ Versenyzo_kategoria
Versenyzo ||--o{ Versenyzo_kategoria
Versenyzo_kategoria||--o{ Szereples
Helyszin||--o{ Fordulo
Fordulo||--o{ Szereples
Szereples ||--o{ Ertekeles
Zsuri ||--o{ Ertekeles


}
```