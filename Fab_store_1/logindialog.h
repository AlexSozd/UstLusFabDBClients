#ifndef LOGINDIALOG_H
#define LOGINDIALOG_H
#include <QDialog>
class QLineEdit;
class LoginDialog : public QDialog
{
    Q_OBJECT
private:
    QLineEdit* login;
    QLineEdit* pass;
public:
    LoginDialog(QWidget* pwgt = 0);

    QString Login() const;
    QString Password() const;
};
#endif // LOGINDIALOG_H
