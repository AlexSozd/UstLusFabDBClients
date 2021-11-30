/*CREATE OR REPLACE FUNCTION ShowGoods
RETURN Goods_t
IS
  tovars Goods_t;
BEGIN
  tovars := Goods_t();
  SELECT(CAST(MULTISET (SELECT * FROM Goods) AS Goods_t)) INTO tovars FROM DUAL;
  RETURN tovars;
END;*/

/*CREATE OR REPLACE FUNCTION ShowOrderForSTime
(date1 IN DATE, date2 IN DATE)
RETURN Order_t
IS
  ord Order_t;
BEGIN
  ord := Order_t();
  SELECT (CAST(MULTISET (SELECT * FROM Orders WHERE ((Date_of_sh >= date1) AND (Date_of_sh <= date2))) AS Order_t)) INTO ord FROM DUAL;
  RETURN ord;
END ShowOrderForSTime;*/

CREATE OR REPLACE FUNCTION ShowListGood
RETURN Goods_t1
IS
  Gl Goods_t1;
BEGIN
  Gl := Goods_t1();
  SELECT(CAST(MULTISET(SELECT ID_good, Appel FROM Goods) AS Goods_t1)) INTO Gl FROM DUAL;
  RETURN Gl;
END ShowListGood;

CREATE OR REPLACE FUNCTION ShowProv
RETURN Firm_t1
IS
  fir Firm_t1;
BEGIN
  fir := Firm_t1();
  SELECT(CAST(MULTISET(SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies))
  AS Firm_t1)) 
  INTO fir FROM DUAL;
  RETURN fir;
END ShowProv;

CREATE OR REPLACE FUNCTION ShowClients
RETURN Firm_t1
IS
  fir Firm_t1;
BEGIN
  fir := Firm_t1();
  SELECT(CAST(MULTISET(SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders))
  AS Firm_t1))
  INTO fir FROM DUAL;
  RETURN fir;
END ShowClients;

CREATE OR REPLACE FUNCTION ShowSupplyForSTime
(date1 IN DATE, date2 IN DATE)
RETURN Supply_t
IS
  sup Supply_t;
BEGIN
  sup := Supply_t();
  SELECT(CAST(MULTISET(SELECT * FROM Supplies WHERE ((Date_of_arr >= date1) AND (Date_of_arr <= date2))) AS Supply_t))
  INTO sup FROM DUAL;
  RETURN sup;
END ShowSupplyForSTime;

CREATE OR REPLACE FUNCTION ShowListClients
RETURN Firm_t2
IS
  fir Firm_t2;
BEGIN
  fir := Firm_t2();
  SELECT(CAST(MULTISET(SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders)) AS Firm_t2))
  INTO fir FROM DUAL;
  RETURN fir;
END ShowListClients;
  
CREATE OR REPLACE FUNCTION ShowListProv
RETURN Firm_t2
IS
  fir Firm_t2;
BEGIN
  fir := Firm_t2();
  SELECT(CAST(MULTISET(SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies)) AS Firm_t2))
  INTO fir FROM DUAL;
END;

CREATE OR REPLACE FUNCTION ShowSupplies
RETURN Supply_t
IS
  sup Supply_t;
BEGIN
  sup := Supply_t();
  SELECT(CAST(MULTISET(SELECT * FROM Supplies) AS Supply_t)) INTO sup FROM DUAL;
  RETURN sup;
END ShowSupplies;

CREATE OR REPLACE FUNCTION ShowOrders
RETURN Order_t
IS
  ord Order_t;
BEGIN
  ord := Order_t();
  SELECT(CAST(MULTISET(SELECT * FROM Orders) AS Order_t)) INTO ord FROM DUAL;
  RETURN ord;
END ShowOrders;

CREATE OR REPLACE FUNCTION ShowContacts
(id_fir IN INT)
RETURN Contacts_t
IS
  conts Contacts_t;
BEGIN
  conts := Contacts_t();
  SELECT(CAST(MULTISET(SELECT * FROM Persons WHERE ID_firm = id_fir) AS Contacts_t)) INTO conts FROM DUAL;
  RETURN conts;
END ShowContacts;