SELECT nazwisko, adres FROM rozliczenia.pracownicy;

SELECT
DATE_PART('dow',TO_DATE(data_, 'YYYY.MM.DD')) AS dzien_tygodnia,
DATE_PART('month', TO_DATE(data_, 'YYYY.MM.DD')) AS miesiac
FROM rozliczenia.godziny;


ALTER TABLE rozliczenia.pensje RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto NUMERIC;

UPDATE rozliczenia.pensje
set kwota_netto = (CAST(kwota_brutto AS NUMERIC)*0.85);