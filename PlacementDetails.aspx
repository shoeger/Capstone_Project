<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PlacementDetails.aspx.vb" Inherits="PlacementDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Placement Details</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Placement Details</h1>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceDetails" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT p.PlacementID, s.StudentID, c.Name, p.JobType, pt.PositionTypeName, p.PositionTitle, p.City, p.StateAbbrev, p.StartDate, p.EndDate, p.Responsibility FROM PLACEMENT AS p INNER JOIN COMPANY AS c ON p.CompanyID = c.CompanyID INNER JOIN POSITION_TYPE AS pt ON p.PositionTypeID = pt.PositionTypeID INNER JOIN STUDENT AS s ON p.StudentID = s.StudentID WHERE (p.PlacementID = @PlacementID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PlacementID" QueryStringField="PlacementID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_PlacementSkills" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT s.SkillName FROM PLACEMENT_SKILL AS ps INNER JOIN SKILL AS s ON ps.SkillID = s.SkillID WHERE (ps.PlacementID = @PlacementID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PlacementID" QueryStringField="PlacementID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceDetails" Width="100%" CssClass="formview" >
        <EditItemTemplate>
            PlacementID:
            <asp:Label ID="PlacementIDLabel1" runat="server" Text='<%# Eval("PlacementID") %>' />
            <br />
            StudentID:
            <asp:TextBox ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            JobType:
            <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' />
            <br />
            PositionTypeName:
            <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' />
            <br />
            PositionTitle:
            <asp:TextBox ID="PositionTitleTextBox" runat="server" Text='<%# Bind("PositionTitle") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            StateAbbrev:
            <asp:TextBox ID="StateAbbrevTextBox" runat="server" Text='<%# Bind("StateAbbrev") %>' />
            <br />
            StartDate:
            <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
            <br />
            EndDate:
            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
            <br />
            Responsibility:
            <asp:TextBox ID="ResponsibilityTextBox" runat="server" Text='<%# Bind("Responsibility") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            StudentID:
            <asp:TextBox ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            JobType:
            <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' />
            <br />
            PositionTypeName:
            <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' />
            <br />
            PositionTitle:
            <asp:TextBox ID="PositionTitleTextBox" runat="server" Text='<%# Bind("PositionTitle") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            StateAbbrev:
            <asp:TextBox ID="StateAbbrevTextBox" runat="server" Text='<%# Bind("StateAbbrev") %>' />
            <br />
            StartDate:
            <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
            <br />
            EndDate:
            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
            <br />
            Responsibility:
            <asp:TextBox ID="ResponsibilityTextBox" runat="server" Text='<%# Bind("Responsibility") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
           <div role="form">
               <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Company Name:</label>
                            <asp:Label ID="NameLabel" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Job Type:</label>
                            <asp:Label ID="JobTypeLabel" runat="server" CssClass="form-control" Text='<%# Bind("JobType") %>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Position Type:</label>
                            <asp:Label ID="PositionTypeNameLabel" runat="server" CssClass="form-control" Text='<%# Bind("PositionTypeName") %>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Position Title:</label>
                            <asp:Label ID="PositionTitleLabel" runat="server" CssClass="form-control" Text='<%# Bind("PositionTitle") %>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>City:</label>
                            <asp:Label ID="CityLabel" runat="server" CssClass="form-control" Text='<%# Bind("City")%>' />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>State:</label>
                            <asp:Label ID="StateAbbrevLabel" runat="server" CssClass="form-control" Text='<%# Bind("StateAbbrev") %>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Start Date:</label>
                            <asp:Label ID="StartDateLabel" runat="server" CssClass="form-control" Text='<%# Bind("StartDate", "{0:MM-dd-yyyy}")%>' />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>End Date:</label>
                            <asp:Label ID="EndDateLabel" runat="server" CssClass="form-control" Text='<%# Bind("EndDate", "{0:MM-dd-yyyy}")%>' />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label>Responsibilities:</label>
                            <asp:TextBox ID="ResponsibilityLabel" runat="server" CssClass="form-control" Text='<%# Bind("Responsibility") %>' TextMode="MultiLine" ReadOnly="True" BackColor="White" />
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <div class="row">
        <div class="col-md-8">
            <label>Skills Required:</label>
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource_PlacementSkills" CssClass="form-control" DataTextField="SkillName" DataValueField="SkillName"></asp:ListBox>
        </div>
    </div>
</asp:Content>

