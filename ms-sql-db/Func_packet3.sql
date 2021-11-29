use Kurs;
go
CREATE PROC InsertPerson
(
  @id_per AS INT,
  @name AS NVARCHAR(255),
  @adr AS NVARCHAR(255),
  @tel AS NVARCHAR(255),
  @e_m AS NVARCHAR(255)
)
AS
  BEGIN TRAN;
	 INSERT INTO Persons(ID_person, Name, Adres, Telephone, E_mail) VALUES
	 (@id_per, @name, @adr, @tel, @e_m);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC InsertGood
(
   @id_g AS INT,
   @name AS NVARCHAR(255),
   @quan AS INT
)
AS
  BEGIN TRAN
     INSERT INTO Goods(ID_good, Name, Quantity) VALUES
	 (@id_g, @name, @quan);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC InsertTypePerson
(
  @num AS INT,
  @id_per AS INT,
  @type AS NVARCHAR(255)
)
AS
  BEGIN TRAN
	 INSERT INTO Type_of_Person(Number, ID_person, Type_of_person) VALUES
	 (@num, @id_per, @type);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC InsertTypeGood
(
   @num AS INT,
   @id_g AS INT,
   @type AS NVARCHAR(255)
)
AS
  BEGIN
     INSERT INTO Type_of_Good(Number, ID_good, Type_of_good) VALUES
	 (@num, @id_g, @type);
	 END;
	 GO
CREATE FUNCTION dbo.Get_num_Person
(
  
)
RETURNS INT
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(ID_person)+1 FROM Persons);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_Good
(

)
RETURNS INT
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(ID_good)+1 FROM Goods);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_TypePerson
(
  
)
RETURNS int
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(Number)+1 FROM Type_of_Person);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_TypeGood
(
  
)
RETURNS int
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(Number)+1 FROM Type_of_Good);
  RETURN @i
  END;
  GO
CREATE PROC DeleteDefOrder
(
  @id AS INT
)
AS
  BEGIN TRAN;
	 DELETE FROM Orders WHERE ID_order=@id AND Date_of_sh>=CAST(GETDATE() AS DATE);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC DeleteDefSupply
(
  @id AS INT
)
AS
  BEGIN TRAN
     DELETE FROM Supplies WHERE ID_sup=@id AND Date_of_arr>=CAST(GETDATE() AS DATE);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC DeletePerson
(
  @id AS INT
)
AS
  BEGIN TRAN;
	 DELETE FROM Persons WHERE ID_person=@id;
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO
CREATE PROC DeleteGood
(
  @id AS INT
)
AS
  BEGIN TRAN;
	 DELETE FROM Goods WHERE ID_good=@id;
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO

CREATE PROC ShowSupplies
AS
  BEGIN
  SELECT * FROM Supplies;
  END;
  GO

CREATE PROC ShowOrders
AS
  BEGIN
  SELECT * FROM Orders;
  END;
  GO

CREATE TRIGGER trg_Order_delete_details ON dbo.Orders AFTER DELETE
AS
SET NOCOUNT ON;
DECLARE @cur_id AS INT, @quan AS INT
DECLARE OrderQuan CURSOR FOR SELECT ID_good,Quantity FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted) FOR READ ONLY;
OPEN OrderQuan;
FETCH NEXT FROM OrderQuan INTO @cur_id, @quan;
WHILE @@FETCH_STATUS=0
BEGIN
  UPDATE dbo.Goods 
  SET Quantity=Quantity+@quan WHERE Goods.ID_good=@cur_id;
  FETCH NEXT FROM OrderQuan INTO @cur_id, @quan;
END;
CLOSE OrderQuan;
DEALLOCATE OrderQuan;
--@quan=(SELECT Quantity FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted))
DELETE FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted);
go

CREATE TRIGGER trg_Supply_delete_details ON dbo.Supplies AFTER DELETE
AS
SET NOCOUNT ON;
DECLARE @cur_id AS INT, @quan AS INT
DECLARE SupplyQuan CURSOR FOR SELECT ID_good,Quantity FROM SupplyDetails WHERE ID_sup IN (SELECT ID_sup FROM deleted) FOR READ ONLY;
OPEN SupplyQuan;
FETCH NEXT FROM SupplyQuan INTO @cur_id, @quan;
WHILE @@FETCH_STATUS=0
BEGIN
  UPDATE dbo.Goods 
  SET Quantity=Quantity+@quan WHERE Goods.ID_good=@cur_id;
  FETCH NEXT FROM SupplyQuan INTO @cur_id, @quan;
END;
CLOSE SupplyQuan;
DEALLOCATE SupplyQuan;
DELETE FROM SupplyDetails WHERE ID_sup IN (SELECT ID_sup FROM deleted);
go

CREATE TRIGGER trg_Person_delete_type ON dbo.Persons AFTER DELETE
AS
SET NOCOUNT ON;
DELETE FROM Type_of_Person WHERE ID_person IN (SELECT ID_person FROM deleted);
go

CREATE TRIGGER trg_Good_delete_type ON dbo.Goods AFTER DELETE
AS
SET NOCOUNT ON;
DELETE FROM Type_of_Good WHERE ID_good IN (SELECT ID_good FROM deleted);
go