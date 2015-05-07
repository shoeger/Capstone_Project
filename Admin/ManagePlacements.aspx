<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManagePlacements.aspx.vb" Inherits="Admin_ManagePlacements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Manage Placements</title> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Student Placements</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="input-group">
                <asp:textbox id="textboxSearch" CssClass="form-control" placeholder="Search for..." runat="server" ></asp:textbox>
                <span class="input-group-btn"><asp:linkbutton id="buttonSearch" CssClass="btn btn-primary" type="button" runat="server"><span class="glyphicon glyphicon-search"></span></asp:linkbutton></span>
            </div>
        </div>
    </div>
    <br />

    <asp:SqlDataSource ID="SqlDataSource_Placements" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT p.PlacementID, c.Name, pt.PositionTypeName, p.City, p.StateAbbrev, p.JobType FROM PLACEMENT AS p INNER JOIN COMPANY AS c ON p.CompanyID = c.CompanyID INNER JOIN POSITION_TYPE AS pt ON p.PositionTypeID = pt.PositionTypeID"></asp:SqlDataSource>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridViewPlacements" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Placements" CssClass="table" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Company" SortExpression="Name" />
                    <asp:BoundField DataField="PositionTypeName" HeaderText="Position Type" SortExpression="PositionTypeName" />
                    <asp:BoundField DataField="JobType" HeaderText="Placement Type" SortExpression="JobType" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="StateAbbrev" HeaderText="State" SortExpression="StateAbbrev" />
                    <asp:HyperLinkField DataNavigateUrlFields="PlacementID" DataNavigateUrlFormatString="ManagePlacementsDetails.aspx?PlacementID={0}" Text="View Details" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>