<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delivery_form.aspx.cs" Inherits="Delivery_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Анкета для поставки</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 20px">
        <h2>Форма заявки:</h2>
    </div>
        <div>

        </div>
    <div>
        <table style="margin-left: 20px">
            <tr>
                <td> <b>Цель заявки: </b> </td><td> <asp:DropDownList id="dropDownList1" runat="server"> </asp:DropDownList> </td>
            </tr>
            <tr>
                <td> <b>Дата поставки: </b> </td>
                <td> <input type="datetime" name="time1" id="time1" form="form1" runat="server" required="required"/> </td>
            </tr>
        </table>
    </div>
        <div>

        </div>
    <div>
        <h3 style="margin-left: 20px"> <asp:Label ID="label1" runat="server" Text="Позиция № 1"></asp:Label></h3>
        <table style="margin-left: 20px">
            <tr>
                <td> <b>Товар: </b> </td><td> <asp:DropDownList id="dropDownList2" runat="server"> </asp:DropDownList> </td>
            </tr>
            <tr>
                <td> <b>Количество: </b> </td><td> <asp:TextBox ID="textBox1" runat="server" Text="10"> </asp:TextBox> </td>
                <td style="width: 10px"></td>
                <td> <b>По цене: </b> </td><td> <asp:TextBox ID="textBox2" runat="server" Text="100"> </asp:TextBox> </td>
                <td> руб.</td>
            </tr>
            <tr>
                <td> <asp:Label ID="label2" runat="server" Text="Единица измерения: в шт."> </asp:Label> </td>
            </tr>
        </table>
    </div>
        <div>

        </div>
    <div>
        <table>
            <tr>
                <td> <asp:Button ID="button1" runat="server" Text="Подтвердить" OnClick="button1_Click"/> </td>
                <td style="width: 10px"></td>
                <td> <asp:Button ID="button2" runat="server" Text="Отмена" OnClick="button2_Click"/> </td>
                <td style="width: 10px"></td>
                <td> <asp:Button ID="button3" runat="server" Text="Завершить" OnClick="button3_Click"/> </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
