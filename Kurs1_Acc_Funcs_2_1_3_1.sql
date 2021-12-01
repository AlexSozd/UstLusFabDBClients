/*CREATE OR REPLACE FUNCTION QtLogin1(str1 IN VARCHAR2, str2 IN VARCHAR2) RETURN VARCHAR2
IS
  kol INT;
  log1 VARCHAR2(1);
BEGIN
  SELECT COUNT(*) INTO kol FROM InsideAccess WHERE Login = str1 AND Parole = str2;
  IF kol = 1
  THEN
    log1 := 1;
  ELSE
    log1 := 0;
  END IF;
  RETURN log1;
END QtLogin1;*/

CREATE OR REPLACE PROCEDURE Login_Python_1
(
  str1 IN VARCHAR2, 
  str2 IN VARCHAR2,
  kol OUT INT
)
IS
BEGIN
  SELECT COUNT(*) INTO kol FROM InsideAccess WHERE Login = str1 AND Parole = str2;
END Login_Python_1;

/*CREATE OR REPLACE PROCEDURE CatsList(str1 IN VARCHAR2, str2 IN VARCHAR2)
IS
BEGIN
  
END;*/