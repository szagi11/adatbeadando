-- Döntőbe (6. forduló) jutott versenyzők helyezése és kategóriája
SELECT 
    v.versenyzo_nev,
    k.kategoria_leiras,
    s.helyezes,
    s.dij_neve
FROM Szereples s
JOIN Versenyzo_kategoria vk ON s.versenyzo_kategoria_id = vk.versenyzo_kategoria_id
JOIN Versenyzo v ON vk.versenyzo_id = v.versenyzo_id
JOIN Kategoria k ON vk.kategoria_kod = k.kategoria_kod
WHERE s.fordulo_id = 6
ORDER BY s.helyezes;

--Hány versenyző volt fordulónként
SELECT 
    f.fordulo_elnevezes,
    COUNT(DISTINCT s.versenyzo_kategoria_id) AS versenyzok_szama
FROM Szereples s
JOIN Fordulo f ON s.fordulo_id = f.fordulo_id
GROUP BY f.fordulo_id
ORDER BY f.fordulo_id;


--Melyik helyszínen volt a legtöbb forduló
SELECT 
    h.helyszin_elnevezes,
    COUNT(f.fordulo_id) AS fordulo_db
FROM Fordulo f
JOIN Helyszin h ON f.helyszin_id = h.helyszin_id
GROUP BY h.helyszin_id
ORDER BY fordulo_db DESC
LIMIT 1;


--Zsűrik által adott átlagpontszám produkciótípus szerint (ének/zene/tánc)
SELECT 
    vk.kategoria_kod,
    ROUND(AVG(e.pontszam), 2) AS atlag_pontszam
FROM Ertekeles e
JOIN Szereples s ON e.szereples_id = s.szereples_id
JOIN Versenyzo_kategoria vk ON s.versenyzo_kategoria_id = vk.versenyzo_kategoria_id
GROUP BY vk.kategoria_kod
ORDER BY atlag_pontszam DESC;



-- Az első élőshow legjobb produkciói kategóriánként
SELECT 
    v.versenyzo_nev,
    k.kategoria_leiras,
    s.produkcio,
    AVG(e.pontszam) AS atlag_pontszam
FROM Szereples s
JOIN Versenyzo_kategoria vk ON s.versenyzo_kategoria_id = vk.versenyzo_kategoria_id
JOIN Versenyzo v ON vk.versenyzo_id = v.versenyzo_id
JOIN Kategoria k ON vk.kategoria_kod = k.kategoria_kod
JOIN Ertekeles e ON s.szereples_id = e.szereples_id
WHERE s.fordulo_id = 4
GROUP BY s.szereples_id
HAVING AVG(e.pontszam) = (
    SELECT MAX(avg_pont)
    FROM (
        SELECT AVG(e2.pontszam) AS avg_pont
        FROM Szereples s2
        JOIN Versenyzo_kategoria vk2 ON s2.versenyzo_kategoria_id = vk2.versenyzo_kategoria_id
        JOIN Kategoria k2 ON vk2.kategoria_kod = k2.kategoria_kod
        JOIN Ertekeles e2 ON s2.szereples_id = e2.szereples_id
        WHERE s2.fordulo_id = 4 AND k2.kategoria_kod = k.kategoria_kod
        GROUP BY s2.szereples_id
    ) AS sub
)
ORDER BY k.kategoria_kod;


--Minden versenyző legmagasabb pontszáma, amit elért
SELECT 
    v.versenyzo_nev,
    MAX(e.pontszam) AS max_pontszam
FROM Ertekeles e
JOIN Szereples s ON e.szereples_id = s.szereples_id
JOIN Versenyzo_kategoria vk ON s.versenyzo_kategoria_id = vk.versenyzo_kategoria_id
JOIN Versenyzo v ON vk.versenyzo_id = v.versenyzo_id
GROUP BY v.versenyzo_id
ORDER BY max_pontszam DESC;


--Fordulónkénti versenyzőszám kategóriánként
SELECT 
    f.fordulo_elnevezes,
    k.kategoria_kod,
    k.kategoria_leiras,
    COUNT(DISTINCT vk.versenyzo_id) AS versenyzo_szam
FROM Szereples s
JOIN Versenyzo_kategoria vk ON s.versenyzo_kategoria_id = vk.versenyzo_kategoria_id
JOIN Kategoria k ON vk.kategoria_kod = k.kategoria_kod
JOIN Fordulo f ON s.fordulo_id = f.fordulo_id
GROUP BY f.fordulo_id, k.kategoria_kod
ORDER BY f.fordulo_id, versenyzo_szam DESC;


--Legfiatalabb és legidősebb versenyzők kategóriánként
SELECT 
    k.kategoria_kod,
    
    (SELECT v1.versenyzo_nev
     FROM Versenyzo v1
     JOIN Versenyzo_kategoria vk1 ON v1.versenyzo_id = vk1.versenyzo_id
     WHERE vk1.kategoria_kod = k.kategoria_kod
     ORDER BY v1.szuletesi_datum
     LIMIT 1) AS legidosebb_nev,
     
    (SELECT v1.szuletesi_datum
     FROM Versenyzo v1
     JOIN Versenyzo_kategoria vk1 ON v1.versenyzo_id = vk1.versenyzo_id
     WHERE vk1.kategoria_kod = k.kategoria_kod
     ORDER BY v1.szuletesi_datum
     LIMIT 1) AS legidosebb_szul_datum,
     
    (SELECT v2.versenyzo_nev
     FROM Versenyzo v2
     JOIN Versenyzo_kategoria vk2 ON v2.versenyzo_id = vk2.versenyzo_id
     WHERE vk2.kategoria_kod = k.kategoria_kod
     ORDER BY v2.szuletesi_datum DESC
     LIMIT 1) AS legfiatalabb_nev,
     
    (SELECT v2.szuletesi_datum
     FROM Versenyzo v2
     JOIN Versenyzo_kategoria vk2 ON v2.versenyzo_id = vk2.versenyzo_id
     WHERE vk2.kategoria_kod = k.kategoria_kod
     ORDER BY v2.szuletesi_datum DESC
     LIMIT 1) AS legfiatalabb_szul_datum

FROM Kategoria k
ORDER BY k.kategoria_kod;

