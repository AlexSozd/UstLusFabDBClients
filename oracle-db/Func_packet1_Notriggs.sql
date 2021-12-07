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
END check_fio;*/

/*CREATE OR REPLACE PROCEDURE check_fid(FirID1 IN INTEGER)
IS
BEGIN
   IF (FirID1 NOT IN Firms.ID_firm)
   THEN
      RAISE_APPLICATION_ERROR(-20017, 'Firm with this id does not exist.');
   END IF;
END check_fid;*/

/*CREATE OR REPLACE PROCEDURE check_em(e_mail IN NVARCHAR2)
IS
BEGIN
   IF (REGEXP_LIKE(e_mail,'^(([a-z A-Z 0-9]+)@(gmail.com|yandex.ru|mail.ru))$') = FALSE)
   THEN
      RAISE_APPLICATION_ERROR(-20009, 'Entered email is incorrect.');
   END IF;
END check_em;*/

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
END check_tit;
