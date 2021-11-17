use Kurs;
go
CREATE PROC InsertOrder
(
  @id_ord AS INT,
  @id_cust AS INT,
  @pr AS MONEY,
  @pr_del AS MONEY,
  @data_of_sh AS DATE
)
AS
  BEGIN TRAN;
	 INSERT INTO Orders(ID_order, ID_cust, Price, Price_of_del, Date_of_sh) VALUES
	 (@id_ord, @id_cust, @pr, @pr_del, @data_of_sh);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 --END;
	 GO
CREATE PROC InsertSupply
(
   @id_sup AS INT,
   @id_prov AS INT,
   @c AS MONEY,
   @c_sup AS MONEY,
   @data_of_arr AS DATE
)
AS
  BEGIN TRAN
     INSERT INTO Supplies(ID_sup, ID_prov, Cost, Cost_of_sup, Date_of_arr) VALUES
	 (@id_sup, @id_prov, @c, @c_sup, @data_of_arr);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 --END;
	 GO
CREATE PROC InsertOrderDetail
(
  @num AS INT,
  @id_ord AS INT,
  @id_g AS INT,
  @quan AS INT,
  @un AS NVARCHAR(255)
)
AS
  BEGIN TRAN
	 INSERT INTO OrderDetails(Number, ID_order, ID_good, Quantity, Unit) VALUES
	 (@num, @id_ord, @id_g, @quan, @un);
	 UPDATE dbo.Goods 
     SET Quantity=Quantity-@quan WHERE Goods.ID_good=@id_g;
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 --END;
	 GO
CREATE PROC InsertSupplyDetail
(
   @num AS INT,
   @id_sup AS INT,
   @id_g AS INT,
   @quan AS INT,
   @un AS NVARCHAR(255),
   @quan_kpt AS INT
)
AS
  BEGIN
     INSERT INTO SupplyDetails(Number, ID_sup, ID_good, Quantity, Unit, Quan_kept) VALUES
	 (@num, @id_sup, @id_g, @quan, @un, @quan_kpt);
	 UPDATE dbo.Goods 
     SET Quantity=Quantity+@quan WHERE Goods.ID_good=@id_g;
	 END;
	 GO
CREATE PROC DeleteOrder
AS
  BEGIN TRAN;
     --COMMIT
	 DELETE FROM Orders WHERE ID_order=(SELECT MAX(ID_order) FROM Orders);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 --END;
	 GO
CREATE PROC ShowGoods
AS
  BEGIN
  SELECT * FROM Goods;
  END;
  GO
CREATE PROC ShowOrderForSTime
(
  @date1 AS DATE,
  @date2 AS DATE
)
AS
  BEGIN
  SELECT * FROM Orders WHERE ((Date_of_sh>=@date1) AND (Date_of_sh<=@date2));
  END;
  GO
CREATE PROC ShowListGood
AS
  BEGIN
  SELECT ID_good, Name FROM Goods;
  END;
  GO