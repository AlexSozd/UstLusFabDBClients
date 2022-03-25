<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Усть_Лусинское_сборочное_предприятие.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>История и описание</h2>
    </hgroup>

    <article>
        <p>        
            Усть-Лусинское сборочное предприятие находится на центральной улице (улице Ефремова) в городе Усть-Лусинск Владимирской области.
        </p>

        <p>        
            Наше предприятие основано в 1959 году. Изначально оно было предназначено для сборки отечественной электротехники.
        </p>

        <p>        
            В 1995 году наше предприятие перепрофилировалось для сборки продукции зарубежных ТНК, заключив с ними соответствующие договоры.
        </p>

        <p>        
            С 2000 года мы несколько раз расширяли наше предприятие, добавив несколько новых сборочных линий и увеличив штат.
        </p>

        <p>        
            Несмотря на все трудности, мы смотрим в будущее с уверенностью.
        </p>
    </article>

    <article>
        <h3>        
            Наши клиенты:
            <asp:DataGrid ID="DataGrid1" runat="server"
                BorderColor = "White"
                BorderWidth = "1px"
                ForeColor = "Black"
                GridLines = "Both"
                Height = 569px 
                Width = 461px DataSourceID="SqlDataSource1" HorizontalAlign="Center" ShowHeader="False" style="margin-top: 39px">
                <ItemStyle BorderColor="Black" ForeColor="Black" />
            </asp:DataGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:KursConnectionString %>" SelectCommand="ShowListProv" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </h3>
    </article>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KursConnectionString %>" SelectCommand="ShowListClients" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    <article>
        <h3>        
            Наши поставщики:
            <asp:DataGrid ID="DataGrid2" runat="server"
                BorderColor = "White"
                BorderWidth = "1px"
                ForeColor = "Black"
                GridLines = "Both" 
                Height = 569px 
                Width = 461px DataSourceID="SqlDataSource2" HorizontalAlign="Center" style="margin-top: 73px" ShowHeader="False">
                <ItemStyle BorderColor="Black" ForeColor="Black" />
            </asp:DataGrid>
        </h3>
    </article>
        <div>
            
        </div>

    <aside>
        <h3>Ссылки</h3>
        <p>        
            Смотрите дополнительно:
        </p>
        <ul>
            <li><a runat="server" href="~/">Главная</a></li>
            <li><a runat="server" href="~/About">О компании</a></li>
            <li><a runat="server" href="~/Contact">Контакты</a></li>
        </ul>
    </aside>
</asp:Content>