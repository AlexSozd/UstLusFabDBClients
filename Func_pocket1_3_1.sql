CREATE OR REPLACE PROCEDURE Get_num_Supply_1
(
  ido OUT INT
)
IS 
BEGIN
  SELECT MAX(ID_sup)+1 INTO ido FROM Supplies;
END Get_num_Supply_1;

CREATE OR REPLACE PROCEDURE Get_num_Order_1
(
  ido OUT INT
)
IS
BEGIN
  SELECT MAX(ID_order)+1 INTO ido FROM Orders;
END Get_num_Order_1;

CREATE OR REPLACE PROCEDURE Get_num_OrderDetail_1
(
  ido OUT INT
)
IS  
BEGIN
  SELECT MAX(ID_ordet)+1 INTO ido FROM OrderDetails;
END Get_num_OrderDetail_1;

CREATE OR REPLACE PROCEDURE Get_num_SupplyDetail_1
(
  ido OUT INT
)
IS
BEGIN
  SELECT MAX(ID_sudet)+1 INTO ido FROM SupplyDetails;
END Get_num_SupplyDetail_1;

CREATE OR REPLACE PROCEDURE Get_num_Person_1
(
  ido OUT INT
)
IS 
BEGIN
  SELECT MAX(ID_person)+1 INTO ido FROM Persons;
END Get_num_Person_1;

CREATE OR REPLACE PROCEDURE Get_num_Good_1
(
  ido OUT INT
)
IS 
BEGIN
  SELECT MAX(ID_good)+1 INTO ido FROM Goods;
END Get_num_Good_1;

CREATE OR REPLACE PROCEDURE Get_num_TypeGood_1
(
  ido OUT INT
)
IS
BEGIN
  SELECT MAX(ID_type)+1 INTO ido FROM Type_of_Good;
END Get_num_TypeGood_1;

CREATE OR REPLACE PROCEDURE Get_num_Firm_1
(
  ido OUT INT
)
IS
BEGIN
  SELECT MAX(ID_firm)+1 INTO ido FROM Firms;
END Get_num_Firm_1;