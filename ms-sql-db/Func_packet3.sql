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
	 DELETE FROM Orders WHERE ID_order=@id;
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
     DELETE FROM Supplies WHERE ID_sup=@id;
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
CREATE TRIGGER trg_Order_delete_details ON dbo.Orders AFTER DELETE
AS
DECLARE @quan AS INT
@quan=(SELECT Quantity FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted))
DELETE FROM OrderDetails WHERE ID_order IN (SELECT ID_order FROM deleted);
UPDATE dbo.Goods 
SET Quantity=Quantity+@quan WHERE Goods.ID_good=OrderDetails.ID_good;
go



CREATE TRIGGER trg_SupplyDetails_insert_quantity ON dbo.SupplyDetails AFTER INSERT
AS
SET NOCOUNT ON;
UPDATE dbo.Goods 
SET Quantity=Quantity+@quan WHERE Goods.ID_good=SupplyDetails.ID_good;*/
go