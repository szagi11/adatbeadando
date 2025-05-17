CREATE TABLE IF NOT EXISTS Kategoria (
	kategoria_kod  VARCHAR(10) PRIMARY KEY,
    kategoria_leiras VARCHAR(255)
);
	


CREATE TABLE IF NOT EXISTS Versenyzo (
    versenyzo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    versenyzo_nev VARCHAR(255)NOT NULL,
    szuletesi_datum DATE,
    lakcim VARCHAR(255),
    emailcim VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS Zsuri (
    zsuri_id INTEGER PRIMARY KEY AUTOINCREMENT,
    zsuri_nev VARCHAR(155) NOT NULL,
    szakma VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Helyszin (
    helyszin_id INTEGER PRIMARY KEY AUTOINCREMENT,
    helyszin_elnevezes VARCHAR(100) NOT NULL,
	helyszin_cim VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS Fordulo (
    fordulo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    fordulo_elnevezes VARCHAR(100) NOT NULL,
	fordulo_datum date NULL,
	helyszin_id INT NOT NULL,
	FOREIGN KEY (helyszin_id) REFERENCES Helyszin(helyszin_id)
);


CREATE TABLE IF NOT EXISTS Versenyzo_kategoria (
    versenyzo_kategoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nevezes_datum DATE NOT NULL,
    nevezesi_dij INT,
    versenyzo_id INT NOT NULL,
	kategoria_kod VARCHAR(10) NOT NULL,
	FOREIGN KEY (versenyzo_id) REFERENCES Versenyzo(versenyzo_id),
	FOREIGN KEY (kategoria_kod) REFERENCES Kategoria(kategoria_kod)
);



CREATE TABLE IF NOT EXISTS Szereples (
    szereples_id INTEGER PRIMARY KEY AUTOINCREMENT,
    produkcio VARCHAR(100) NOT NULL,
	tovabbjutott BOOLEAN DEFAULT FALSE,
	helyezes INTEGER,
	dij_neve VARCHAR(100),
	versenyzo_kategoria_id INT NOT NULL,
	fordulo_id INT NOT NULL,
	FOREIGN KEY (versenyzo_kategoria_id) REFERENCES Versenyzo_kategoria(versenyzo_kategoria_id),
	FOREIGN KEY (fordulo_id) REFERENCES Fordulo(fordulo_id)
);



CREATE TABLE IF NOT EXISTS Ertekeles (
    ertekeles_id INTEGER PRIMARY KEY AUTOINCREMENT,
    szereples_id INTEGER,
    zsuri_id INTEGER,
    pontszam INTEGER NOT NULL,
    megjegyzes TEXT,
	FOREIGN KEY (szereples_id) REFERENCES Szereples(szereples_id),
	FOREIGN KEY (zsuri_id) REFERENCES Zsuri(zsuri_id));
	
