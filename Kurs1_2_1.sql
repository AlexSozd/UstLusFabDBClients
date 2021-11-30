CREATE TABLE Goods
(
   ID_good INT PRIMARY KEY,
   Appel NVARCHAR2(255) NOT NULL,
   Quantity INT NOT NULL
   CHECK(Quantity >= 0)
);
CREATE TABLE Type_of_Good
(
   ID_type INT PRIMARY KEY,
   ID_good INT NOT NULL, 
   FOREIGN KEY (ID_good) 
   REFERENCES Goods(ID_good) 
   ON DELETE CASCADE,
   Type_of_good NVARCHAR2(255) NOT NULL
);
CREATE TABLE Firms
(
   ID_firm INT PRIMARY KEY,
   Appel NVARCHAR2(255) NOT NULL,
   Type_of_firm NVARCHAR2(255) NOT NULL
);
CREATE TABLE Persons
(
   ID_person INT PRIMARY KEY,
   Title NVARCHAR2(255) NOT NULL,
   FIO NVARCHAR2(255) NOT NULL,
   ID_firm INT NOT NULL,
   FOREIGN KEY (ID_firm) 
   REFERENCES Firms(ID_firm)
   ON DELETE CASCADE,
   Adres NVARCHAR2(255) NOT NULL,
   Telephone NVARCHAR2(255) NOT NULL,
   E_mail NVARCHAR2(255) NULL 
);
CREATE TABLE Orders
(
   ID_order INT PRIMARY KEY,
   ID_cust INT NOT NULL,
   FOREIGN KEY (ID_cust) 
   REFERENCES Firms(ID_firm)
   ON DELETE CASCADE,
   Price NUMBER NOT NULL,
   Price_of_del NUMBER NULL,
   Date_of_sh DATE NULL
   CHECK((Price >= 0)AND(Price_of_del >= 0))
);
CREATE TABLE OrderDetails
(
   ID_ordet INT PRIMARY KEY,
   ID_order INT NOT NULL,
   FOREIGN KEY (ID_order)
   REFERENCES Orders(ID_order)
   ON DELETE CASCADE,
   ID_good INT NOT NULL,
   FOREIGN KEY (ID_good)
   REFERENCES Goods(ID_good)
   ON DELETE CASCADE,
   Quantity INT NOT NULL,
   Unit NVARCHAR2(255) NOT NULL
   CHECK(Quantity >= 0)
);
CREATE TABLE Supplies
(
   ID_sup INT PRIMARY KEY,
   ID_prov INT NOT NULL,
   FOREIGN KEY (ID_prov)
   REFERENCES Firms(ID_firm)
   ON DELETE CASCADE,
   Costs NUMBER NOT NULL,
   Cost_of_sup NUMBER NULL,
   Date_of_arr DATE NULL
   CHECK((Costs >= 0)AND(Cost_of_sup >= 0))
);
CREATE TABLE SupplyDetails
(
   ID_sudet INT PRIMARY KEY,
   ID_sup INT NOT NULL,
   FOREIGN KEY (ID_sup)
   REFERENCES Supplies(ID_sup)
   ON DELETE CASCADE,
   ID_good INT NOT NULL,
   FOREIGN KEY (ID_good)
   REFERENCES Goods(ID_good)
   ON DELETE CASCADE,
   Quantity INT NOT NULL,
   Unit NVARCHAR2(255) NOT NULL,
   Quan_kept INT NOT NULL
   CHECK((Quantity >= 0)AND(Quan_kept >= 0))
);