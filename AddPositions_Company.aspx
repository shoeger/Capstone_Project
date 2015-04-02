<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddPositions_Company.aspx.vb" Inherits="AddPositions_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    Select or Add A New Company

    <p>  <asp:DropDownList ID="DropDownListCompany1" runat="server" DataSourceID="SqlDataSource_Company" DataTextField="Name" DataValueField="Name" Width="300px"></asp:DropDownList>  </p>

    
    <asp:SqlDataSource ID="SqlDataSource_Company" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT [Name] FROM [COMPANY]"></asp:SqlDataSource>
        





</asp:Content>

