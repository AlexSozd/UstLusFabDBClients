CREATE OR REPLACE TRIGGER trg_Order_delete_details 
AFTER DELETE ON Orders
FOR EACH ROW
DECLARE 
  cur_id INT; quan INT;
  CURSOR OrderQuan 
  IS
  SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order = :OLD.ID_order;
  ord_quan OrderQuan%ROWTYPE;
BEGIN
  OPEN OrderQuan;
    FETCH OrderQuan INTO ord_quan;
    cur_id := ord_quan.ID_good;
    quan := ord_quan.Quantity;
    WHILE OrderQuan%FOUND
    LOOP
      UPDATE Goods 
        SET Quantity = Quantity + quan WHERE Goods.ID_good = cur_id;
      FETCH OrderQuan INTO ord_quan;
      cur_id := ord_quan.ID_good;
      quan := ord_quan.Quantity;
    END LOOP;
  CLOSE OrderQuan;
END trg_Order_delete_details;

CREATE OR REPLACE TRIGGER trg_Supply_delete_details
AFTER DELETE ON Supplies
FOR EACH ROW
DECLARE 
  cur_id INT; quan INT;
  CURSOR SupplyQuan 
  IS 
  SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup = :OLD.ID_sup;
  sup_quan SupplyQuan%ROWTYPE;
BEGIN
  OPEN SupplyQuan;
    FETCH SupplyQuan INTO sup_quan;
    cur_id := sup_quan.ID_good;
    quan := sup_quan.Quantity;
    WHILE SupplyQuan%FOUND
    LOOP
      UPDATE Goods 
        SET Quantity = Quantity + quan WHERE Goods.ID_good = cur_id;
      FETCH SupplyQuan INTO sup_quan;
      cur_id := sup_quan.ID_good;
      quan := sup_quan.Quantity;
    END LOOP;
  CLOSE SupplyQuan;
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
  check_date(:NEW.Date_of_sh);   
END AddOrder;

CREATE OR REPLACE TRIGGER AddSupply
AFTER INSERT OR UPDATE
ON Supplies
FOR EACH ROW
BEGIN
  check_date(:NEW.Date_of_arr);   
END AddSupply;