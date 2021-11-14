import sys
import math
import pyodbc
def main():
    key=7
    while  key != 6:

       print("Наберите номер выполняемой операции: ")
       print("1 – добавление заказа, 2 – добавление поставки")
       print("3 – добавить клиента/поставщика, 4 – добавить товар")
       print("5 – просмотр базы данных, 6 – выход")
       print("7 – другое")
       key = int(input("Введите здесь:  "))
       if  key == 1:
          Insert_Order()

       if  key == 2:
          Insert_Supply()

       if  key == 3:
          Insert_Person()

       if  key == 4:
          Insert_Good()

       if  key == 5:
          View_dataBase()

       if  key == 7:
          SpecialFunctions()

    #print("Нажмите любую клавишу для закрытия")
    #raw_input()

def  Insert_Order():

    id_cust=int(input("Введите код заказчика \n"))
    pr=input("Введите стоимость заказа \n")
    pr_del=input("Введите стоимость доставки \n")
    data_of_sh=input("Введите дату отправки (мм-дд-гггг) \n")
    attempt = 0
    while attempt < 3:

        key = int(input("Введите код подтверждения \n"))
        if key == 6242:

            print("Код принят")
            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            row = cur.execute("exec dbo.Get_num_Order1").fetchone()
            id_ord = int(row[0])
            #print("id_ord=", id_ord)
            cur.execute("exec dbo.InsertOrder @id_ord = ?,@id_cust = ?,@pr = ?,@pr_del = ?,@data_of_sh = ?", id_ord, id_cust, pr, pr_del, data_of_sh)
            cur.commit()
            count_good = int(input("Введите число типов товара \n"))
            i = 0
            while i < count_good:

                row = cur.execute("exec dbo.Get_num_OrderDetail1").fetchone()
                num_det = int(row[0])
                #print("num_det=", num_det)
                id_g = int(input("Введите код товара \n"))
                quan = int(input("Введите общее количество товара \n"))
                un = input("Укажите единицу счёта товара \n")
                cur.execute("exec dbo.InsertOrderDetail @num = ?,@id_ord = ?,@id_g = ?,@quan = ?,@un = ?", num_det, id_ord, id_g, quan, un)
                cur.commit()
                #cur.execute("exec dbo.ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
                i = i + 1

            cur.close()
            con.close()
            break


def  Insert_Supply():

    id_prov=int(input("Введите код поставщика \n"))
    c=input("Введите стоимость поставки \n")
    c_sup=input("Введите стоимость доставки\n")
    data_of_arr=input("Введите дату получения (мм-дд-гггг) \n")
    attempt = 0
    while attempt < 3:

        key = int(input("Введите код подтверждения \n"))
        if key == 6242:

            print("Код принят")
            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            row = cur.execute("exec dbo.Get_num_Supply1").fetchone()
            id_sup = int(row[0])
            #print("id_sup=", id_sup)
            cur.execute("exec dbo.InsertSupply @id_sup = ?,@id_prov = ?,@c = ?,@c_sup = ?,@data_of_arr = ?", id_sup, id_prov, c, c_sup, data_of_arr)
            cur.commit()
            count_good = int(input("Введите число типов товара \n"))
            i = 0
            while i < count_good:

                row = cur.execute("exec dbo.Get_num_SupplyDetail1").fetchone()
                num_det = int(row[0])
                #print("num_det=", num_det)
                id_g = int(input("Введите код товара \n"))
                quan = int(input("Введите общее количество товара \n"))
                un = input("Укажите единицу счёта товара \n")
                quan_kpt = int(input("Введите количество оставшегося товара \n"))
                cur.execute("exec dbo.InsertSupplyDetail @num = ?,@id_sup = ?,@id_g = ?,@quan = ?,@un = ?,@quan_kpt = ?", num_det, id_sup, id_g, quan, un, quan_kpt)
                cur.commit()
                #cur.execute("exec dbo.ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
                i=i+1
            cur.close()
            con.close()
            break


def  Insert_Person():

     name=input("Введите имя/название нового партнёра \n")
     adres=input("Введите адрес \n")
     tel=input("Введите телефон обратной связи \n")
     e_mail=input("Введите адрес электронной почты \n")
     type=input("Введите тип юридического лица \n")
     attempt = 0
     while attempt < 3:

         key = int(input("Введите код подтверждения \n"))
         if key == 6242:

             print("Код принят")
             con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
             cur = con.cursor()
             row = cur.execute("exec dbo.Get_num_Person1").fetchone()
             id_p = int(row[0])
             #print("id_p=", id_p)
             row = cur.execute("exec dbo.Get_num_TypePerson1").fetchone()
             num_det = int(row[0])
             #print("num_det=", num_det)
             cur.execute("exec dbo.InsertPerson @id_per = ?,@name = ?,@adr = ?,@tel = ?,@e_m = ?", id_p, name, adres, tel, e_mail)
             cur.commit()
             cur.execute("exec dbo.InsertTypePerson @num = ?,@id_per = ?,@type = ?", num_det, id_p, type)
             cur.commit()
             #cur.execute("exec dbo.ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
             cur.close()
             con.close()
             break


def  Insert_Good():

    name = input("Введите название нового товара \n")
    quan = int(input("Введите количество товара \n"))
    type = input("Введите тип товара \n")
    attempt = 0
    while attempt < 3:

        key = int(input("Введите код подтверждения \n"))
        if key == 6242:
            print("Код принят")
            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            row = cur.execute("exec dbo.Get_num_Good1").fetchone()
            id_g = int(row[0])
            print(id_g)
            row = cur.execute("exec dbo.Get_num_TypeGood1").fetchone()
            num_det = int(row[0])
            #print("num_det=", num_det)
            cur.execute("exec dbo.InsertGood @id_g = ?,@name = ?,@quan = ?", id_g, name, quan)
            cur.commit()
            cur.execute("exec dbo.InsertTypeGood @num = ?,@id_g = ?,@type = ?", num_det, id_g, type)
            cur.commit()
            #cur.execute("exec dbo.ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
            cur.close()
            con.close()
            break

def  View_dataBase():

    key = 7
    while key != 6:

        print("Наберите номер выводимой таблицы: ")
        print("1 – таблица товаров, 2 – таблица заказов")
        print("3 – таблица поставок, 4 – таблица поставщиков")
        print("5 – таблица клиентов, 6 – выход")
        print("7 – список заказов за определённый период")
        print("8 – список поставок за определённый период")
        key = int(input("Введите здесь:  "))
        if key == 1:

            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowGoods")
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 2:

            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowOrders")
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 3:

            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowSupplies")
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 4:

            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowProv")
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 5:

            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowClients")
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 7:

            date1 = input("Введите начало периода\n")
            date2 = input("Введите конец периода\n")
            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
            for row in cur:
                print(row)
            cur.close()
            con.close()

        if key == 8:

            date1 = input("Введите начало периода\n")
            date2 = input("Введите конец периода\n")
            con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
            cur = con.cursor()
            cur.execute("exec dbo.ShowSupplyForSTime @date1 = ?,@date2 = ?", date1, date2)
            for row in cur:
                print(row)
            cur.close()
            con.close()

def  SpecialFunctions():

    key=7
    while  key != 6:

        print("Наберите номер выполняемой операции: ")
        print("1 – удаление заказа, 2 – удаление поставки")
        print("3 – удалить клиента/поставщика, 4 – удалить товар")
        print("6 – выход")
        key=input("Введите здесь:  ")
        if  key == 1:
            Delete_Order()

        if  key == 2:
            Delete_Supply()

        if  key == 3:
            Delete_Person()

        if  key == 4:
            Delete_Good()

def Delete_Order():

    id_ord=int(input("Введите номер удаляемого заказа \n"))
    key = int(input("Введите код подтверждения \n"))
    if key == 6642:
        print("Код принят")
        con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
        cur = con.cursor()
        cur.execute("exec dbo.DeleteDefOrder @id = ?", id_ord)
        cur.commit()
        cur.close()
        con.close()

def Delete_Supply():

    id_sup = int(input("Введите номер удаляемой поставки \n"))
    key = int(input("Введите код подтверждения \n"))
    if key == 6662:
        print("Код принят")
        con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
        cur = con.cursor()
        cur.execute("exec dbo.DeleteDefSupply @id = ?", id_sup)
        cur.commit()
        cur.close()
        con.close()

def Delete_Person():

    id_per=int(input("Введите номер удаляемого партнёра \n"))
    key = int(input("Введите код подтверждения \n"))
    if key == 6666:
        print("Код принят")
        con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
        cur = con.cursor()
        cur.execute("exec dbo.DeletePerson @id = ?", id_per)
        cur.commit()
        cur.close()
        con.close()

def Delete_Good():

    id_g = int(input("Введите номер удаляемого товара \n"))
    key = int(input("Введите код подтверждения \n"))
    if key == 7762:
        print("Код принят")
        con = pyodbc.connect('DRIVER={SQL Server};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs')
        cur = con.cursor()
        cur.execute("exec dbo.DeleteGood @id = ?", id_g)
        cur.commit()
        cur.close()
        con.close()

main()