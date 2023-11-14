ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy(id_pracownika)
ON DELETE SET NULL;

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii)
ON DELETE SET NULL;