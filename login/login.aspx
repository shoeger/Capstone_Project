<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
				<div class="panel-heading panel-title">
					<h4>Login</h4>
				</div>
				<div class="panel-body">
                    <asp:Login ID="Login1" runat="server" CssClass="login col-md-12" FailureTextStyle-CssClass="alert" LoginButtonStyle-CssClass="btn btn-primary" TextBoxStyle-CssClass="form-control" TitleText="" LabelStyle-CssClass="pull-left" CheckBoxStyle-CssClass="checkbox-inline" TextLayout="TextOnTop" Width="100%" OnLoggedIn="Login1_LoggedIn"></asp:Login>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

