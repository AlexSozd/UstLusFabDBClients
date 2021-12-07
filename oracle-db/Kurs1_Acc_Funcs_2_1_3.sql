CREATE OR REPLACE PROCEDURE FindLogin_2
(
  str IN VARCHAR2,
  kol OUT INT
)
IS
BEGIN
  SELECT COUNT(*) INTO kol FROM OutsideAccess WHERE Login = str;
END FindLogin_2;

CREATE OR REPLACE PROCEDURE FindLoginAndPassword_2
(
  str1 IN VARCHAR2, 
  str2 IN VARCHAR2,
  kol OUT INT
)
IS
BEGIN
  SELECT COUNT(*) INTO kol FROM OutsideAccess WHERE Login = str1 AND Parole = str2;
END FindLoginAndPassword_2;
