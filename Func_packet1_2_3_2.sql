/*CREATE OR REPLACE FUNCTION ShowGoods
RETURN Goods_t
IS
  tovars Goods_t;
BEGIN
  tovars := Goods_t();
  SELECT(CAST(MULTISET (SELECT * FROM Goods) AS Goods_t)) INTO tovars FROM DUAL;
  RETURN tovars;
END;*/

CREATE OR REPLACE FUNCTION ShowOrderForSTime
(date1 IN DATE, date2 IN DATE)
RETURN Order_t
IS
  ord Order_t;
BEGIN
  ord := Order_t();
  SELECT (CAST(MULTISET (SELECT * FROM Orders WHERE ((Date_of_sh >= date1) AND (Date_of_sh <= date2))) AS Order_t)) INTO ord FROM DUAL;
  RETURN ord;
END ShowOrderForSTime;

/*CREATE OR REPLACE FUNCTION ShowListGood
RETURN Goods%ROWTYPE
IS
BEGIN
  SELECT ID_good, Appel FROM Goods;
END ShowListGood;*/

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