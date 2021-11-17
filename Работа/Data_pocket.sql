use Kurs;
INSERT INTO dbo.Goods(ID_good, Name, Quantity) VALUES
                     (1, 'Модуль ОЗУ стандартный', 7512),
					 (2, 'GeForce 6600GT(NV 43)', 1511),
					 (3, 'Cirrus Logic CS4382', 2171),
					 (4, 'ЖК-дисплей AH-IPS', 1793),
					 (1118, 'HAKKO 900S', 27),
					 (1157, 'Клей Гирлен-У', 40),
					 (2108, 'LG 43UH619V', 1567),
					 (2109, 'DEGEN DE-1123', 897);
INSERT INTO dbo.Type_of_Good(Number, ID_good, Type_of_good) VALUES
                            (1, 3, 'Комплектующее'),
							(2, 2, 'Комплектующее'),
							(3, 4, 'Комплектующее'),
							(11, 2108, 'Товар'),
							(13, 2109, 'Товар'),
							(27, 1118, 'Оборудование'),
							(33, 1157, 'Оборудование');
INSERT INTO dbo.Persons(ID_person, Name, Adres, Telephone, E_mail) VALUES
                            (1, 'LG Electronics', 'Сеул', '8-800-200-7676', 'lg@gmail.com'),
							(2, 'Hakko', 'Токио', '8-800-111-7070', 'hakko@hakkorus.ru'),
							(3, 'М.Видео', 'Москва', '8(495)777-777-5', '24@mvideo.ru'),
							(4, 'Техносила', 'Москва', '+7(495)640-94-74', 'zakupki@technosila.ru');
INSERT INTO dbo.Type_of_Person(Number, ID_person, Type_of_person) VALUES
                            (1, 1, 'ОАО'),
							(2, 4, 'ООО'),
							(3, 2, 'ОАО'),
							(4, 3, 'ООО');
INSERT INTO dbo.Orders(ID_order, ID_cust, Price, Price_of_del, Date_of_sh) VALUES
                      (257, 3, 390000.00, 50000.00, '20160909'),
					  (258, 4, 560000.00, 45000.00, '20160911'),
					  (361, 2, 440000.00, 35000.00, '20161130');
INSERT INTO dbo.OrderDetails(Number, ID_order, ID_good, Quantity, Unit) VALUES
                            (309, 257, 2108, 50, 'шт.'),
							(310, 257, 2109, 30, 'шт.'),
							(311, 258, 2109, 40, 'шт.'),
							(312, 258, 2108, 15, 'шт.'),
							(562, 361, 2109, 10, 'шт.');
INSERT INTO dbo.Supplies(ID_sup, ID_prov, Cost, Cost_of_sup, Date_of_arr) VALUES
                        (267, 1, 120000.00, 15000.00, '20160915'),
						(268, 2, 60000.00, 7000.00, '20160917'),
						(374, 1, 270000.00, 25000.00, '20161130');
INSERT INTO dbo.SupplyDetails(Number, ID_sup, ID_good, Quantity, Unit, Quan_kept) VALUES
                        (332, 267, 1, 700, 'шт.', 567),
						(333, 267, 3, 800, 'шт.', 677),
						(334, 268, 1118, 20, 'шт.', 20),
						(408, 374, 2, 650, 'шт.', 540),
						(409, 374, 4, 170, 'шт.', 110);