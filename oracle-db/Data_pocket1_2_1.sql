INSERT INTO Goods VALUES (1, 'Модуль ОЗУ стандартный', 7512);
INSERT INTO Goods VALUES (2, 'GeForce 6600GT(NV 43)', 1511);
INSERT INTO Goods VALUES (3, 'Cirrus Logic CS4382', 2171);
INSERT INTO Goods VALUES (4, 'ЖК-дисплей AH-IPS', 1793);
INSERT INTO Goods VALUES (1118, 'HAKKO 900S', 27);
INSERT INTO Goods VALUES (1157, 'Клей Гирлен-У', 40);
INSERT INTO Goods VALUES (2108, 'LG 43UH619V', 1567);
INSERT INTO Goods VALUES (2109, 'DEGEN DE-1123', 897);

INSERT INTO Type_of_Good VALUES (1, 3, 'Комплектующее');
INSERT INTO Type_of_Good VALUES (2, 2, 'Комплектующее');
INSERT INTO Type_of_Good VALUES (3, 4, 'Комплектующее');
INSERT INTO Type_of_Good VALUES (11, 2108, 'Товар');
INSERT INTO Type_of_Good VALUES	(13, 2109, 'Товар');
INSERT INTO Type_of_Good VALUES	(27, 1118, 'Оборудование');
INSERT INTO Type_of_Good VALUES	(33, 1157, 'Оборудование');

INSERT INTO Firms VALUES (1, 'LG Electronics', 'ОАО');
INSERT INTO Firms VALUES (2, 'Эльдорадо', 'ООО');
INSERT INTO Firms VALUES (3, 'Hakko', 'ОАО');
INSERT INTO Firms VALUES (4, 'М.Видео', 'ООО');

INSERT INTO Persons VALUES (1, 'Сервисный центр LG Russia', '', 1, '127018, Москва, Комсомольский проспект, д.14/1. к.3', '7(499)372-49-99', 'corp@lg-russia.ru');
INSERT INTO Persons VALUES (2, 'Центральный офис в России', '', 2, '197341, Санкт-Петербург, Коломяжский пр., д.26', '8(499)404-18-94', 'info@hakko-shop.ru');
INSERT INTO Persons VALUES (3, 'Ассистент директора по управлению поставками, дистрибуцией и логистикой', 'Первакова Екатерина Евгеньевна', 4, 
'105066 г. Москва, ул. Нижняя Красносельская, д.40/12, стр.20', '8(495)644-28-48, добавоч. 7385, 7232', 'ekaterina.prvakova@mvideo.ru');
INSERT INTO Persons VALUES (4, 'Глава отдела по работе с корпоративными клиентами', 'Роман Галиметов', 2, '125493 г. Москва, ул. Смольная, д.14', '8-800-250-25-25', 'corp@eldorado.ru');

INSERT INTO Orders VALUES (257, 3, 390000.00, 50000.00, DATE '2017-09-09');
INSERT INTO Orders VALUES (258, 4, 560000.00, 45000.00, DATE '2017-09-11');
INSERT INTO Orders VALUES (361, 2, 440000.00, 35000.00, DATE '2017-11-30');

INSERT INTO OrderDetails VALUES (309, 257, 2108, 50, 'шт.');
INSERT INTO OrderDetails VALUES	(310, 257, 2109, 30, 'шт.');
INSERT INTO OrderDetails VALUES	(311, 258, 2109, 40, 'шт.');
INSERT INTO OrderDetails VALUES	(312, 258, 2108, 15, 'шт.');
INSERT INTO OrderDetails VALUES	(562, 361, 2109, 10, 'шт.');

INSERT INTO Supplies VALUES (267, 1, 120000.00, 15000.00, DATE '2017-09-15');
INSERT INTO Supplies VALUES (268, 2, 60000.00, 7000.00, DATE '2017-09-17');
INSERT INTO Supplies VALUES (374, 1, 270000.00, 25000.00, DATE '2017-11-30');

INSERT INTO SupplyDetails VALUES (332, 267, 1, 700, 'шт.', 567);
INSERT INTO SupplyDetails VALUES (333, 267, 3, 800, 'шт.', 677);
INSERT INTO SupplyDetails VALUES (334, 268, 1118, 20, 'шт.', 20);
INSERT INTO SupplyDetails VALUES (408, 374, 2, 650, 'шт.', 540);
INSERT INTO SupplyDetails VALUES (409, 374, 4, 170, 'шт.', 110);
