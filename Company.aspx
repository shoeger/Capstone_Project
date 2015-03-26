<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Company.aspx.vb" Inherits="Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [COMPANY] WHERE [CompanyID] = @CompanyID" InsertCommand="INSERT INTO [COMPANY] ([Name], [Description], [Street], [City], [StateAbbrev], [ZipCode]) VALUES (@Name, @Description, @Street, @City, @StateAbbrev, @ZipCode)" SelectCommand="SELECT * FROM [COMPANY]" UpdateCommand="UPDATE [COMPANY] SET [Name] = @Name, [Description] = @Description, [Street] = @Street, [City] = @City, [StateAbbrev] = @StateAbbrev, [ZipCode] = @ZipCode WHERE [CompanyID] = @CompanyID">
            <DeleteParameters>
                <asp:Parameter Name="CompanyID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateAbbrev" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateAbbrev" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="CompanyID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CompanyID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" InsertVisible="False" ReadOnly="True" SortExpression="CompanyID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateAbbrev" HeaderText="StateAbbrev" SortExpression="StateAbbrev" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            </Columns>
        </asp:GridView>
    </p>
</asp:Content>

