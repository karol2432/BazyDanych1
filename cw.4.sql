---CREATE SCHEMA ksiegowość;
/*
CREATE TABLE ksiegowość.pracownicy
(
id_pracownika character varying(50) NOT NULL,
imie character varying(50),
nazwisko character varying(50), 
adres character varying(50),
telefon character varying(50), 
CONSTRAINT ksiegowość_pkey PRIMARY KEY (id_pracownika)
);
CREATE TABLE ksiegowość.godziny
(
id_godziny character varying(50) NOT NULL,
data_ date,
liczba_godzin integer,
id_pracownika character varying(50),
CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny)
);
CREATE TABLE ksiegowość.pensje
(
    id_pensji character varying(50) NOT NULL,
	stanowisko character varying(50),
	kwota money NOT NULL,
		
	CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji)
);
CREATE TABLE ksiegowość.premie
(
	id_premii character varying(50) NOT NULL,
	rodzaj character varying(50),
	kwota money,
	CONSTRAINT premie_pkey PRIMARY KEY (id_premii)
);
CREATE TABLE ksiegowość.wynagrodzenia
(
 id_wynagrodzenia character varying(50)  NOT NULL,
 data_ date NOT NULL,
 id_pracownika character varying(50) NOT NULL,
 id_godziny character varying(50) NOT NULL,
 id_pensji character varying(50) NOT NULL,
 id_premii character varying(50) NOT NULL,
 CONSTRAINT wynagrodzenie_pkey PRIMARY KEY (id_wynagrodzenia)
) */
/*
ALTER TABLE ksiegowość.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowość.pracownicy(id_pracownika)
ON DELETE SET NULL;

ALTER TABLE ksiegowość.wynagrodzenia
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowość.pracownicy(id_pracownika)
ON DELETE SET NULL;
	
ALTER TABLE ksiegowość.wynagrodzenia
ADD FOREIGN KEY (id_godziny)
REFERENCES ksiegowość.godziny(id_godziny)
ON DELETE SET NULL;

ALTER TABLE ksiegowość.wynagrodzenia
ADD FOREIGN KEY (id_pensji)
REFERENCES ksiegowość.pensje(id_pensji)
ON DELETE SET NULL;
	
ALTER TABLE ksiegowość.wynagrodzenia
ADD FOREIGN KEY (id_premii)
REFERENCES ksiegowość.premie(id_premii)
ON DELETE SET NULL; */
/*
INSERT INTO ksiegowość.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
    ('1', 'Karol', 'Nowak', 'Warszawa', '555555555'),
    ('2', 'Piotr', 'Karbarz', 'Kraków', '123456789'),
    ('3', 'Joanna', 'Wsiór', 'Łódź', '987654321'),
    ('4', 'Wojciech', 'Glut', 'Kraków', '123459876'),
    ('5', 'Maciej', 'Duda', 'Sosnowiec', '987612345'),
    ('6', 'Weronika', 'Lewandowski', 'Poznań', '119876543'),
    ('7', 'Dominika', 'Kowalski', 'Poznań', '112233445'),
    ('8', 'Błażej', 'Kowalski', 'Warszawa', '192837465'),
    ('9', 'Kacper', 'But', 'Kraków', '657438291'),
    ('10', 'Ola', 'Nowak', 'Sosnowiec', '234567891');
	*/
/*
INSERT INTO ksiegowość.godziny (id_godziny, data_, liczba_godzin, id_pracownika)
VALUES
    ('1', '2023-10-25', 8, '1'),
    ('2', '2023-10-26', 7, '2'),
    ('3', '2023-10-27', 6, '3'),
    ('4', '2023-10-28', 8, '4'),
    ('5', '2023-10-29', 7, '5'),
    ('6', '2023-10-30', 9, '6'),
    ('7', '2023-10-31', 8, '7'),
    ('8', '2023-11-01', 7, '8'),
    ('9', '2023-11-02', 6, '9'),
    ('10', '2023-11-03', 8, '10');
	
INSERT INTO ksiegowość.pensje (id_pensji, stanowisko, kwota)
VALUES
    ('1', 'Prezes', 2600),
    ('2', 'Specjalista', 2300),
    ('3', 'Asystent', 1200),
    ('4', 'Konsultant', 1100),
    ('5', 'Analityk', 2400),
    ('6', 'Kierownik', 1300),
    ('7', 'Specjalista', 1050),
    ('8', 'Asystent', 900),
    ('9', 'Ksiegowy', 1000),
    ('10', 'Programista', 1500);
	

	
INSERT INTO ksiegowość.premie (id_premii, rodzaj, kwota)
VALUES
    ('11', 'nr 1', 500),
    ('12', 'nr 2', 400),
    ('13', 'nr 3', 300),
    ('14', 'nr 4', 450),
    ('15', 'nr 5', 420),
    ('16', 'nr 6', 510),
    ('17', 'nr 7', 410),
    ('18', 'nr 8', 320),
    ('19', 'nr 9', 460),
    ('20', 'nr 10', 430);
INSERT INTO ksiegowość.wynagrodzenia (id_wynagrodzenia, data_, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
('1', '2023-10-25', '1', '1', '1', '11'),
('2', '2023-10-26', '2', '2', '2', '12'),
('3', '2023-10-27', '3', '3', '3', '13'),
('4', '2023-10-28', '4', '4', '4', '14'),
('5', '2023-10-29', '5', '5', '5', '15'),
('6', '2023-10-30', '6', '6', '6', '16'),
('7', '2023-10-31', '7', '7', '7', '17'),
('8', '2023-11-01', '8', '8', '8', '18'),
('9', '2023-11-02', '9', '9', '9', '19'),
('10', '2023-11-03', '10', '10', '10', '20'); */
--- SELECT id_pracownika, nazwisko FROM ksiegowość.pracownicy;
/*
SELECT kp.id_pracownika
,kpen.kwota
,kprem.kwota
FROM ksiegowość.pracownicy kp
INNER JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
INNER JOIN ksiegowość.pensje kpen
ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowość.premie kprem
ON kprem.id_premii = kw.id_premii
WHERE (COALESCE(kprem.kwota, CAST(0 as money)) + COALESCE(kpen.kwota, CAST(0 as money)))> CAST(1000 as money)
*/
/*
SELECT kp.id_pracownika
,kpen.kwota
,kprem.kwota
FROM ksiegowość.pracownicy kp
INNER JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
INNER JOIN ksiegowość.pensje kpen
ON kpen.id_pensji=kw.id_pensji
INNER JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
WHERE kprem.kwota IS NULL
AND kpen.kwota>CAST(2000 as money);
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
FROM ksiegowość.pracownicy kp
WHERE kp.imie like 'J%';
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
FROM ksiegowość.pracownicy kp
WHERE kp.nazwisko like '%n%'
AND kp.imie like '%a'
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
,SUM(kg.liczba_godzin -6) as nadgodziny
FROM ksiegowość.pracownicy kp
JOIN ksiegowość.godziny kg
ON kp.id_pracownika = kg.id_pracownika
GROUP BY kp.id_pracownika, DATE_PART('month', kg.data_)
ORDER BY DATE_PART('month', kg.data_) ASC;
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
,kpen.kwota
,kprem.kwota
FROM ksiegowość.pracownicy kp
INNER JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
INNER JOIN ksiegowość.pensje kpen
ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowość.premie kprem
ON kprem.id_premii = kw.id_premii
WHERE (COALESCE(kprem.kwota, CAST(0 as money)) + COALESCE(kpen.kwota, CAST(0 as money)))> CAST(1500 as money)
AND (COALESCE(kprem.kwota, CAST(0 as money)) + COALESCE(kpen.kwota, CAST(0 as money)))< CAST(3000 as money)
*/
/*
UPDATE ksiegowość.premie
SET kwota=NULL
WHERE id_premii in ('11','12','13','15')
*/
/*
SELECT kp.id_pracownika 
,kp.imie
,kp.nazwisko
,kprem.kwota
,SUM(kg.liczba_godzin - 6) as nadgodziny
FROM ksiegowość.pracownicy kp
JOIN ksiegowość.godziny kg
ON kp.id_pracownika=kg.id_pracownika
JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
WHERE kprem.kwota IS NULL
GROUP BY kp.id_pracownika, DATE_PART('month',kg.data_), kprem.kwota
HAVING SUM(kg.liczba_godzin - 6)>0
ORDER BY DATE_PART('month', kg.data_) ASC;
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
,kpen.kwota
FROM ksiegowość.pracownicy kp
JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
JOIN ksiegowość.pensje kpen
ON kpen.id_pensji=kw.id_pensji
GROUP BY kp.id_pracownika, kpen.kwota
ORDER BY kpen.kwota DESC;
*/
/*
SELECT kp.id_pracownika
,kp.imie
,kp.nazwisko
,kpen.kwota
,kprem.kwota
FROM ksiegowość.pracownicy kp
JOIN ksiegowość.wynagrodzenia kw
ON kp.id_pracownika=kw.id_pracownika
JOIN ksiegowość.pensje kpen
ON kpen.id_pensji=kw.id_pensji
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
GROUP BY kp.id_pracownika, kpen.kwota, kprem.kwota
ORDER BY kpen.kwota DESC, kprem.kwota DESC;
*/
/*
SELECT kpen.stanowisko, COUNT(kpen.stanowisko) AS liczba_pracowników
FROM ksiegowość.pensje kpen
GROUP BY kpen.stanowisko;
*/
/*
SELECT 
kpen.stanowisko
,ROUND(AVG( CAST(kpen.kwota + COALESCE(kprem.kwota, CAST(0 as money)) AS numeric))) AS średnia
,MAX( CAST(kpen.kwota + COALESCE(kprem.kwota, CAST(0 as money)) AS numeric)) AS Maks
,MIN( CAST(kpen.kwota + COALESCE(kprem.kwota, CAST(0 as money)) AS numeric)) AS Mini
FROM ksiegowość.pensje kpen
JOIN ksiegowość.wynagrodzenia kw
ON kpen.id_pensji=kw.id_pensji
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
WHERE kpen.stanowisko='Asystent'
GROUP BY kpen.stanowisko
ORDER BY kpen.stanowisko;
*/
/*
SELECT 
SUM(CAST(kpen.kwota+COALESCE(kprem.kwota, CAST(0 as money)) AS numeric)) AS suma_wynagrodzeń
FROM ksiegowość.pensje kpen
JOIN ksiegowość.wynagrodzenia kw
ON kpen.id_pensji = kw.id_pensji
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii;
*/
/*
SELECT 
kpen.stanowisko
,SUM(CAST(kpen.kwota+COALESCE(kprem.kwota, CAST(0 as money)) AS numeric)) AS suma_wynagrodzeń
FROM ksiegowość.pensje kpen
JOIN ksiegowość.wynagrodzenia kw
ON kpen.id_pensji = kw.id_pensji
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
GROUP BY kpen.stanowisko
ORDER BY suma_wynagrodzeń ASC; 
*/
/*
SELECT 
kpen.stanowisko
,COUNT(kprem.kwota) AS liczba_premii
FROM ksiegowość.pensje kpen
JOIN ksiegowość.wynagrodzenia kw
ON kpen.id_pensji = kw.id_pensji
JOIN ksiegowość.premie kprem
ON kprem.id_premii=kw.id_premii
GROUP BY kpen.stanowisko
ORDER BY liczba_premii ASC; 
*/
/*
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (SELECT pr. id_pracownika
FROM  ksiegowosc.pracownicy pr
JOIN ksiegowosc.wynagrodzenie w ON w.id_pracownika=pr.id_pracownika
JOIN ksiegowosc.godziny g ON w.id_godziny=g.id_godziny						
JOIN ksiegowosc.pensje pe ON pe.id_pensji = w.id_pensji 
WHERE pe.kwota < 4200);
*/