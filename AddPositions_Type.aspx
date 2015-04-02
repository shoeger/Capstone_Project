<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddPositions_Type.aspx.vb" Inherits="AddPositions_Type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3> Select Position Type </h3>

  <p>     <asp:DropDownList ID="DropDownList1" runat="server" Width="300px" DataSourceID="SqlDataSource_PositionType1" DataTextField="PositionType" DataValueField="PositionType">
      </asp:DropDownList> 
      <asp:SqlDataSource ID="SqlDataSource_PositionType1" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT [PositionType] FROM [POSITION_TYPE]"></asp:SqlDataSource>
    </p>

    </asp:Content>

