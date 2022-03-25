<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Усть_Лусинское_сборочное_предприятие.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Контактная информация</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Для поставщиков:</h3>
        </header>
        <p>
            <span class="label">Телефон:</span>
            <span>8-915-888-77-243-34</span>
        </p>
        <p>
            <span class="label">E-mail:</span>
            <span><a href="mailto:supplylusinsk@gmail.com">supplylusinsk@gmail.com</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Для клиентов:</h3>
        </header>
        <p>
            <span class="label">Телефон:</span>
            <span>8-915-666-57-721-12</span>
        </p>
        <p>
            <span class="label">E-mail:</span>
            <span><a href="mailto:orderlusinsk@gmail.com">orderlusinsk@gmail.comm</a></span>
        </p>
    </section>

    <section class="contact">
        <header>
            <h3>Адрес центрального управления:</h3>
        </header>
        <p>
            Усть-Лусинск<br />
            Улица Ефремова, дом 3
        </p>
    </section>
</asp:Content>