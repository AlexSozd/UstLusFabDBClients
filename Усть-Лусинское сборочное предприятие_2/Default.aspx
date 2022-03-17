<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Главная</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-left: 20px">
        <h1>Усть-Лусинское сборочное предприятие</h1>
        <h2 style="margin-left: 17px">Официальный сайт</h2>
    </div>
        <aside style="float: right; margin-right: 30px">
            <asp:Login ID="Login1" runat="server" BorderStyle="Solid" BorderColor="Black" BackColor="WhiteSmoke" BorderWidth="2px" 
                UserNameLabelText="Login:" PasswordLabelText="Password:" CreateUserText="Create a new user..." OnAuthenticate="Login1_Authenticate" OnLoggingIn="Login1_LoggingIn" OnLoginError="Login1_LoginError">
            </asp:Login>
        </aside>
    <div style="margin-left: 20px">
        <h3 style="margin-left: 20px">Наше предприятие осуществляет сборку различной электроники, преимущественно бытовой, сотрудничая с ведущими фирмами и торговыми сетями.</h3>
    </div>
    <div>
        <asp:Image ID="Image1" runat="server" BackColor="#99FFCC" style="margin-left: 216px; margin-right: 6px; margin-top: 19px" Width="524px"></asp:Image>
    </div>
    <div>
        <table style="margin-left: 20px">
            <tr>
                <td> <asp:ImageMap ID="ImageMap1" runat="server" HotSpotMode="Navigate">
                    <asp:RectangleHotSpot Left="0" Right="100" Top="0" Bottom="150" NavigateUrl="~/About.aspx" PostBackValue="About Us" AlternateText="About Us" HotSpotMode="Navigate"/>
                     </asp:ImageMap> </td>
                <td style="width: 10px"></td>
                <td> <asp:ImageMap ID="ImageMap2" runat="server" HotSpotMode="Navigate">
                    <asp:RectangleHotSpot Left="0" Right="100" Top="0" Bottom="150" NavigateUrl="~/Contacts.aspx" PostBackValue="Contacts" AlternateText="Contacts" HotSpotMode="Navigate"/>
                     </asp:ImageMap> </td>
                <td style="width: 10px"></td>
                <td> <asp:ImageMap ID="ImageMap3" runat="server" HotSpotMode="Navigate" Visible="false">
                    <asp:RectangleHotSpot Left="0" Right="100" Top="0" Bottom="150" NavigateUrl="~/Delivery_form.aspx" PostBackValue="Deliveries" AlternateText="Deliveries" HotSpotMode="Navigate"/>
                     </asp:ImageMap> </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
