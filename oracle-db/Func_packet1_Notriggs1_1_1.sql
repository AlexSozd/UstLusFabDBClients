CREATE OR REPLACE PROCEDURE DeleteDefOrder
(id_ord IN INT)
IS
  cur_id INT; quan INT; dt DATE;
  CURSOR OrderQuan 
  IS
  SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order = id_ord;
  ord_quan OrderQuan%ROWTYPE;
BEGIN
  SELECT Date_of_sh INTO dt FROM Orders WHERE ID_order = (SELECT MAX(ID_order) FROM Orders);
  IF(dt >= (SYSDATE - 1))
  THEN
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
    DELETE FROM Orders WHERE ID_order = id_ord AND Date_of_sh >= (SYSDATE - 1);
  END IF;
END DeleteDefOrder;

/*CREATE OR REPLACE PROCEDURE DeleteDefSupply
(id_s IN INT)
IS
  cur_id INT; quan INT; dt DATE;
  CURSOR SupplyQuan 
  IS 
  SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup = id_s;
  sup_quan SupplyQuan%ROWTYPE;
BEGIN
  SELECT Date_of_arr INTO dt FROM Supplies WHERE ID_sup = (SELECT MAX(ID_sup) FROM Orders);
  IF(dt >= (SYSDATE - 1))
  THEN
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
    DELETE FROM Supplies WHERE ID_sup = id_s AND Date_of_arr >= (SYSDATE - 1);
  END IF;
END DeleteDefSupply;*/
