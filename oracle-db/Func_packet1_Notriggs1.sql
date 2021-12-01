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

/*CREATE OR REPLACE PROCEDURE check_fid(FirID1 IN INTEGER)
IS
  kol INT;
BEGIN
   SELECT COUNT(*) INTO kol FROM Firms WHERE Firms.ID_firm = FirID1;
   IF (kol = 0)
   THEN
      RAISE_APPLICATION_ERROR(-20017, 'Firm with this id does not exist.');
   END IF;
END check_fid;*/
