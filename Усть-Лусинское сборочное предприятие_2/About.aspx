<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>О нас</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h2 style="margin-left: 20px"><b>О нас</b></h2>
    </div>
    <div>
    <article>
        <p style="margin-left: 20px">        
            Усть-Лусинское сборочное предприятие находится на центральной улице (улице Ефремова) в городе Усть-Лусинск Владимирской области.
        </p>

        <p style="margin-left: 20px">        
            Наше предприятие основано в 1959 году. Изначально оно было предназначено для сборки отечественной электротехники.
        </p>

        <p style="margin-left: 20px">        
            В 1995 году наше предприятие перепрофилировалось для сборки продукции зарубежных ТНК, заключив с ними соответствующие договоры.
        </p>

        <p style="margin-left: 20px">        
            С 2000 года мы несколько раз расширяли наше предприятие, добавив несколько новых сборочных линий и увеличив штат.
        </p>

        <p style="margin-left: 20px">        
            Несмотря на все трудности, мы смотрим в будущее с уверенностью.
        </p>
    </article>
        <aside style="float: right; margin-right: 30px">
        <h3 style="margin-left: 2px">Ссылки</h3>
        <p style="margin-left: 2px">       
            Смотрите дополнительно:
        </p>
        <ul>
            <li><a runat="server" href="~/Default.aspx">Главная</a></li>
            <li><a runat="server" href="~/About.aspx">О компании</a></li>
            <li><a runat="server" href="~/Contacts.aspx">Контакты</a></li>
        </ul>
    </aside>
    <div style="margin-left: 20px">
        <h3>Наши клиенты:</h3>
        <asp:Table ID="Table1" runat="server"> </asp:Table>
    </div>
    <div style="margin-left: 20px">
        <h3>Наши поставщики:</h3>
        <asp:Table ID="Table2" runat="server"> </asp:Table>
    </div>
    </div>
    </form>
</body>
</html>
