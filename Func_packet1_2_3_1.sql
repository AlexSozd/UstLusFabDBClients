/*CREATE OR REPLACE FUNCTION ShowGoods
RETURN Goods%ROWTYPE
IS
BEGIN
  SELECT * FROM Goods;
END;*/

/*CREATE OR REPLACE FUNCTION ShowOrderForSTime
(date1 IN DATE, date2 IN DATE)
RETURN Orders%ROWTYPE
IS
BEGIN
  SELECT * FROM Orders WHERE ((Date_of_sh >= date1) AND (Date_of_sh <= date2));
END ShowOrderForSTime;

CREATE OR REPLACE FUNCTION ShowListGood
RETURN Goods%ROWTYPE
IS
BEGIN
  SELECT ID_good, Appel FROM Goods;
END ShowListGood;*/

/*CREATE OR REPLACE FUNCTION Get_num_Supply
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_sup)+1 INTO ido FROM Supplies;
  RETURN ido;
END Get_num_Supply;*/

/*CREATE OR REPLACE FUNCTION Get_num_OrderDetail
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_ordet)+1 INTO ido FROM OrderDetails;
  RETURN ido;
END Get_num_OrderDetail;*/

/*CREATE OR REPLACE FUNCTION Get_num_SupplyDetail
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_sudet)+1 INTO ido FROM SupplyDetails;
  RETURN ido;
END Get_num_SupplyDetail;*/

/*CREATE OR REPLACE FUNCTION ShowProv
RETURN Firms%ROWTYPE
IS
BEGIN
  SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies);
END ShowProv;

CREATE OR REPLACE FUNCTION ShowClients
RETURN Firms%ROWTYPE
IS
BEGIN
  SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders);
END ShowClients;

CREATE OR REPLACE FUNCTION ShowSupplyForSTime
(date1 IN DATE, date2 IN DATE)
RETURN Supplies%ROWTYPE
IS
BEGIN
  SELECT * FROM Supplies WHERE ((Date_of_arr >= date1) AND (Date_of_arr <= date2));
END ShowSupplyForSTime;

CREATE OR REPLACE FUNCTION ShowListClients
RETURN Firms%ROWTYPE
IS
BEGIN
  SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders);
END ShowListClients;
  
CREATE OR REPLACE FUNCTION ShowListProv
RETURN Firms%ROWTYPE
IS
BEGIN
  SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies);
END;*/

/*CREATE OR REPLACE FUNCTION Get_num_Person
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_person)+1 INTO ido FROM Persons;
  RETURN ido;
END Get_num_Person;*/

/*CREATE OR REPLACE FUNCTION Get_num_Good
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_good)+1 INTO ido FROM Goods;
  RETURN ido;
END Get_num_Good;*/

/*CREATE OR REPLACE FUNCTION Get_num_TypeGood
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_type)+1 INTO ido FROM Type_of_Good;
  RETURN ido;
END Get_num_TypeGood;*/

/*CREATE OR REPLACE PROCEDURE DeletePerson
(id_per IN INT)
IS
  
BEGIN
	 DELETE FROM Persons WHERE ID_person = id_per;
END DeletePerson;*/

/*CREATE OR REPLACE PROCEDURE DeleteFirm
(id_fir IN INT)
IS
  
BEGIN
	 DELETE FROM Firms WHERE ID_firm = id_fir;
END DeleteFirm;*/

CREATE OR REPLACE PROCEDURE DeleteGood
(id_g IN INT)
IS
  
BEGIN
	 DELETE FROM Goods WHERE ID_good = id_g;
END DeleteGood;

/*CREATE OR REPLACE FUNCTION ShowSupplies
RETURN Supplies%ROWTYPE
IS
  
BEGIN
  SELECT * FROM Supplies;
END ShowSupplies;

CREATE OR REPLACE FUNCTION ShowOrders
RETURN Orders%ROWTYPE
IS
  
BEGIN
  SELECT * FROM Orders;
END ShowOrders;

CREATE OR REPLACE FUNCTION ShowContacts
(id_fir IN INT)
RETURN Persons%ROWTYPE
IS
BEGIN
   SELECT * FROM Persons WHERE ID_firm = id_fir;
END ShowContacts;*/