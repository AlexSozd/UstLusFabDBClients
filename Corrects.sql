DELETE FROM Persons WHERE ID_person = 3;
DELETE FROM Persons WHERE ID_person = 4;

SELECT * FROM Goods;
SELECT * FROM Type_of_Good;
SELECT * FROM Firms;
SELECT * FROM Persons;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Supplies;
SELECT * FROM SupplyDetails;

INSERT INTO Persons VALUES (3, '��������� ��������� �� ���������� ����������, ������������ � ����������', 
'��������� ��������� ����������', 4, '105066 �. ������, ��. ������ ��������������, �.40/12, ���.20', '8(495)644-28-48, �������. 7385, 7232', 'ekaterina.prvakova@mvideo.ru');
INSERT INTO Persons VALUES (4, '����� ������ �� ������ � �������������� ���������', '����� ���������', 2, 
'125493 �. ������, ��. ��������, �.14', '8-800-250-25-25', 'corp@eldorado.ru');