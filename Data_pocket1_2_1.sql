INSERT INTO Goods VALUES (1, '������ ��� �����������', 7512);
INSERT INTO Goods VALUES (2, 'GeForce 6600GT(NV 43)', 1511);
INSERT INTO Goods VALUES (3, 'Cirrus Logic CS4382', 2171);
INSERT INTO Goods VALUES (4, '��-������� AH-IPS', 1793);
INSERT INTO Goods VALUES (1118, 'HAKKO 900S', 27);
INSERT INTO Goods VALUES (1157, '���� ������-�', 40);
INSERT INTO Goods VALUES (2108, 'LG 43UH619V', 1567);
INSERT INTO Goods VALUES (2109, 'DEGEN DE-1123', 897);

INSERT INTO Type_of_Good VALUES (1, 3, '�������������');
INSERT INTO Type_of_Good VALUES (2, 2, '�������������');
INSERT INTO Type_of_Good VALUES (3, 4, '�������������');
INSERT INTO Type_of_Good VALUES (11, 2108, '�����');
INSERT INTO Type_of_Good VALUES	(13, 2109, '�����');
INSERT INTO Type_of_Good VALUES	(27, 1118, '������������');
INSERT INTO Type_of_Good VALUES	(33, 1157, '������������');

INSERT INTO Firms VALUES (1, 'LG Electronics', '���');
INSERT INTO Firms VALUES (2, '���������', '���');
INSERT INTO Firms VALUES (3, 'Hakko', '���');
INSERT INTO Firms VALUES (4, '�.�����', '���');

INSERT INTO Persons VALUES (1, '��������� ����� LG Russia', '', 1, '127018, ������, ������������� ��������, �.14/1. �.3',
'7(499)372-49-99', 'corp@lg-russia.ru');
INSERT INTO Persons VALUES (2, '����������� ���� � ������', '', 2, '197341, �����-���������, ����������� ��., �.26',
 '8(499)404-18-94', 'info@hakko-shop.ru');
INSERT INTO Persons VALUES (3, '��������� ��������� �� ���������� ����������, ������������ � ����������', 
'��������� ��������� ����������', 4, '105066 �. ������, ��. ������ ��������������, �.40/12, ���.20', '8(495)644-28-48, �������. 7385, 7232', 'ekaterina.prvakova@mvideo.ru');
INSERT INTO Persons VALUES (4, '����� ������ �� ������ � �������������� ���������', '����� ���������', 2, 
'125493 �. ������, ��. ��������, �.14', '8-800-250-25-25', 'corp@eldorado.ru');

INSERT INTO Orders VALUES (257, 3, 390000.00, 50000.00, DATE '2017-09-09');
INSERT INTO Orders VALUES	(258, 4, 560000.00, 45000.00, DATE '2017-09-11');
INSERT INTO Orders VALUES	(361, 2, 440000.00, 35000.00, DATE '2017-11-30');

INSERT INTO OrderDetails VALUES (309, 257, 2108, 50, '��.');
INSERT INTO OrderDetails VALUES	(310, 257, 2109, 30, '��.');
INSERT INTO OrderDetails VALUES	(311, 258, 2109, 40, '��.');
INSERT INTO OrderDetails VALUES	(312, 258, 2108, 15, '��.');
INSERT INTO OrderDetails VALUES	(562, 361, 2109, 10, '��.');

INSERT INTO Supplies VALUES (267, 1, 120000.00, 15000.00, DATE '2017-09-15');
INSERT INTO Supplies VALUES	(268, 2, 60000.00, 7000.00, DATE '2017-09-17');
INSERT INTO Supplies VALUES	(374, 1, 270000.00, 25000.00, DATE '2017-11-30');

INSERT INTO SupplyDetails VALUES (332, 267, 1, 700, '��.', 567);
INSERT INTO SupplyDetails VALUES (333, 267, 3, 800, '��.', 677);
INSERT INTO SupplyDetails VALUES (334, 268, 1118, 20, '��.', 20);
INSERT INTO SupplyDetails VALUES (408, 374, 2, 650, '��.', 540);
INSERT INTO SupplyDetails VALUES (409, 374, 4, 170, '��.', 110);