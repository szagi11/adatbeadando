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
    
    
    
INSERT INTO Kategoria (kategoria_kod, kategoria_leiras) VALUES
('ének', 'Vokális előadás, szólisták és kórusok'),
('zene', 'Hangszeren történő előadás, szoló vagy zenekari'),
('tánc', 'Táncelőadás, szóló vagy csoportos');


INSERT INTO Versenyzo (versenyzo_nev, szuletesi_datum,lakcim, emailcim) VALUES
('Kiss Anna', '2007-05-11', 'Debrecen', 'anna2007@gmail.com'),
('Tóth Péter', '2004-07-15', 'Budapest', 'toththeking@gmail.com'),
('Szabó Lili', '2006-03-15', 'Szeged', 'szlili@gmail.com'),
('Nagy Dániel', '2000-09-21', 'Pécs', 'daniel.nagy@stud.uni-corvinus.hu'),
('Boros Noémi', '2008-12-22', 'Győr', 'noemi12@gmail.com'),
('Takács Ádám', '2003-06-11',	'Sopron',	'takadam2003@gmail.com'),
('Farkas Laura','2005-07-08',	'Szolnok',	'farkas.laura@freemail.com'),
('Váradi Zsolt','2002-09-13',	'Miskolc',	'ironman777@gmail.com'),
('Simon Réka',	'2006-08-27',	'Budapest',	'rekababy11@gmail.com'),
('Barta Zsombor','2001-10-01',	'Debrecen',	'zsombor@barta.hu'),
('Kovács Zsófia', '2005-02-19',	'Győr',	'mirasofia2005@gmail.com'),
('Varga Bence',	'2003-09-06',	'Budapest',	'bence.varga@agisoft.hu'),
('Molnár Nóra',	'2004-04-20',	'Sopron',	'norica17@gmail.com'),
('Szilágyi Tamás','2002-07-29',	'Budapest',	'tamas.szilagyi@stud.uni-corvinus.hu'),
('Bodó Kata',	'2007-11-13',	'Szeged',	'bodokata@gmail.com'),
('Bíró Gergő',	'2001-01-30',	'Debrecen',	'waterpologergo@gmail.com'),
('Szalai Emma',	'2005-09-20',	'Budapest',	'emma.szalai.2005@gmail.com'),
('Kelemen Kristóf',	'2003-06-04',	'Miskolc', 'kkkristof@freemail.hu'),
('Lukács Panna',	'2004-03-09',	'Budapest', 'pannalukacs@bme.hu'),
('Major Gábor',	'2000-05-21',	'Debrecen',	'mayorgabi@gmail.com');


INSERT INTO Zsuri(zsuri_nev,szakma) VALUES
('Kovács Judit', 'énekes'),
('Varga László', 'zenetanár'),
('Oláh Tamás', 'táncmester');


INSERT INTO Helyszin(helyszin_elnevezes,helyszin_cim) VALUES
('TV2 székház', '1145 Budapest, Róna utca 174'),
('RTL külső stúdió', '1222 Budapest, Nagytétényi út 29'),
('Fővárosi Nagycirkusz', ' 1146 Budapest, Állatkerti krt. 12/a');


INSERT INTO Fordulo(fordulo_elnevezes,fordulo_datum, helyszin_id) VALUES
('Csillag születik 1. valogató','2025-09-11 17:00:00', 2),
('Csillag születik 2. valogató','2025-09-12 19:00:00', 2),
('Csillag születik 3. valogató','2025-09-13 19:00:00', 2),
('Csillag születik 1. élő adás','2025-10-15 20:00:00', 2),
('Csillag születik 2. élő adás','2025-10-22 20:00:00', 2),
('Csillag születik döntő','2025-10-29 20:00:00', 2);



INSERT INTO Versenyzo_kategoria(versenyzo_id, nevezes_datum, kategoria_kod) VALUES
(1, '2025-02-16','ének'),
(2, '2025-02-16', 'tánc'),
(3, '2025-02-16', 'zene'),
(4, '2025-02-16', 'ének'),
(5, '2025-02-16', 'zene'),
(6,	'2025-02-17',	'tánc'),
(7,	'2025-02-17',	'ének'),
(8,	'2025-02-17',	'zene'),
(9,	'2025-02-17',	'tánc'),
(10, '2025-02-18',	'ének'),
(11, '2025-02-18',	'zene'),
(12, '2025-02-18',	'tánc'),
(13, '2025-02-18',	'zene'),
(14, '2025-02-19',	'ének'),
(15, '2025-02-19',	'tánc'),
(16, '2025-02-11',	'zene'),
(17, '2025-02-11',	'ének'),
(18, '2025-02-11',	'tánc'),
(19, '2025-02-11',	'zene'),
(20, '2025-02-13',	'tánc');

INSERT INTO Szereples (szereples_id, produkcio, tovabbjutott, helyezes, dij_neve, versenyzo_kategoria_id, fordulo_id) VALUES
(1, 'ének produkció', 1, NULL, NULL, 1, 1),
(2, 'tánc produkció', 1, NULL, NULL, 2, 2),
(3, 'zene produkció', 0, NULL, NULL, 3, 3),
(4, 'ének produkció', 0, NULL, NULL, 4, 1),
(5, 'zene produkció', 0, NULL, NULL, 5, 2),
(6, 'tánc produkció', 0, NULL, NULL, 6, 3),
(7, 'ének produkció', 0, NULL, NULL, 7, 1),
(8, 'zene produkció', 0, NULL, NULL, 8, 2),
(9, 'tánc produkció', 0, NULL, NULL, 9, 3),
(10, 'ének produkció', 0, NULL, NULL, 10, 1),
(11, 'zene produkció', 0, NULL, NULL, 11, 2),
(12, 'tánc produkció', 1, NULL, NULL, 12, 3),
(13, 'zene produkció', 0, NULL, NULL, 13, 1),
(14, 'ének produkció', 1, NULL, NULL, 14, 2),
(15, 'tánc produkció', 1, NULL, NULL, 15, 3),
(16, 'zene produkció', 1, NULL, NULL, 16, 1),
(17, 'ének produkció', 1, NULL, NULL, 17, 2),
(18, 'tánc produkció', 1, NULL, NULL, 18, 3),
(19, 'zene produkció', 1, NULL, NULL, 19, 1),
(20, 'tánc produkció', 1, NULL, NULL, 20, 2),
(21, 'ének produkció', 0, NULL, NULL, 1, 4),
(22, 'tánc produkció', 0, NULL, NULL, 2, 4),
(23, 'tánc produkció', 1, NULL, NULL, 12, 4),
(24, 'ének produkció', 1, NULL, NULL, 14, 4),
(25, 'tánc produkció', 0, NULL, NULL, 15, 4),
(26, 'zene produkció', 1, NULL, NULL, 16, 4),
(27, 'ének produkció', 1, NULL, NULL, 17, 4),
(28, 'tánc produkció', 1, NULL, NULL, 18, 4),
(29, 'zene produkció', 0, NULL, NULL, 19, 4),
(30, 'tánc produkció', 0, NULL, NULL, 20, 4),
(31, 'tánc produkció', 0, NULL, NULL, 12, 5),
(32, 'ének produkció', 0, NULL, NULL, 14, 5),
(33, 'zene produkció', 1, NULL, NULL, 16, 5),
(34, 'ének produkció', 1, NULL, NULL, 17, 5),
(35, 'tánc produkció', 1, NULL, NULL, 18, 5),
(36, 'zene produkció', 0, 1, '1. hely', 16, 6),
(37, 'ének produkció', 0, 2, '2. hely', 17, 6),
(38, 'tánc produkció', 0, 3, '3. hely', 18, 6);


INSERT INTO Ertekeles (ertekeles_id, szereples_id, zsuri_id, pontszam, megjegyzes) VALUES
(1, 1, 1, 75, 'fejlődőképes'),
(2, 1, 2, 91, NULL),
(3, 1, 3, 73, NULL),
(4, 2, 1, 96, 'hibátlan'),
(5, 2, 2, 84, NULL),
(6, 2, 3, 86, NULL),
(7, 3, 1, 69, 'gyenge'),
(8, 3, 2, 74, NULL),
(9, 3, 3, 61, NULL),
(10, 4, 1, 60, 'gyenge'),
(11, 4, 2, 65, NULL),
(12, 4, 3, 56, NULL),
(13, 5, 1, 63, 'gyenge'),
(14, 5, 2, 50, NULL),
(15, 5, 3, 67, NULL),
(16, 6, 1, 66, 'gyenge'),
(17, 6, 2, 60, NULL),
(18, 6, 3, 69, NULL),
(19, 7, 1, 67, 'gyenge'),
(20, 7, 2, 60, NULL),
(21, 7, 3, 66, NULL),
(22, 8, 1, 57, 'gyenge'),
(23, 8, 2, 60, NULL),
(24, 8, 3, 60, NULL),
(25, 9, 1, 58, 'gyenge'),
(26, 9, 2, 60, NULL),
(27, 9, 3, 65, NULL),
(28, 10, 1, 55, 'gyenge'),
(29, 10, 2, 65, NULL),
(30, 10, 3, 69, NULL),
(31, 11, 1, 69, 'gyenge'),
(32, 11, 2, 63, NULL),
(33, 11, 3, 61, NULL),
(34, 12, 1, 86, 'lenyűgöző'),
(35, 12, 2, 79, NULL),
(36, 12, 3, 100, NULL),
(37, 13, 1, 68, 'gyenge'),
(38, 13, 2, 67, NULL),
(39, 13, 3, 72, NULL),
(40, 14, 1, 85, 'lenyűgöző'),
(41, 14, 2, 97, NULL),
(42, 14, 3, 97, NULL),
(43, 15, 1, 74, 'fejlődőképes'),
(44, 15, 2, 92, NULL),
(45, 15, 3, 91, NULL),
(46, 16, 1, 84, 'fejlődőképes'),
(47, 16, 2, 92, NULL),
(48, 16, 3, 88, NULL),
(49, 17, 1, 92, 'fejlődőképes'),
(50, 17, 2, 89, NULL),
(51, 17, 3, 90, 'lenyűgöző'),
(52, 18, 1, 88, NULL),
(53, 18, 2, 96, NULL),
(54, 18, 3, 94, NULL),
(55, 19, 1, 99, 'hibátlan'),
(56, 19, 2, 91, NULL),
(57, 19, 3, 89, NULL),
(58, 20, 1, 96, 'hibátlan'),
(59, 20, 2, 93, NULL),
(60, 20, 3, 89, NULL),
(61, 21, 1, 70, 'kevés'),
(62, 21, 2, 66, NULL),
(63, 21, 3, 64, NULL),
(64, 22, 1, 71, 'kevés'),
(65, 22, 2, 60, NULL),
(66, 22, 3, 77, NULL),
(67, 23, 1, 82, 'fejlődőképes'),
(68, 23, 2, 80, NULL),
(69, 23, 3, 90, NULL),
(70, 24, 1, 97, 'lenyűgöző'),
(71, 24, 2, 77, NULL),
(72, 24, 3, 97, NULL),
(73, 25, 1, 73, 'kevés'),
(74, 25, 2, 63, NULL),
(75, 25, 3, 66, NULL),
(76, 26, 1, 99, 'hibátlan'),
(77, 26, 2, 93, NULL),
(78, 26, 3, 94, NULL),
(79, 27, 1, 80, 'lenyűgöző'),
(80, 27, 2, 84, NULL),
(81, 27, 3, 90, NULL),
(82, 28, 1, 85, 'lenyűgöző'),
(83, 28, 2, 99, NULL),
(84, 28, 3, 80, NULL),
(85, 29, 1, 76, 'kevés'),
(86, 29, 2, 64, NULL),
(87, 29, 3, 78, NULL),
(88, 30, 1, 61, 'kevés'),
(89, 30, 2, 70, NULL),
(90, 30, 3, 72, NULL),
(91, 31, 1, 61, 'kevés'),
(92, 31, 2, 69, NULL),
(93, 31, 3, 76, NULL),
(94, 32, 1, 66, 'kevés'),
(95, 32, 2, 62, NULL),
(96, 32, 3, 76, NULL),
(97, 33, 1, 82, 'fejlődőképes'),
(98, 33, 2, 85, NULL),
(99, 33, 3, 89, NULL),
(100, 34, 1, 82, 'fejlődőképes'),
(101, 34, 2, 88, NULL),
(102, 34, 3, 93, NULL),
(103, 35, 1, 85, 'lenyűgöző'),
(104, 35, 2, 91, NULL),
(105, 35, 3, 91, NULL),
(106, 36, 1, 93, 'hibátlan'),
(107, 36, 2, 94, NULL),
(108, 36, 3, 97, NULL),
(109, 37, 1, 85, 'lenyűgöző'),
(110, 37, 2, 89, NULL),
(111, 37, 3, 90, NULL),
(112, 38, 1, 88, 'lenyűgöző'),
(113, 38, 2, 81, NULL),
(114, 38, 3, 84, NULL);