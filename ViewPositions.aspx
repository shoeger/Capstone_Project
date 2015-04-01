<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewPositions.aspx.vb" Inherits="ViewPositions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    View Positions

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT [PositionName], [Description], [PositionID] FROM [POSITION] ORDER BY [PositionID] DESC"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PositionID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="PositionName" HeaderText="Position Name" SortExpression="PositionName" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CommandField SelectText="More Info" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>


</asp:Content>

