<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div id="login">

    <p>
        <br />
        Login</p>
    <p>
        Username:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Inset" Width="185px"></asp:TextBox>
    </p>
    <p>
        Password:&nbsp; <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Inset" Width="185px"></asp:TextBox>
    </p>

    </div>



</asp:Content>

