#include "mainwindow.h"
#include <QApplication>

#include <QtWidgets>
//#include <QtSql>
#include <QtSql/QSql>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlQueryModel>
#include <QtSql/QSqlTableModel>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();
    //TableWidget.show();

    //QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    //db.setDatabaseName("Kurs");
    //db.setHostName("LENOVO-PC\MSSQLSERVER1");
    //db.open();
    //QSqlQuery que;
    //que.setForwardOnly(true);
    //QSqlQueryModel mod;

    /*if(pushButton.clicked == true)
    {

    }
    if(pushButton_2.clicked == true)
    {

    }
    if(comboBox.currentText == "Заказы за период")
    {
        dataEdit.enabled=true;
        dataEdit_2.enabled=true;
        if(pushButton_2.clicked == true)
        {
            que.exec("{call ShowOrderForSTime(dataEdit.date(), dataEdit_2.date())}");
            mod.setQuery(que);
        }
    }
    if(comboBox.currentText == "Поставки за период")
    {
        dataEdit.enabled=true;
        dataEdit_2.enabled=true;
        if(pushButton_2.clicked == true)
        {
            que.exec("{call ShowSupplyForSTime(dataEdit.date(), dataEdit_2.date())}");
            mod.setQuery(que);
        }
    }
    tableView.setModel(&mod);
    */

    return a.exec();
}
