CREATE OR REPLACE PROCEDURE FindLogin_1
(
  str IN VARCHAR2,
  log1 OUT VARCHAR2
)
IS
  kol INT;
BEGIN
  SELECT COUNT(*) INTO kol FROM OutsideAccess WHERE Login = str;
  IF kol = 1
  THEN
    log1 := '1';
  ELSE
    log1 := '0';
  END IF;
END FindLogin_1;

CREATE OR REPLACE PROCEDURE FindLoginAndPassword_1
(
  str1 IN VARCHAR2, 
  str2 IN VARCHAR2,
  log1 OUT VARCHAR2
)
IS
  kol INT;
BEGIN
  SELECT COUNT(*) INTO kol FROM OutsideAccess WHERE Login = str1 AND Parole = str2;
  IF kol = 1
  THEN
    log1 := '1';
  ELSE
    log1 := '0';
  END IF;
END FindLoginAndPassword_1;

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
END QtLogin1;

CREATE OR REPLACE FUNCTION Login_Python1(str1 IN VARCHAR2, str2 IN VARCHAR2) RETURN VARCHAR2
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
END Login_Python1;*/

/*CREATE OR REPLACE PROCEDURE CatsList(str1 IN VARCHAR2, str2 IN VARCHAR2)
IS
BEGIN
  
END;*/
