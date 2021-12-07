CREATE OR REPLACE PROCEDURE InsertOrder
(id_ord1 IN INT, id_cust1 IN INT, pr1 IN NUMBER, pr_del1 IN NUMBER, data_of_sh1 IN DATE)
IS
BEGIN
   INSERT INTO Orders(ID_order, ID_cust, Price, Price_of_del, Date_of_sh) VALUES
	 (id_ord1, id_cust1, pr1, pr_del1, data_of_sh1);
END InsertOrder;

CREATE OR REPLACE PROCEDURE InsertSupply
(id_sup1 IN INT, id_prov1 IN INT, c1 IN NUMBER, c_sup1 IN NUMBER, data_of_arr1 IN DATE)
IS
BEGIN
   INSERT INTO Supplies(ID_sup, ID_prov, Costs, Cost_of_sup, Date_of_arr) VALUES
	 (id_sup1, id_prov1, c1, c_sup1, data_of_arr1);
END InsertSupply;

CREATE OR REPLACE PROCEDURE InsertOrderDetail
(id_ordet1 IN INT, id_ord1 IN INT, id_g1 IN INT, quan1 IN INT, un1 IN NVARCHAR2)
IS
BEGIN
   INSERT INTO OrderDetails(ID_ordet, ID_order, ID_good, Quantity, Unit) VALUES
	 (id_ordet1, id_ord1, id_g1, quan1, un1);
     UPDATE Goods 
     SET Quantity = Quantity - quan1 WHERE Goods.ID_good = id_g1;
END InsertOrderDetail;

CREATE OR REPLACE PROCEDURE InsertSupplyDetail
(id_sudet1 IN INT, id_sup1 IN INT, id_g IN INT, quan1 IN INT, un1 IN NVARCHAR2, quan_kpt IN INT)
IS
BEGIN
   INSERT INTO SupplyDetails(ID_sudet, ID_sup, ID_good, Quantity, Unit, Quan_kept) VALUES
	 (id_sudet1, id_sup1, id_g1, quan1, un1, quan_kpt1);
     UPDATE Goods 
     SET Quantity = Quantity + quan1 WHERE Goods.ID_good = id_g1;
END InsertSupplyDetail;

CREATE OR REPLACE PROCEDURE DeleteLastOrder
IS
BEGIN
  DELETE FROM Orders WHERE ID_order = (SELECT MAX(ID_order) FROM Orders);
END DeleteLastOrder;

CREATE OR REPLACE FUNCTION ShowGoods
RETURN Goods%ROWTYPE
IS
BEGIN
  SELECT * FROM Goods;
END;

CREATE OR REPLACE FUNCTION ShowOrderForSTime
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
END ShowListGood;

CREATE OR REPLACE FUNCTION Get_num_Order
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_order)+1 INTO ido FROM Orders;
  RETURN ido;
END Get_num_Order;

CREATE OR REPLACE FUNCTION Get_num_Supply
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_sup)+1 INTO ido FROM Supplies;
  RETURN ido;
END Get_num_Supply;

CREATE OR REPLACE FUNCTION Get_num_OrderDetail
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_ordet)+1 INTO ido FROM OrderDetails;
  RETURN ido;
END Get_num_OrderDetail;

CREATE OR REPLACE FUNCTION Get_num_SupplyDetail
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_sudet)+1 INTO ido FROM SupplyDetails;
  RETURN ido;
END Get_num_SupplyDetail;

CREATE OR REPLACE PROCEDURE DeleteLastSupply
IS
BEGIN
  DELETE FROM Supplies WHERE ID_sup = (SELECT MAX(ID_sup) FROM Supplies);
END DeleteLastSupply;

CREATE OR REPLACE FUNCTION ShowProv
RETURN Firms%ROWTYPE
IS
BEGIN
  --SELECT Persons.ID_person, Type_of_person, Name, Adres, Telephone, E_mail FROM (Persons JOIN Type_of_person on Persons.ID_person=Type_of_person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies);
  SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies);
END ShowProv;

CREATE OR REPLACE FUNCTION ShowClients
RETURN Firms%ROWTYPE
IS
BEGIN
  --SELECT Persons.ID_person, Type_of_person, Name, Adres, Telephone, E_mail FROM (Persons JOIN Type_of_person on Persons.ID_person=Type_of_person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_cust FROM Orders);
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
  --SELECT Type_of_person, Name FROM (Persons JOIN Type_of_Person on Persons.ID_person=Type_of_Person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_cust FROM Orders);
  SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders);
END ShowListClients;
  
CREATE OR REPLACE FUNCTION ShowListProv
RETURN Firms%ROWTYPE
IS
BEGIN
  --SELECT Type_of_person, Name FROM (Persons JOIN Type_of_Person on Persons.ID_person=Type_of_Person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies);
  SELECT Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies);
END;

CREATE OR REPLACE PROCEDURE InsertPerson
(id_per1 IN INT, tit1 IN NVARCHAR2, fio1 IN NVARCHAR2, id_fir1 IN INT, adr1 IN NVARCHAR2, tel1 IN NVARCHAR2, e_m1 IN NVARCHAR2)
IS
BEGIN
   INSERT INTO Persons(ID_person, Title, FIO, ID_firm, Adres, Telephone, E_mail) VALUES
	 (id_per1, tit1, fio1, id_fir1, adr1, tel1, e_m1);
END InsertPerson;

CREATE OR REPLACE PROCEDURE InsertFirm
(id_fir1 IN INT, app1 IN NVARCHAR2, id_t1 IN NVARCHAR2)
IS
BEGIN
   INSERT INTO Firms(ID_firm, Appel, Type_of_firm) VALUES
	 (id_fir1, app1, id_t1);
END InsertFirm;

CREATE OR REPLACE PROCEDURE InsertGood
(id_g1 IN INT, ap1 IN NVARCHAR2, quan1 IN INT)
IS
BEGIN
   INSERT INTO Goods(ID_good, Appel, Quantity) VALUES
	 (id_g1, ap1, quan1);
END InsertGood;

CREATE OR REPLACE PROCEDURE InsertTypeGood
(id_t1 IN INT, id_g1 IN INT, t1 IN NVARCHAR2)
IS
BEGIN
   INSERT INTO Type_of_Good(ID_type, ID_good, Type_of_good) VALUES
	 (id_t1, id_g1, t1);
END InsertTypeGood;

CREATE OR REPLACE FUNCTION Get_num_Person
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_person)+1 INTO ido FROM Persons;
  RETURN ido;
END Get_num_Person;

CREATE OR REPLACE FUNCTION Get_num_Good
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_good)+1 INTO ido FROM Goods;
  RETURN ido;
END Get_num_Good;

CREATE OR REPLACE FUNCTION Get_num_TypeGood
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_type)+1 INTO ido FROM Type_of_Good;
  RETURN ido;
END Get_num_TypeGood;

CREATE OR REPLACE PROCEDURE DeleteDefOrder
(id_ord IN INT)
IS  
BEGIN
  DELETE FROM Orders WHERE ID_order = id_ord AND Date_of_sh >= CAST(GETDATE()-1 AS DATE);
END DeleteDefOrder;

CREATE OR REPLACE PROCEDURE DeleteDefSupply
(id_s IN INT)
IS
  
BEGIN
  DELETE FROM Supplies WHERE ID_sup = id_s AND Date_of_arr >= CAST(GETDATE()-1 AS DATE);
END DeleteDefSupply;

CREATE OR REPLACE PROCEDURE DeletePerson
(id_per IN INT)
IS
  
BEGIN
  DELETE FROM Persons WHERE ID_person = id_per;
END DeletePerson;

CREATE OR REPLACE PROCEDURE DeleteFirm
(id_fir IN INT)
IS
  
BEGIN
  DELETE FROM Firms WHERE ID_firm = id_fir;
END DeleteFirm;

CREATE OR REPLACE PROCEDURE DeleteGood
(id_g IN INT)
IS
  
BEGIN
  DELETE FROM Goods WHERE ID_good = id_g;
END DeleteGood;

CREATE OR REPLACE FUNCTION ShowSupplies
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
END ShowContacts;

CREATE OR REPLACE TRIGGER trg_Order_delete_details 
AFTER DELETE ON Orders
FOR EACH ROW
DECLARE 
  cur_id INT; quan INT;
  
  CURSOR OrderQuan 
  IS
  SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted);
   
  ord_quan OrderQuan%ROWTYPE;
  
BEGIN
  OPEN OrderQuan;
  FETCH OrderQuan INTO ord_quan;
  cur_id := ord_quan.ID_good;
  quan := ord_quan.Quantity;
  WHILE SQL@@FETCH_STATUS = 0
  LOOP
    UPDATE Goods 
    SET Quantity = Quantity + quan WHERE Goods.ID_good = cur_id;
    FETCH OrderQuan INTO ord_quan;
    cur_id := ord_quan.ID_good;
    quan := ord_quan.Quantity;
  END LOOP;
  CLOSE OrderQuan;
  --DEALLOCATE OrderQuan;
  --DELETE FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted);
END trg_Order_delete_details;

CREATE OR REPLACE TRIGGER trg_Supply_delete_details
AFTER DELETE ON Supplies
FOR EACH ROW
DECLARE 
  cur_id INT; quan INT; 
  CURSOR SupplyQuan 
  IS 
  SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup IN (SELECT ID_sup FROM deleted);
  
  sup_quan SupplyQuan%ROWTYPE;
  
BEGIN
  OPEN SupplyQuan;
  FETCH SupplyQuan INTO sup_quan;
  cur_id := sup_quan.ID_good;
  quan := sup_quan.Quantity;
  WHILE SQL@@FETCH_STATUS = 0
  LOOP
    UPDATE Goods 
    SET Quantity = Quantity + quan WHERE Goods.ID_good = cur_id;
    FETCH SupplyQuan INTO sup_quan;
    cur_id := sup_quan.ID_good;
    quan := sup_quan.Quantity;
  END LOOP;
  CLOSE SupplyQuan;
  --DEALLOCATE SupplyQuan;
  --DELETE FROM SupplyDetails WHERE ID_sup IN (SELECT ID_sup FROM deleted);
END trg_Supply_delete_details;

CREATE OR REPLACE TRIGGER AdPer
   AFTER INSERT OR UPDATE
   ON Persons
   FOR EACH ROW   
BEGIN
   
   IF INSERTING
   THEN
   SELECT MAX(ID_person) INTO :NEW.ID_person FROM Persons;
   END IF;
   check_tit(:NEW.Title);
   check_fio(:NEW.FIO);
   check_fid(:NEW.ID_firm);
   check_tel(:NEW.Telephone);
   check_em(:NEW.e_mail);
   
END AdPer;

CREATE OR REPLACE TRIGGER AddOrder
   AFTER INSERT OR UPDATE
   ON Orders
   FOR EACH ROW
BEGIN
   
   --check_pid(:NEW.ID_cust);
   check_date(:NEW.Date_of_sh);
      
END AddOrder;

CREATE OR REPLACE TRIGGER AddSupply
   AFTER INSERT OR UPDATE
   ON Supplies
   FOR EACH ROW
BEGIN
   
   --check_pid(:NEW.ID_prov);
   check_date(:NEW.Date_of_arr);
      
END AddSupply;

CREATE OR REPLACE TRIGGER DelPer
   AFTER DELETE
   ON Persons
   FOR EACH ROW
DECLARE
   kol INT;
BEGIN
   SELECT COUNT(*) INTO kol FROM Persons;
   IF(kol = 0)
   THEN
   ROLLBACK;
   END IF;
END DelPer;

PROCEDURE check_fio(FIO IN NVARCHAR2)
IS
BEGIN
   IF(REGEXP_COUNT(FIO,'[0-9]') > 0)
   THEN
      RAISE_APPLICATION_ERROR(-20006, 'FIO can not include number.');
   END IF;
   IF(REGEXP_LIKE(FIO,'(.*?\s){1,2}(.*?)') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20007, 'FIO can not include this count of words.');
   END IF;
END check_fio;

PROCEDURE check_fid(FirID1 IN INTEGER)
IS
BEGIN
   IF (FirID1 NOT IN Firms.ID_firm)
   THEN
      RAISE_APPLICATION_ERROR(-20017, 'Firm with this id does not exist.');
   END IF;
END check_fid;

PROCEDURE check_em(e_mail IN NVARCHAR2)
IS
BEGIN
   IF (REGEXP_LIKE(e_mail,'^(([a-z A-Z 0-9]+)@(gmail.com|yandex.ru|mail.ru))$') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20009, 'Entered email is incorrect.');
   END IF;
END check_em;

PROCEDURE check_tel(Tel IN NVARCHAR2)
IS
BEGIN
   IF (REGEXP_LIKE(Tel,'\d{1}\(?\d{3}\)?[[:space]\.\-]?\d{3}[[:space]\.\-]?\d{2}[[:space]\.\-]?\d{2}') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20020, 'Entered telephone number is incorrect.');
   END IF;
END check_tel;

/*PROCEDURE check_pid(PerID1 IN INTEGER)
IS
BEGIN
   IF (PerID1 NOT IN Persons.ID_person)
   THEN
      RAISE_APPLICATION_ERROR(-20016, 'Person with this id does not exist.');
   END IF;
END check_pid;*/

PROCEDURE check_date(Date1 IN DATE)
IS
BEGIN
   IF (Date1 <= CAST(SYSTIME - 1 AS DATE))
   THEN
      RAISE_APPLICATION_ERROR(-20019, 'Procedures with goods that have time more than a day before, can not be deleted or inserted.');
   END IF;
END check_date;

PROCEDURE check_tit(Title IN NVARCHAR2)
IS
BEGIN
   IF(REGEXP_COUNT(Title,'([0-9]|1[0-4])') > 1)
   THEN
      RAISE_APPLICATION_ERROR(-20013, 'Title can not include more than one number.');
   END IF;
END check_tit;
