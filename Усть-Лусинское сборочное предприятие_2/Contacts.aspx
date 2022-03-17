<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Contacts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Контакты</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2 style="margin-left: 20px"><b>Контактная информация</b></h2>
    </div>
        <aside style="float: right; margin-right:30px">
        <h3>Ссылки</h3>
        <p>        
            Смотрите дополнительно:
        </p>
        <ul>
            <li><a runat="server" href="~/Default.aspx">Главная</a></li>
            <li><a runat="server" href="~/About.aspx">О компании</a></li>
            <li><a runat="server" href="~/Contacts.aspx">Контакты</a></li>
        </ul>
    </aside>
    <div style="margin-left: 20px">
        <header>
            <h3>Для поставщиков:</h3>
        </header>
        <p>
            <span class="label"><b>Телефон:</b></span>
            <span>8-915-888-77-243-34</span>
        </p>
        <p>
            <span class="label"><b>E-mail:</b></span>
            <span><a href="mailto:supplylusinsk@gmail.com">supplylusinsk@gmail.com</a></span>
        </p>
    </div>
    <div style="margin-left: 20px">
        <header>
            <h3>Для клиентов:</h3>
        </header>
        <p>
            <span class="label"><b>Телефон:</b></span>
            <span>8-915-666-57-721-12</span>
        </p>
        <p>
            <span class="label"><b>E-mail:</b></span>
            <span><a href="mailto:orderlusinsk@gmail.com">orderlusinsk@gmail.com</a></span>
        </p>
    </div>
    <div style="margin-left: 20px">
        <header>
            <h3>Адрес центрального управления:</h3>
        </header>
        <p>
            Усть-Лусинск<br />
            Улица Ефремова, дом 3
        </p>
    </div>
    </form>
</body>
</html>
