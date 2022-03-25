<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Усть_Лусинское_сборочное_предприятие._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>
                    <asp:Label ID="Label1" runat="server" Text="Усть-Лусинское сборочное предприятие"></asp:Label>
                    <%: Title %>.</h1>
                <h2>
                    &nbsp;</h2>
            </hgroup>
            <p>
                    <asp:Label ID="Label2" runat="server" Text="Официальный сайт"></asp:Label>
                </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>&nbsp;</h3>
    <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Наше предприятие осуществляет сборку различной электроники, преимущественно бытовой, сотрудничая с ведущими фирмами и торговыми сетями.&nbsp;</h3>
    <p>
        <asp:Image ID="Image1" runat="server" BackColor="#99FFCC" style="margin-left: 216px; margin-right: 6px; margin-top: 19px" Width="524px" />
    </p>
    </asp:Content>
