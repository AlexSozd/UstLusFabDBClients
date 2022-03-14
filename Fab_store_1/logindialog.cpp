#include "logindialog.h"
#include <QWidget>
#include <QPushButton>
#include <QLineEdit>
#include <QLabel>
#include <QLayout>

LoginDialog::LoginDialog(QWidget* pwgt)
    :QDialog(pwgt, Qt::WindowTitleHint | Qt::WindowSystemMenuHint)
{
    login = new QLineEdit;
    pass = new QLineEdit;

    QLabel* plblLogin = new QLabel("&Login");
    QLabel* plblPassword = new QLabel("&Password");

    plblLogin->setBuddy(login);
    plblPassword->setBuddy(pass);

    QPushButton* pcmdOK = new QPushButton("&Ok");
    QPushButton* pcmdCancel = new QPushButton("&Cancel");

    connect(pcmdOK, SIGNAL(clicked()), SLOT(accept()));
    connect(pcmdCancel, SIGNAL(clicked()), SLOT(reject()));

    QGridLayout* ptopLayout = new QGridLayout;
    ptopLayout->addWidget(plblLogin, 0, 0);
    ptopLayout->addWidget(plblPassword, 1, 0);
    ptopLayout->addWidget(login, 0, 1);
    ptopLayout->addWidget(pass, 1, 1);
    ptopLayout->addWidget(pcmdOK, 2, 0);
    ptopLayout->addWidget(pcmdCancel, 2, 1);
    setLayout(ptopLayout);
}
QString LoginDialog::Login() const
{
    return login->text();
}
QString LoginDialog::Password() const
{
    return pass->text();
}
