#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "logindialog.h"

#include <QtSql/QSql>
#include <QDialog>
#include <QMessageBox>
#include <QtSql/QSqlDatabase>
#include <QtSql/qsql.h>
#include <QtSql/qsqldatabase.h>
#include <QtSql/QSqlDriver>
#include <QtSql/qsqldriver.h>
#include <QtSql/QSqlQuery>
#include <QtSql/qsqlquery.h>
#include <QtSql/QSqlQueryModel>
#include <QtSql/qsqlquerymodel.h>
#include <QtSql/QSqlTableModel>
#include <QtSql/qsqltablemodel.h>
#include <QtSql/QSqlDriver>
#include <QtSql/qsqldriver.h>
#include <QtSql/QtSql>
#include <QtSql/QSqlDriverCreator>
#include <QtSql/QSqlDriverCreatorBase>
#include <QtSql/QSqlDriverPlugin>
#include <QtSql/qsqldriverplugin.h>
#include <QtSql/QSqlResult>
#include <QtSql/qsqlresult.h>
#include <QtSql/QSqlError>
#include <QtSql/qsqlerror.h>
#include <QtSql/QSqlField>
#include <QtSql/qsqlfield.h>
#include <QtSql/QSqlIndex>
#include <QtSql/qsqlindex.h>
#include <QtSql/QSqlRecord>
#include <QtSql/qsqlrecord.h>

//QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
//db.setDatabaseName("Kurs");
//db.setHostName("LENOVO-PC\MSSQLSERVER1");
//db.setHostName("MSSQLSERVER1");
//db.open();
//QSqlQuery que;
//que.setForwardOnly(true);
//QSqlQueryModel mod;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    LoginDialog* pInputDialog = new LoginDialog;
    pInputDialog->show();
    if(pInputDialog->exec() == QDialog::Accepted)
    {
        /*QMessageBox::information(0,
                                 "Authorization",
                                 "Login: "
                                 + pInputDialog->Login()
                                 + "\nPassword: "
                                 + pInputDialog->Password()
                                 );*/
        //QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
        QSqlDatabase db=QSqlDatabase::addDatabase("QOCI");
        //db.setDatabaseName("(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = Lenovo-PC)(PORT = 1521))(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = orcl)))");
        db.setDatabaseName("orcl");
        //db.setHostName("Lenovo-PC");
        db.setUserName("SYSTEM");
        db.setPassword("Sys17917");
        db.open();
        QSqlQuery que;
        que.setForwardOnly(true);
        que.prepare("{CALL QtLogin(?)}");
        que.bindValue(0,pInputDialog->Login());
        que.exec();
        QSqlRecord res = que.record();
        //
        QString parole;
        if(que.next())
        {
            parole=que.value(res.indexOf("Parole")).toString();
            if(pInputDialog->Password() == parole)
            {
                ui->comboBox->addItem("????????????");
                ui->comboBox->addItem("??????????????");
                ui->comboBox->addItem("????????????????????");
                ui->comboBox->addItem("????????????");
                ui->comboBox->addItem("????????????????");
                ui->comboBox->addItem("???????????????? ???? ????????????");
                ui->comboBox->addItem("???????????? ???? ????????????");
                ui->comboBox->setEditable(true);
                ui->comboBox->show();
                ui->dateEdit->show();
                ui->dateEdit_2->show();
                ui->tableView->show();
            }
        }

        db.close();
        db.removeDatabase("QOCI");
        //db.removeDatabase("QODBC");
    }
    delete pInputDialog;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    //QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    QSqlDatabase db=QSqlDatabase::addDatabase("QOCI");
    //db.setDatabaseName("DRIVER={SQL SERVER};SERVER=LENOVO-PC\MSSQLSERVER1;DATABASE=Kurs;");
    db.setDatabaseName("orcl");
    //db.setDatabaseName("Kurs");
    //db.setUserName("Lenovo-PC\Lenovo");
    db.setHostName("Lenovo-PC");
    db.setUserName("SYSTEM");
    //db.setPassword("");
    db.setPassword("Sys17917");
    db.open();
    QSqlQuery que;
    que.setForwardOnly(true);
    QSqlQueryModel mod;
    ui->dateEdit->setDisabled(true);
    ui->dateEdit_2->setDisabled(true);
    if(ui->comboBox->currentText() == "????????????")
    {
        //que.exec("{CALL ShowGoods}");
        que.prepare("{CALL ShowGoods}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "??????????????")
    {
        //que.exec("{CALL ShowClients}");
        que.prepare("{CALL ShowClients}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????????????")
    {
        //que.exec("{CALL ShowProv}");
        que.prepare("{CALL ShowProv}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????")
    {
        //que.exec("{CALL ShowOrders}");
        que.prepare("{CALL ShowOrders}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????????")
    {
        //que.exec("{CALL ShowSupplies}");
        que.prepare("{CALL ShowSupplies}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "???????????? ???? ????????????")
    {
        //que.exec("{call ShowOrderForSTime(@dataEdit.date(), @dataEdit_2.date())}");
        que.prepare("{CALL ShowOrderForSTime(?, ?)}");
        que.bindValue(0,ui->dateEdit->date());
        que.bindValue(1,ui->dateEdit_2->date());
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "???????????????? ???? ????????????")
    {
        //que.exec("{call ShowSupplyForSTime(@dataEdit.date(), @dataEdit_2.date())}");
        que.prepare("{CALL ShowSupplyForSTime(?, ?)}");
        que.bindValue(0,ui->dateEdit->date());
        que.bindValue(1,ui->dateEdit_2->date());
        mod.setQuery(que);
    }
    ui->tableView->setModel(&mod);
    db.close();
    //db.removeDatabase("QODBC");
    db.removeDatabase("QOCI");
}


void MainWindow::on_pushButton_2_clicked()
{
    //QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    QSqlDatabase db=QSqlDatabase::addDatabase("QOCI");
    db.setDatabaseName("orcl");
    db.setHostName("Lenovo-PC");
    db.setUserName("SYSTEM");
    db.setPassword("Sys17917");
    //QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    //db.setConnectOptions();
    //db.setHostName("MSSQLSERVER1");
    //db.setHostName("(local)");
    //db.setDatabaseName("Driver={SQL SERVER};Server=MSSQLSERVER1;Database=Kurs;Trusted_Connection=no;");
    //db.setHostName("LENOVO-PC\MSSQLSERVER1");
    //db.setDatabaseName("Kurs");
    //db.setUserName("Lenovo-PC\Lenovo");
    //db.setPassword("");
    db.open();
    QSqlQuery que;
    que.setForwardOnly(true);
    QSqlQueryModel mod;
    ui->dateEdit->setDisabled(true);
    ui->dateEdit_2->setDisabled(true);
    if(ui->comboBox->currentText() == "????????????")
    {
        //que.exec("{CALL ShowGoods}");
        que.prepare("{CALL ShowGoods}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "??????????????")
    {
        //que.exec("{CALL ShowClients}");
        que.prepare("{CALL ShowClients}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????????????")
    {
        //que.exec("{CALL ShowProv}");
        que.prepare("{CALL ShowProv}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????")
    {
        //que.exec("{CALL ShowOrders}");
        que.prepare("{CALL ShowOrders}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "????????????????")
    {
        //que.exec("{CALL ShowSupplies}");
        que.prepare("{CALL ShowSupplies}");
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "???????????? ???? ????????????")
    {
        //que.exec("{call ShowOrderForSTime(dataEdit.date(), dataEdit_2.date())}");
        que.prepare("{CALL ShowOrderForSTime(?, ?)}");
        que.bindValue(0,ui->dateEdit->date());
        que.bindValue(1,ui->dateEdit_2->date());
        mod.setQuery(que);
    }
    else if(ui->comboBox->currentText() == "???????????????? ???? ????????????")
    {
        //que.exec("{call ShowSupplyForSTime(dataEdit.date(), dataEdit_2.date())}");
        que.prepare("{CALL ShowSupplyForSTime(?, ?)}");
        que.bindValue(0,ui->dateEdit->date());
        que.bindValue(1,ui->dateEdit_2->date());
        mod.setQuery(que);
    }
    ui->tableView->setModel(&mod);
    db.close();
    //db.removeDatabase("QODBC");
    db.removeDatabase("QOCI");
}


void MainWindow::on_comboBox_activated(const QString &arg1)
{
    if(arg1 == "???????????? ???? ????????????")
    {
        ui->dateEdit->setDisabled(false);
        ui->dateEdit_2->setDisabled(false);
    }
    if(arg1 == "???????????????? ???? ????????????")
    {
        ui->dateEdit->setDisabled(false);
        ui->dateEdit_2->setDisabled(false);
    }
}
