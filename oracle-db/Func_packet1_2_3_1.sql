/*CREATE OR REPLACE PROCEDURE DeletePerson
(id_per IN INT)
IS
  
BEGIN
  DELETE FROM Persons WHERE ID_person = id_per;
END DeletePerson;*/

/*CREATE OR REPLACE PROCEDURE DeleteFirm
(id_fir IN INT)
IS
  
BEGIN
  DELETE FROM Firms WHERE ID_firm = id_fir;
END DeleteFirm;*/

CREATE OR REPLACE PROCEDURE DeleteGood
(id_g IN INT)
IS
  
BEGIN
  DELETE FROM Goods WHERE ID_good = id_g;
END DeleteGood;

/*CREATE OR REPLACE FUNCTION ShowSupplies
RETURN Supplies%ROWTYPE
IS
  
BEGIN
  SELECT * FROM Supplies;
END ShowSupplies;

CREATE OR REPLACE FUNCTION ShowOrders
RETURN Orders%ROWTYPE
IS
  
BEGIN
  SELECT * FROM Orders;
END ShowOrders;

CREATE OR REPLACE FUNCTION ShowContacts
(id_fir IN INT)
RETURN Persons%ROWTYPE
IS
BEGIN
   SELECT * FROM Persons WHERE ID_firm = id_fir;
END ShowContacts;*/
