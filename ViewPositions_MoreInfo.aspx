<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewPositions_MoreInfo.aspx.vb" Inherits="ViewPositions_MoreInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3>Position Details</h3>

    <p>This page will display the rest of the information about the selected position that we do not have listed on the ViewPositions.aspx page. </p>

    <p> <asp:DetailsView ID="DetailsView_MoreInfo" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource_MoreInfo"></asp:DetailsView>  
        <asp:SqlDataSource ID="SqlDataSource_MoreInfo" runat="server"></asp:SqlDataSource>
    </p>
  
</asp:Content>

