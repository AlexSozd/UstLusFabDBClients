use Kurs;
go
CREATE FUNCTION dbo.Get_num_Order
(
  
)
RETURNS INT
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(ID_order)+1 FROM Orders);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_Supply
(
   --@i AS INT
)
RETURNS INT
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(ID_sup)+1 FROM Supplies);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_OrderDetail
(
  
)
RETURNS int
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(Number)+1 FROM OrderDetails);
  RETURN @i
  END;
  GO
CREATE FUNCTION dbo.Get_num_SupplyDetail
(
  
)
RETURNS int
AS
  BEGIN
  DECLARE @i AS INT
  SET @i = (SELECT MAX(Number)+1 FROM SupplyDetails);
  RETURN @i
  END;
  GO
CREATE PROC DeleteSupply
AS
  BEGIN TRAN
     DELETE FROM Supplies WHERE ID_sup=(SELECT MAX(ID_sup) FROM Supplies);
	 IF(@@ERROR=0) COMMIT TRAN;
	 ELSE
	 ROLLBACK TRAN;
	 GO

CREATE PROC ShowProv
AS
  BEGIN
  --SELECT Name FROM Persons WHERE ID_person=Supplies.ID_prov;
  SELECT Persons.ID_person, Type_of_person, Name, Adres, Telephone, E_mail FROM (Persons JOIN Type_of_person on Persons.ID_person=Type_of_person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies);
  END;
  GO
CREATE PROC ShowClients
AS
  BEGIN
  --SELECT Name FROM Persons WHERE ID_person=Orders.ID_cust;
  SELECT Persons.ID_person, Type_of_person, Name, Adres, Telephone, E_mail FROM (Persons JOIN Type_of_person on Persons.ID_person=Type_of_person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_cust FROM Orders);
  END;
  GO
CREATE PROC ShowSupplyForSTime
(
  @date1 AS DATE,
  @date2 AS DATE
)
AS
  BEGIN
  SELECT * FROM Supplies WHERE ((Date_of_arr>=@date1) AND (Date_of_arr<=@date2));
  END;
  GO
CREATE PROC ShowListClients
AS
  BEGIN
  --SELECT Name FROM Persons WHERE ID_person=Orders.ID_cust;
  SELECT Type_of_person, Name FROM (Persons JOIN Type_of_Person on Persons.ID_person=Type_of_Person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_cust FROM Orders);
  END;
  GO
CREATE PROC ShowListProv
AS
  BEGIN
  --SELECT Name FROM Persons WHERE ID_person=Supplies.ID_prov;
  SELECT Type_of_person, Name FROM (Persons JOIN Type_of_Person on Persons.ID_person=Type_of_Person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies);
  END;
  GO