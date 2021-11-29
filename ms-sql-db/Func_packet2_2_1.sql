use Kurs;
SELECT Type_of_person, Name FROM Persons, Type_of_Person WHERE Persons.ID_person=Type_of_Person.ID_person AND Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies); 
--SELECT Type_of_person, Name FROM (SELECT Persons.ID_person, Persons.Name, Type_of_person FROM (Persons JOIN Type_of_Person on Persons.ID_person=Type_of_Person.ID_person) WHERE Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies));
go
CREATE PROC ShowListProv
AS
BEGIN
  SELECT Type_of_person, Name FROM Persons, Type_of_Person WHERE Persons.ID_person=Type_of_Person.ID_person AND Persons.ID_person IN (SELECT DISTINCT ID_prov FROM Supplies);
  END;
  GO