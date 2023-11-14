INSERT INTO rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
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

INSERT INTO rozliczenia.godziny (id_godziny, data_, liczba_godzin, id_pracownika)
VALUES
    ('1', '2023.10.25', '8', '1'),
    ('2', '2023.10.26', '7', '2'),
    ('3', '2023.10.27', '6', '3'),
    ('4', '2023.10.28', '8', '4'),
    ('5', '2023.10.29', '7', '5'),
    ('6', '2023-10.30', '9', '6'),
    ('7', '2023.10.31', '8', '7'),
    ('8', '2023.11.01', '7', '8'),
    ('9', '2023.11.02', '6', '9'),
    ('10', '2023.11.03', '8', '10');

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
    ('11', 'nr 1', '500'),
    ('12', 'nr 2', '400'),
    ('13', 'nr 3', '300'),
    ('14', 'nr 4', '450'),
    ('15', 'nr 5', '420'),
    ('16', 'nr 6', '510'),
    ('17', 'nr 7', '410'),
    ('18', 'nr 8', '320'),
    ('19', 'nr 9', '460'),
    ('20', 'nr 10', '430');	

INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
    ('1', 'Prezes', '10000', '11'),
    ('2', 'Specjalista', '4000', '12'),
    ('3', 'Asystent', '3000', '13'),
    ('4', 'Konsultant', '4500', '14'),
    ('5', 'Analityk', '4200', '15'),
    ('6', 'Kierownik', '5100', '16'),
    ('7', 'Specjalista', '4100', '17'),
    ('8', 'Asystent', '3200', '18'),
    ('9', 'Ksiegowy', '4600', '19'),
    ('10', 'Programista', '4300', '20');
	
	

