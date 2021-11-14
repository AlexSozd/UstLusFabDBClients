import os
import sys
import math
import cx_Oracle
os.environ['NLS_LANG'] = 'AMERICAN_CIS.CL8MSWIN1251'

def main():

    try:
        attempt = 0
        while attempt < 3:

            print("Введите логин и пароль: \n")
            log=input("Логин: \n")
            pas=input("Пароль: \n")
            #Check with table InsideAccess
            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            kol=cur.var(cx_Oracle.NUMBER)
            args=[log, pas, kol]
            row=cur.callproc("Login_Python_1", args)
            kol1=kol.getvalue()
            if kol1 == 1:

                print("Введённый логин и пароль верны. Добро пожаловать!")
                break;

            else:
                print("Неверный логин и пароль!")

            cur.close()
            con.close()
            attempt = attempt + 1;
            if attempt > 2:

                print("Количество попыток исчерпано. Извините.")
                return 0

    except Exception as ex:

        print(type(ex))
        print(ex)
        print("Ошибка подключения. Извините за доставленные неудобства.")
        return 0    
    
    try:
        con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
        cur = con.cursor()

        cat1_1=cur.var(cx_Oracle.STRING)
        cat2_1=cur.var(cx_Oracle.STRING)
        cat3_1=cur.var(cx_Oracle.STRING)
        cat4_1=cur.var(cx_Oracle.STRING)
        cat5_1=cur.var(cx_Oracle.STRING)
        
        args=[log, pas, cat1_1, cat2_1, cat3_1, cat4_1, cat5_1]
        row=cur.callproc("CatsList", args)

        cat1=cat1_1.getvalue()
        cat2=cat2_1.getvalue()
        cat3=cat3_1.getvalue()
        cat4=cat4_1.getvalue()
        cat5=cat5_1.getvalue()

        cur.close()
        con.close()

    except Exception as ex:

        print(type(ex))
        print(ex)
        print("Ошибка подключения. Извините за доставленные неудобства.")
        return 0

    key = 7
    while key != 6:

       print("Наберите номер выполняемой операции: ")
       print("1 – добавление заказа, 2 – добавление поставки")
       print("3 – добавить клиента/поставщика, 4 – добавить товар")
       print("5 – просмотр базы данных, 6 – выход, 8 - добавление контакта")
       print("7 – другое")
       key = int(input("Введите здесь:  "))
       if  key == 1:

          try:
              Insert_Order(cat1)
          except Exception as ex:
             print(type(ex))
             print(ex)
             print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 2:

          try:
              Insert_Supply(cat1)
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 3:

          try:
              Insert_Person(cat2)
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 4:

          try:
              Insert_Good(cat3)
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 5:

          try:
              View_dataBase()
          except ValueError:
              print("Вы ввели неправильное значение.")
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 7:
          try:
              SpecialFunctions(cat1, cat2, cat3)
          except ValueError:
              print("Вы ввели неправильное значение.")
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

       if  key == 8:

          try:
              Insert_Contact(cat5)
          except Exception as ex:
              print(type(ex))
              print(ex)
              print("Ошибка подключения. Извините за доставленные неудобства.")

    #print("Нажмите любую клавишу для закрытия")
    #raw_input()
    return 0

def  Insert_Order(cat1):

    id_cust=int(input("Введите код заказчика \n"))
    pr=input("Введите стоимость заказа \n")
    pr_del=input("Введите стоимость доставки \n")
    data_of_sh=input("Введите дату отправки (мм-дд-гггг) \n")
    
    if cat1 == '1':

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #row = cur.execute("exec Get_num_Order").fetchone()
            row=cur.callproc("Get_num_Order")
            id_ord = int(row[0])
            #print("id_ord=", id_ord)
            #cur.execute("exec InsertOrder @id_ord1 = ?,@id_cust1 = ?,@pr1 = ?,@pr_del1 = ?,@date_of_sh1 = ?", id_ord, id_cust, pr, pr_del, data_of_sh)
            args=[id_ord, id_cust, pr, pr_del, data_of_sh]
            row=cur.callproc("InsertOrder", args)
            cur.commit()
            count_good = int(input("Введите число типов товара \n"))
            i = 0
            while i < count_good:

                #row = cur.execute("exec Get_num_OrderDetail").fetchone()
                row=cur.callproc("Get_num_OrderDetail")
                num_det = int(row[0])
                #print("num_det=", num_det)
                id_g = int(input("Введите код товара \n"))
                quan = int(input("Введите общее количество товара \n"))
                un = input("Укажите единицу счёта товара \n")
                #cur.execute("exec InsertOrderDetail @id_ordet1 = ?,@id_ord1 = ?,@id_g1 = ?,@quan1 = ?,@un1 = ?", num_det, id_ord, id_g, quan, un)
                args=[num_det, id_ord, id_g, quan, un]
                cur.callproc("InsertOrderDetail", args)
                cur.commit()
                i = i + 1

            cur.close()
            con.close()
            
    else:
           print("У вас нет прав доступа!")


def  Insert_Supply(cat1):

    id_prov=int(input("Введите код поставщика \n"))
    c=input("Введите стоимость поставки \n")
    c_sup=input("Введите стоимость доставки\n")
    data_of_arr=input("Введите дату получения (мм-дд-гггг) \n")
    
    if cat1 == '1':

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #row = cur.execute("exec Get_num_Supply").fetchone()
            row=cur.callproc("Get_num_Supply")
            id_sup = int(row[0])
            #print("id_sup=", id_sup)
            #cur.execute("exec InsertSupply @id_sup1 = ?,@id_prov1 = ?,@c1 = ?,@c_sup1 = ?,@date_of_arr1 = ?", id_sup, id_prov, c, c_sup, data_of_arr)
            args=[id_sup, id_prov, c, c_sup, data_of_arr]
            cur.callproc("InsertSupply", args)
            cur.commit()
            count_good = int(input("Введите число типов товара \n"))
            i = 0
            while i < count_good:

                #row = cur.execute("exec Get_num_SupplyDetail").fetchone()
                row=cur.callproc("Get_num_SupplyDetail")
                num_det = int(row[0])
                #print("num_det=", num_det)
                id_g = int(input("Введите код товара \n"))
                quan = int(input("Введите общее количество товара \n"))
                un = input("Укажите единицу счёта товара \n")
                quan_kpt = int(input("Введите количество оставшегося товара \n"))
                #cur.execute("exec InsertSupplyDetail @id_sudet1 = ?,@id_sup1 = ?,@id_g = ?,@quan1 = ?,@un1 = ?,@quan_kpt = ?", num_det, id_sup, id_g, quan, un, quan_kpt)
                args=[num_det, id_sup, id_g, quan, un, quan_kpt]
                cur.callproc("InsertSupplyDetail", args)
                cur.commit()
                i = i + 1
                
            cur.close()
            con.close()
    else:
           print("У вас нет прав доступа!")


def  Insert_Person(cat2):

     name=input("Введите имя/название нового партнёра \n")
     type1=input("Введите тип юридического лица \n")
     
     if cat2 == '1':

             con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
             cur = con.cursor()
             #row = cur.execute("exec Get_num_Firm").fetchone()
             row=cur.callproc("Get_num_Firm")
             id_p = int(row[0])
             #cur.execute("exec InsertFirm @id_fir1 = ?,@app1 = ?,@id_t1 = ?", id_p, name, type1)
             args=[id_p, name, type1]
             cur.callproc("InsertFirm", args)
             cur.commit()
             cur.close()
             con.close()
     else:
           print("У вас нет прав доступа!")

def  Insert_Contact(cat5):

     tit=input("Введите наименование нового контакта")
     name=input("Введите имя контактного лица \n")
     id_fir=input("Введите идентификатор организации \n")
     adres=input("Введите адрес \n")
     tel=input("Введите телефон обратной связи \n")
     e_mail=input("Введите адрес электронной почты \n")
     
     if cat5 == '1':

             con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
             cur = con.cursor()
             #row = cur.execute("exec Get_num_Person").fetchone()
             row=cur.callproc("Get_num_Person")
             id_p = int(row[0])
             #cur.execute("exec InsertPerson @id_per1 = ?,@tit1 = ?,@fio1 = ?,@id_fir1 = ?,@adr1 = ?,@tel1 = ?,@e_m1 = ?", id_p, tit, name, id_fir, adres, tel, e_mail)
             args=[id_p, tit, name, id_fir, adres, tel, e_mail]
             cur.callproc("InsertPerson", args)
             cur.commit()
             cur.close()
             con.close()
     else:
           print("У вас нет прав доступа!")

def  Insert_Good(cat3):

    name = input("Введите название нового товара \n")
    quan = int(input("Введите количество товара \n"))
    type1 = input("Введите тип товара \n")
    
    if cat3 == '1':

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #row = cur.execute("exec Get_num_Good").fetchone()
            row=cur.callproc("Get_num_Good")
            id_g = int(row[0])
            print(id_g)
            #row = cur.execute("exec Get_num_TypeGood").fetchone()
            row=cur.callproc("Get_num_TypeGood")
            num_det = int(row[0])
            #print("num_det=", num_det)
            #cur.execute("exec InsertGood @id_g1 = ?,@ap1 = ?,@quan1 = ?", id_g, name, quan)
            args=[id_g, name, quan]
            cur.callproc("InsertGood", args)
            cur.commit()
            #cur.execute("exec InsertTypeGood @id_t1 = ?,@id_g1 = ?,@t1 = ?", num_det, id_g, type1)
            args=[num_det, id_g, type1]
            cur.callproc("InsertTypeGood", args)
            cur.commit()
            cur.close()
            con.close()
            
    else:
           print("У вас нет прав доступа!")

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

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowGoods")
            #cur.callproc("ShowGoods")
            cur.execute("""SELECT * FROM List_Good""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 2:

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowOrders")
            #cur.callproc("ShowOrders")
            cur.execute("""SELECT * FROM OrdersList""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 3:

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowSupplies")
            #cur.callproc("ShowSupplies")
            cur.execute("""SELECT * FROM SuppliesList""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 4:

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowProv")
            #cur.callproc("ShowProv")
            #cur.execute("""SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_prov FROM Supplies)""")
            cur.execute("""SELECT * FROM Provs""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 5:

            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowClients")
            #cur.callproc("ShowClients")
            #cur.execute("""SELECT ID_firm, Type_of_firm, Appel FROM Firms WHERE ID_firm IN (SELECT DISTINCT ID_cust FROM Orders)""")
            cur.execute("""SELECT * FROM Clients""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 7:

            date1 = input("Введите начало периода\n")
            date2 = input("Введите конец периода\n")
            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowOrderForSTime @date1 = ?,@date2 = ?", date1, date2)
            #args=[date1, date2]
            #cur.callproc("ShowOrderForSTime", args)
            cur.execute("""SELECT * FROM OrdersList WHERE ((Date_of_sh >= :dt1) AND (Date_of_sh <= :dt2))""", dt1 = date1, dt2 = date2)
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

        if key == 8:

            date1 = input("Введите начало периода\n")
            date2 = input("Введите конец периода\n")
            con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
            cur = con.cursor()
            #cur.execute("exec ShowSupplyForSTime @date1 = ?,@date2 = ?", date1, date2)
            #args=[date1, date2]
            #cur.callproc("ShowSuplyForSTime", args)
            cur.execute("""SELECT * FROM SuppliesList WHERE ((Date_of_arr >= date1) AND (Date_of_arr <= date2))""")
            for row in cur.fetchall():
                print(row)
            cur.close()
            con.close()

def  SpecialFunctions(cat1, cat2, cat3):

    key = 7
    while key != 6:

        print("Наберите номер выполняемой операции: ")
        print("1 – удаление заказа, 2 – удаление поставки")
        print("3 – удалить клиента/поставщика, 4 – удалить товар")
        print("6 – выход")
        key = int(input("Введите здесь:  "))
        if  key == 1:
            Delete_Order(cat1)

        if  key == 2:
            Delete_Supply(cat1)

        if  key == 3:
            Delete_Person(cat2)

        if  key == 4:
            Delete_Good(cat3)

    #View_dataBase()

def Delete_Order(cat1):

    id_ord=int(input("Введите номер удаляемого заказа \n"))
    if cat1 == '1':

        otv=input("Вы уверены, что хотите удалить эту запись? Д или Н: \n")
        if otv == 'Д':

           con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
           cur = con.cursor()
           #cur.execute("exec DeleteDefOrder @id_ord = ?", id_ord)
           args=[id_ord]
           cur.callproc("DeleteDefOrder", args)
           cur.commit()
           cur.close()
           con.close()
    else:
        print("У вас нет прав доступа!")

def Delete_Supply(cat1):

    id_sup = int(input("Введите номер удаляемой поставки \n"))
    if cat1 == '1':

        otv=input("Вы уверены, что хотите удалить эту запись? Д или Н: \n")
        if otv == 'Д':

           con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
           cur = con.cursor()
           #cur.execute("exec DeleteDefSupply @id_s = ?", id_sup)
           args=[id_sup]
           cur.callproc("DeleteDefSupply", args)
           cur.commit()
           cur.close()
           con.close()
    else:
        print("У вас нет прав доступа!")

def Delete_Person(cat2):

    id_per=int(input("Введите номер удаляемого партнёра \n"))
    if cat2 == '2':

        otv=input("Вы уверены, что хотите удалить эту запись? Д или Н: \n")
        if otv == 'Д':

           con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
           cur = con.cursor()
           #cur.execute("exec DeleteFirm @id_fir = ?", id_per)
           args=[id_per]
           cur.callproc("DeleteFirm", args)
           cur.commit()
           cur.close()
           con.close()
    else:
        print("У вас нет прав доступа!")

def Delete_Good(cat3):

    id_g = int(input("Введите номер удаляемого товара \n"))
    if cat3 == '1':

        otv=input("Вы уверены, что хотите удалить эту запись? Д или Н: \n")
        if otv == 'Д':

           con = cx_Oracle.connect('SYSTEM/Sys17917@localhost/orcl')
           cur = con.cursor()
           #cur.execute("exec DeleteGood @id_g = ?", id_g)
           args=[id_g]
           cur.callproc("DeleteGood", args)
           cur.commit()
           cur.close()
           con.close()
    else:
        print("У вас нет прав доступа!")

main()
