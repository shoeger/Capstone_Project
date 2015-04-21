<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Log In
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Log In</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <asp:Login ID="Login1" runat="server" FailureTextStyle-CssClass="alert" LoginButtonStyle-CssClass="btn btn-primary btn-block" TextBoxStyle-CssClass="form-control" TitleText="" LabelStyle-CssClass="pull-left" CheckBoxStyle-CssClass="checkbox-inline" CssClass="pull-left"></asp:Login>
        </div>
    </div>

</asp:Content>

