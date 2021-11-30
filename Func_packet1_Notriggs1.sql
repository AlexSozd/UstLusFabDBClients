/*CREATE OR REPLACE PROCEDURE InsertOrder
(id_ord1 IN INT, id_cust1 IN INT, pr1 IN NUMBER, pr_del1 IN NUMBER, date_of_sh1 IN DATE)
IS
BEGIN
	 check_date(date_of_sh1);
   INSERT INTO Orders(ID_order, ID_cust, Price, Price_of_del, Date_of_sh) VALUES
	 (id_ord1, id_cust1, pr1, pr_del1, date_of_sh1);
END InsertOrder;

CREATE OR REPLACE PROCEDURE InsertSupply
(id_sup1 IN INT, id_prov1 IN INT, c1 IN NUMBER, c_sup1 IN NUMBER, date_of_arr1 IN DATE)
IS
BEGIN
   check_date(date_of_arr1);
   INSERT INTO Supplies(ID_sup, ID_prov, Costs, Cost_of_sup, Date_of_arr) VALUES
	 (id_sup1, id_prov1, c1, c_sup1, date_of_arr1);
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
	 (id_sudet1, id_sup1, id_g, quan1, un1, quan_kpt);
	 UPDATE Goods 
     SET Quantity = Quantity + quan1 WHERE Goods.ID_good = id_g;
END InsertSupplyDetail;*/

/*CREATE OR REPLACE PROCEDURE DeleteLastOrder
IS
  cur_id INT; quan INT;
  CURSOR OrderQuan 
  IS
  SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order = (SELECT MAX(ID_order) FROM Orders);
  ord_quan OrderQuan%ROWTYPE;
BEGIN
	 DELETE FROM Orders WHERE ID_order = (SELECT MAX(ID_order) FROM Orders);
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
END DeleteLastOrder;

CREATE OR REPLACE PROCEDURE DeleteLastSupply
IS
  cur_id INT; quan INT; 
  CURSOR SupplyQuan 
  IS 
  SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup = (SELECT MAX(ID_sup) FROM Supplies);
  sup_quan SupplyQuan%ROWTYPE;
BEGIN
  DELETE FROM Supplies WHERE ID_sup = (SELECT MAX(ID_sup) FROM Supplies);
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
END DeleteLastSupply;*/

CREATE OR REPLACE PROCEDURE InsertPerson
(id_per1 IN INT, tit1 IN NVARCHAR2, fio1 IN NVARCHAR2, id_fir1 IN INT, adr1 IN NVARCHAR2, tel1 IN NVARCHAR2, e_m1 IN NVARCHAR2)
IS
BEGIN
	 --SELECT MAX(ID_person)+1 INTO id_per1 FROM Persons;
   check_tit(tit1);
   check_fio(fio1);
   check_fid(id_fir1);
   check_tel(tel1);
   check_em(e_m1);
   INSERT INTO Persons(ID_person, Title, FIO, ID_firm, Adres, Telephone, E_mail) VALUES
	 (id_per1, tit1, fio1, id_fir1, adr1, tel1, e_m1);
END InsertPerson;

/*CREATE OR REPLACE PROCEDURE InsertFirm
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
END InsertTypeGood;*/

/*CREATE OR REPLACE PROCEDURE DeleteDefOrder
(id_ord IN INT)
IS
  cur_id INT; quan INT;
  CURSOR OrderQuan 
  IS
  SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order = id_ord;
  ord_quan OrderQuan%ROWTYPE;
BEGIN
  DELETE FROM Orders WHERE ID_order = id_ord AND Date_of_sh >= (SYSDATE - 1);
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
END DeleteDefOrder;

CREATE OR REPLACE PROCEDURE DeleteDefSupply
(id_s IN INT)
IS
  cur_id INT; quan INT; 
  CURSOR SupplyQuan 
  IS 
  SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup = id_s;
  sup_quan SupplyQuan%ROWTYPE;
BEGIN
  DELETE FROM Supplies WHERE ID_sup = id_s AND Date_of_arr >= (SYSDATE - 1);
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
END DeleteDefSupply;*/

/*CREATE OR REPLACE PROCEDURE check_fio(FIO IN NVARCHAR2)
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

CREATE OR REPLACE PROCEDURE check_fid(FirID1 IN INTEGER)
IS
  kol INT;
BEGIN
   SELECT COUNT(*) INTO kol FROM Firms WHERE Firms.ID_firm = FirID1;
   IF (kol = 0)
   THEN
      RAISE_APPLICATION_ERROR(-20017, 'Firm with this id does not exist.');
   END IF;
END check_fid;

CREATE OR REPLACE PROCEDURE check_em(e_mail IN NVARCHAR2)
IS
BEGIN
   IF (REGEXP_LIKE(e_mail,'^(([a-z A-Z 0-9]+)@(gmail.com|yandex.ru|mail.ru))$') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20009, 'Entered email is incorrect.');
   END IF;
END check_em;

CREATE OR REPLACE PROCEDURE check_tel(Tel IN NVARCHAR2)
IS
BEGIN
   IF (REGEXP_LIKE(Tel,'\d{1}\(?\d{3}\)?[[:space]\.\-]?\d{3}[[:space]\.\-]?\d{2}[[:space]\.\-]?\d{2}') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20020, 'Entered telephone number is incorrect.');
   END IF;
END check_tel;

CREATE OR REPLACE PROCEDURE check_date(Date1 IN DATE)
IS
BEGIN
   IF (Date1 <= (SYSDATE - 1))
   THEN
      RAISE_APPLICATION_ERROR(-20019, 'Procedures with goods that have time more than a day before, can not be deleted or inserted.');
   END IF;
END check_date;

CREATE OR REPLACE PROCEDURE check_tit(Title IN NVARCHAR2)
IS
BEGIN
   IF(REGEXP_COUNT(Title,'([0-9]|1[0-4])') > 1)
   THEN
      RAISE_APPLICATION_ERROR(-20013, 'Title can not include more than one number.');
   END IF;
END check_tit;*/