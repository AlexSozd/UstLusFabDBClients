use Kurs;
go
CREATE PROC dbo.Get_num_Order1
AS
  BEGIN
  SELECT MAX(ID_order)+1 FROM Orders;
  END;
  GO
CREATE PROC dbo.Get_num_Supply1
AS
  BEGIN
  SELECT MAX(ID_sup)+1 FROM Supplies;
  END;
  GO
CREATE PROC dbo.Get_num_OrderDetail1
AS
  BEGIN
  SELECT MAX(Number)+1 FROM OrderDetails;
  END;
  GO
CREATE PROC dbo.Get_num_SupplyDetail1
AS
  BEGIN
  SELECT MAX(Number)+1 FROM SupplyDetails;
  END;
  GO
CREATE PROC dbo.Get_num_Person1
AS
  BEGIN
  SELECT MAX(ID_person)+1 FROM Persons;
  END;
  GO
CREATE PROC dbo.Get_num_Good1
AS
  BEGIN
  SELECT MAX(ID_good)+1 FROM Goods;
  END;
  GO
CREATE PROC dbo.Get_num_TypePerson1
AS
  BEGIN
  SELECT MAX(Number)+1 FROM Type_of_Person;
  END;
  GO
CREATE PROC dbo.Get_num_TypeGood1
AS
  BEGIN
  SELECT MAX(Number)+1 FROM Type_of_Good;
  END;
  GO