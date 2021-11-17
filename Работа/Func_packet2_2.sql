use Kurs;
go
CREATE PROC ChangeUnrefField
(
  @codetab AS INT,
  @codeatr AS INT,
  @num AS INT,
  @value AS VARCHAR(255)
)
AS
  BEGIN TRAN
  IF(@codetab=0) 
  BEGIN
    IF(@codeatr=0)
	BEGIN
	UPDATE dbo.Goods
	SET Name=@value WHERE Goods.ID_good=@num;
	END
	IF(@codeatr=1)
	BEGIN
	UPDATE dbo.Goods
	SET Quantity=(SELECT TRY_PARSE(@value AS int) WHERE Goods.ID_good=@num);
	END
  END
  IF(@codetab=1)
  BEGIN
	IF(@codeatr=0)
	BEGIN
	UPDATE dbo.Type_of_Good
	SET ID_good=(SELECT TRY_PARSE(@value AS int) WHERE Type_of_Good.Number=@num);
	END
	IF(@codeatr=1)
	BEGIN
	UPDATE dbo.Type_of_Good
	SET Type_of_good=@value WHERE Type_of_Good.Number=@num;
	END
  END
  IF(@codetab=2)
  BEGIN
    --UPDATE dbo.Persons
	IF(@codeatr=0)
	BEGIN
	UPDATE dbo.Persons
	SET Name=@value WHERE Persons.ID_person=@num;
	END
	IF(@codeatr=1)
	BEGIN
	UPDATE dbo.Persons
	SET Adres=@value WHERE Persons.ID_person=@num;
	END
	IF(@codeatr=2)
	BEGIN
	UPDATE dbo.Persons
	SET Telephone=@value WHERE Persons.ID_person=@num;
	END
	IF(@codeatr=3)
	BEGIN
	UPDATE dbo.Persons
	SET E_mail=@value WHERE Persons.ID_person=@num;
	END
  END
  IF(@codetab=3)
  BEGIN
    --UPDATE dbo.Type_of_Person
	IF(@codeatr=0)
	UPDATE dbo.Type_of_Person
	SET ID_person=CAST(@value AS int) WHERE Type_of_Person.Number=@num;
	IF(@codeatr=1)
	UPDATE dbo.Type_of_Person
	SET Type_of_person=@value WHERE Type_of_Person.Number=@num;
  END
  IF(@codetab=4)
  BEGIN
    --UPDATE dbo.Orders
	IF(@codeatr=0)
	UPDATE dbo.Orders
	SET ID_cust=CAST(@value AS int) WHERE Orders.ID_order=@num;
	IF(@codeatr=1)
	UPDATE dbo.Orders
	SET Price=CAST(@value AS real) WHERE Orders.ID_order=@num;
	IF(@codeatr=2)
	UPDATE dbo.Orders
	SET Price_of_del=CAST(@value AS real) WHERE Orders.ID_order=@num;
	IF(@codeatr=3)
	UPDATE dbo.Orders
	SET Date_of_sh=CAST(@value AS DATE) WHERE Orders.ID_order=@num;
  END
  IF(@codetab=5)
  BEGIN
    --UPDATE dbo.OrderDetails
	IF(@codeatr=0)
	UPDATE dbo.OrderDetails
	SET ID_order=CAST(@value AS int) WHERE OrderDetails.Number=@num;
	IF(@codeatr=1)
	UPDATE dbo.OrderDetails
	SET ID_good=CAST(@value AS int) WHERE OrderDetails.Number=@num;
	IF(@codeatr=2)
	UPDATE dbo.OrderDetails
	SET Quantity=CAST(@value AS int) WHERE OrderDetails.Number=@num;
	IF(@codeatr=3)
	UPDATE dbo.OrderDetails
	SET Unit=@value WHERE OrderDetails.Number=@num;
  END
  IF(@codetab=6)
  BEGIN
    --UPDATE dbo.Supplies
	IF(@codeatr=0)
	UPDATE dbo.Supplies
	SET ID_prov=CAST(@value AS int) WHERE Supplies.ID_sup=@num;
	IF(@codeatr=1)
	UPDATE dbo.Supplies
	SET Cost=CAST(@value AS real) WHERE Supplies.ID_sup=@num;
	IF(@codeatr=2)
	UPDATE dbo.Supplies
	SET Cost_of_sup=CAST(@value AS real) WHERE Supplies.ID_sup=@num;
	IF(@codeatr=3)
	UPDATE dbo.Supplies
	SET Date_of_arr=CAST(@value AS DATE) WHERE Supplies.ID_sup=@num;
  END
  IF(@codetab=7)
  BEGIN
    --UPDATE dbo.SupplyDetails
	IF(@codeatr=0)
	BEGIN
	UPDATE dbo.SupplyDetails
	SET ID_sup=CAST(@value AS int) WHERE SupplyDetails.Number=@num;
	END
	IF(@codeatr=1)
	BEGIN
	UPDATE dbo.SupplyDetails
	SET ID_good=CAST(@value AS int) WHERE SupplyDetails.Number=@num;
	END
	IF(@codeatr=2)
	BEGIN
	UPDATE dbo.SupplyDetails
	SET Quantity=CAST(@value AS int) WHERE SupplyDetails.Number=@num;
	END
	IF(@codeatr=3)
	BEGIN
	UPDATE dbo.SupplyDetails
	SET Unit=@value WHERE SupplyDetails.Number=@num;
	END
	IF(@codeatr=4)
	BEGIN
	UPDATE dbo.SupplyDetails
	SET Quan_kept=CAST(@value AS int) WHERE SupplyDetails.Number=@num;
	END
  END
  IF(@@ERROR=0) COMMIT TRAN
  ELSE
  ROLLBACK TRAN
  GO
CREATE PROC ChangeRefField
(
  @num AS INT,
  @code AS INT,
  @value AS INT
)
AS
  BEGIN
  DECLARE @old_val AS INT
  IF(@code=0)
  BEGIN
  DECLARE @id AS INT
  SET @old_val=(SELECT Quantity FROM OrderDetails WHERE OrderDetails.Number=@num);
  SET @id=(SELECT ID_good FROM OrderDetails WHERE OrderDetails.Number=@num);
  UPDATE dbo.OrderDetails
  SET Quantity=@value WHERE OrderDetails.Number=@num;
  UPDATE dbo.Goods
  SET Quantity=Quantity+@old_val-@value WHERE Goods.ID_good=@id;
  END
  IF(@code=1)
  BEGIN
  DECLARE @quan AS INT
  SET @old_val=(SELECT ID_good FROM OrderDetails WHERE OrderDetails.Number=@num);
  SET @quan=(SELECT Quantity FROM OrderDetails WHERE OrderDetails.Number=@num);
  UPDATE dbo.OrderDetails
  SET ID_good=@value WHERE OrderDetails.Number=@num;
  UPDATE dbo.Goods
  SET Quantity=Quantity-@quan WHERE Goods.ID_good=@value;
  UPDATE dbo.Goods
  SET Quantity=Quantity+@quan WHERE Goods.ID_good=@old_val;
  END
  IF(@code=2)
  BEGIN
  --DECLARE @id AS INT
  SET @old_val=(SELECT Quantity FROM SupplyDetails WHERE SupplyDetails.Number=@num);
  SET @id=(SELECT Quantity FROM SupplyDetails WHERE SupplyDetails.Number=@num);
  UPDATE dbo.SupplyDetails
  SET Quantity=@value WHERE SupplyDetails.Number=@num;
  UPDATE dbo.Goods
  SET Quantity=Quantity-@old_val+@value WHERE Goods.ID_good=@id;
  END
  IF(@code=3)
  BEGIN
  --DECLARE @old_val AS INT, @quan AS INT
  SET @old_val=(SELECT ID_good FROM SupplyDetails WHERE SupplyDetails.Number=@num);
  SET @quan=(SELECT Quantity FROM SupplyDetails WHERE SupplyDetails.Number=@num);
  UPDATE dbo.SupplyDetails
  SET ID_good=@value WHERE SupplyDetails.Number=@num;
  UPDATE dbo.Goods
  SET Quantity=Quantity+@quan WHERE Goods.ID_good=@value;
  UPDATE dbo.Goods
  SET Quantity=Quantity-@quan WHERE Goods.ID_good=@old_val;
  END
  END
  GO