CREATE OR REPLACE PROCEDURE CatsList
(
  str1 IN VARCHAR2,
  str2 IN VARCHAR2,
  cat1_1 OUT VARCHAR2,
  cat2_1 OUT VARCHAR2,
  cat3_1 OUT VARCHAR2,
  cat4_1 OUT VARCHAR2,
  cat5_1 OUT VARCHAR2
)
IS
BEGIN
  FOR l_row IN (SELECT Cat1, Cat2, Cat3, Cat4, Cat5 FROM InsideAccess WHERE Login = str1 AND Parole = str2)
  LOOP
    cat1_1 := l_row.Cat1;
    cat2_1 := l_row.Cat2;
    cat3_1 := l_row.Cat3;
    cat4_1 := l_row.Cat4;
    cat5_1 := l_row.Cat5;
  END LOOP;
END;
