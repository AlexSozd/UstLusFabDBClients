use Kurs;
IF OBJECT_ID('dbo.Goods', 'U') IS NOT NULL
   DROP TABLE dbo.Goods;
CREATE TABLE dbo.Goods
(
   ID_good INT PRIMARY KEY,
   Name NVARCHAR(255) NOT NULL,
   Quantity INT NOT NULL
   CHECK(Quantity>=0)
);
/*INSERT INTO dbo.Goods(ID_good, Name, Quantity) VALUES
                     (1, 'Модуль ОЗУ стандартный', 7512),
					 (2, 'GeForce 6600GT(NV 43)', 1511),
					 (3, 'Cirrus Logic CS4382', 2171),
					 (4, 'ЖК-дисплей AH-IPS', 1793),
					 (1118, 'HAKKO 900S', 27),
					 (1157, 'Клей Гирлен-У', 40),
					 (2108, 'LG 43UH619V', 1567),
					 (2109, 'DEGEN DE-1123', 897);*/
IF OBJECT_ID('dbo.Type_of_Good', 'U') IS NOT NULL
   DROP TABLE dbo.Type_of_Good;
CREATE TABLE dbo.Type_of_Good
(
   Number INT PRIMARY KEY,
   ID_good INT NOT NULL FOREIGN KEY REFERENCES dbo.Goods(ID_good),
   Type_of_good NVARCHAR(255) NOT NULL
);
/*INSERT INTO dbo.Type_of_Good(Number, ID_good, Type_of_good) VALUES
                            (1, 3, 'Комплектующее'),
							(2, 2, 'Комплектующее'),
							(3, 4, 'Комплектующее'),
							(11, 2108, 'Товар'),
							(13, 2109, 'Товар'),
							(27, 1118, 'Оборудование'),
							(33, 1157, 'Оборудование');*/
IF OBJECT_ID('dbo.Persons', 'U') IS NOT NULL
   DROP TABLE dbo.Persons;
CREATE TABLE dbo.Persons
(
   ID_person INT PRIMARY KEY,
   Name NVARCHAR(255) NOT NULL,
   Adres NVARCHAR(255) NOT NULL,
   Telephone NVARCHAR(255) NOT NULL,
   E_mail NVARCHAR(255) NULL 
);
/*INSERT INTO dbo.Persons(ID_person, Name, Adres, Telephone, E_mail) VALUES
                            (1, 'LG Electronics', 'Сеул', '8-800-200-7676', 'lg@gmail.com'),
							(2, 'Hakko', 'Токио', '8-800-111-7070', 'hakko@hakkorus.ru'),
							(3, 'М.Видео', 'Москва', '8(495)777-777-5', '24@mvideo.ru'),
							(4, 'Техносила', 'Москва', '+7(495)640-94-74', 'zakupki@technosila.ru');*/
IF OBJECT_ID('dbo.Type_of_Person', 'U') IS NOT NULL
   DROP TABLE dbo.Type_of_Person;
CREATE TABLE dbo.Type_of_Person
(
   Number INT PRIMARY KEY,
   ID_person INT NOT NULL FOREIGN KEY REFERENCES dbo.Persons(ID_person),
   Type_of_person NVARCHAR(255) NOT NULL
);
/*INSERT INTO dbo.Type_of_Person(Number, ID_person, Type_of_person) VALUES
                            (1, 1, 'ОАО'),
							(2, 4, 'ООО'),
							(3, 2, 'ОАО'),
							(4, 3, 'ООО');*/
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
   DROP TABLE dbo.Orders;
CREATE TABLE dbo.Orders
(
   ID_order INT PRIMARY KEY,
   ID_cust INT NOT NULL FOREIGN KEY REFERENCES dbo.Persons(ID_person),
   Price MONEY NOT NULL,
   Price_of_del MONEY NULL,
   Date_of_sh DATE NULL,
   CHECK((Price>=0)AND(Price_of_del>=0))
);
/*INSERT INTO dbo.Orders(ID_order, ID_cust, Price, Price_of_del, Date_of_sh) VALUES
                      (257, 3, 390000.00, 50000.00, '20160909'),
					  (258, 4, 560000.00, 45000.00, '20160911'),
					  (361, 2, 440000.00, 35000.00, '20161130');*/
IF OBJECT_ID('dbo.OrderDetails', 'U') IS NOT NULL
   DROP TABLE dbo.OrderDetails;
CREATE TABLE dbo.OrderDetails
(
   Number INT PRIMARY KEY,
   ID_order INT NOT NULL FOREIGN KEY REFERENCES dbo.Orders(ID_order),
   ID_good INT NOT NULL FOREIGN KEY REFERENCES dbo.Goods(ID_good),
   Quantity INT NOT NULL,
   Unit NVARCHAR(255) NOT NULL,
   CHECK(Quantity>=0)
);
/*INSERT INTO dbo.OrderDetails(Number, ID_order, ID_good, Quantity, Unit) VALUES
                            (309, 257, 2108, 50, 'шт.'),
							(310, 257, 2109, 30, 'шт.'),
							(311, 258, 2109, 40, 'шт.'),
							(312, 258, 2108, 15, 'шт.'),
							(562, 361, 2109, 10, 'шт.');*/
IF OBJECT_ID('dbo.Supplies', 'U') IS NOT NULL
   DROP TABLE dbo.Supplies;
CREATE TABLE dbo.Supplies
(
   ID_sup INT PRIMARY KEY,
   ID_prov INT NOT NULL FOREIGN KEY REFERENCES dbo.Persons(ID_person),
   Cost MONEY NOT NULL,
   Cost_of_sup MONEY NULL,
   Date_of_arr DATE NULL,
   CHECK((Cost>=0)AND(Cost_of_sup>=0))
);
INSERT INTO dbo.Supplies(ID_sup, ID_prov, Cost, Cost_of_sup, Date_of_arr) VALUES
                        (267, 1, 120000.00, 15000.00, '20160915'),
						(268, 2, 60000.00, 7000.00, '20160917'),
						(374, 1, 270000.00, 25000.00, '20161130');
IF OBJECT_ID('dbo.SupplyDetails', 'U') IS NOT NULL
   DROP TABLE dbo.SupplyDetails;
CREATE TABLE dbo.SupplyDetails
(
   Number INT PRIMARY KEY,
   ID_sup INT NOT NULL FOREIGN KEY REFERENCES dbo.Supplies(ID_sup),
   ID_good INT NOT NULL FOREIGN KEY REFERENCES dbo.Goods(ID_good),
   Quantity INT NOT NULL,
   Unit NVARCHAR(255) NOT NULL,
   Quan_kept INT NOT NULL,
   CHECK((Quantity>=0)AND(Quan_kept>=0))
);
/*INSERT INTO dbo.SupplyDetails(Number, ID_sup, ID_good, Quantity, Unit, Quan_kept) VALUES
                        (332, 267, 1, 700, 'шт.', 567),
						(333, 267, 3, 800, 'шт.', 677),
						(334, 268, 1118, 20, 'шт.', 20),
						(408, 374, 2, 650, 'шт.', 540),
						(409, 374, 4, 170, 'шт.', 110);*/