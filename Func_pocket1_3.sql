CREATE OR REPLACE FUNCTION Get_num_Firm
RETURN INT
IS
  ido INT;
BEGIN
  SELECT MAX(ID_firm)+1 INTO ido FROM Firms;
  RETURN ido;
END Get_num_Firm;