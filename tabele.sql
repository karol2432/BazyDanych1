CREATE TABLE rozliczenia.pracownicy
(
  id_pracownika character varying NOT NULL,
  imie character varying NOT NULL,
  nazwisko character varying NOT NULL,
  adres character varying NOT NULL,
  telefon character varying NOT NULL,
  CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika)
);
CREATE TABLE rozliczenia.godziny
(
	id_godziny character varying NOT NULL,
	data_ character varying,
	liczba_godzin character varying,
	id_pracownika character varying,
	CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny)
);
CREATE TABLE rozliczenia.premie
(
	id_premii character varying NOT NULL,
	rodzaj character varying,
	kwota character varying,
	CONSTRAINT premie_pkey PRIMARY KEY (id_premii)
);

CREATE TABLE rozliczenia.pensje
(
    id_pensji character varying NOT NULL,
	stanowisko character varying,
	kwota character varying NOT NULL,
	id_premii character varying,	
	CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji)
);



