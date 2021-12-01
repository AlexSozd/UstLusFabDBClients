CREATE OR REPLACE TYPE Goods1 AS OBJECT
(
   ID_good INT,
   Appel NVARCHAR2(255),
   Quantity INT
);
CREATE OR REPLACE TYPE Goods_t IS TABLE OF Goods1;

CREATE OR REPLACE TYPE Orders1 AS OBJECT
(
   ID_order INT,
   ID_cust INT,
   Price NUMBER,
   Price_of_del NUMBER,
   Date_of_sh DATE
);
CREATE OR REPLACE TYPE Order_t IS TABLE OF Orders1;

CREATE OR REPLACE TYPE Supply AS OBJECT
(
   ID_sup INT,
   ID_prov INT,
   Costs NUMBER,
   Cost_of_sup NUMBER,
   Date_of_arr DATE
);
CREATE OR REPLACE TYPE Supply_t IS TABLE OF Supply;

CREATE OR REPLACE TYPE Person AS OBJECT
(
   ID_person INT,
   Title NVARCHAR2(255),
   FIO NVARCHAR2(255),
   ID_firm INT,
   Adres NVARCHAR2(255),
   Telephone NVARCHAR2(255),
   E_mail NVARCHAR2(255) 
);
CREATE OR REPLACE TYPE Contacts_t IS TABLE OF Person;
