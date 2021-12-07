CREATE OR REPLACE PROCEDURE UpdatePassword(log1 IN VARCHAR2, par1 IN VARCHAR2)
IS 
BEGIN
  UPDATE OutsideAccess
    SET Parole=par1 WHERE Login=log1;
END UpdatePassword;
