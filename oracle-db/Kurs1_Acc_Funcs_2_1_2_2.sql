CREATE OR REPLACE PROCEDURE FindID_1
(
  str IN VARCHAR2,
  id1 OUT INT
)
IS
BEGIN
  FOR l_row IN (SELECT Persons.ID_firm AS ID_firm FROM (OutsideAccess JOIN Persons ON OutsideAccess.id_user = Persons.ID_person) WHERE Login = str)
  LOOP
    id1 := l_row.ID_firm;
  END LOOP;
END FindID_1;
