<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManagePlacementsDetails.aspx.vb" Inherits="Admin_ManagePlacementsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Placement Details</title> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Placement Details</h1>
        </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSourceDetails" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT p.PlacementID, s.StudentID, c.Name, p.JobType, pt.PositionTypeName, p.PositionTitle, p.City, p.StateAbbrev, p.StartDate, p.EndDate, p.Responsibility, p.CompanyID, p.PositionTypeID, p.StudentID AS Expr1 FROM PLACEMENT AS p INNER JOIN COMPANY AS c ON p.CompanyID = c.CompanyID INNER JOIN POSITION_TYPE AS pt ON p.PositionTypeID = pt.PositionTypeID INNER JOIN STUDENT AS s ON p.StudentID = s.StudentID WHERE (p.PlacementID = @PlacementID)" DeleteCommand="DELETE FROM [PLACEMENT] WHERE [PlacementID] = @PlacementID" InsertCommand="INSERT INTO [PLACEMENT] ([City], [StateAbbrev], [CompanyID], [PositionTypeID], [PositionTitle], [StudentID], [JobType], [StartDate], [EndDate], [Responsibility]) VALUES (@City, @StateAbbrev, @CompanyID, @PositionTypeID, @PositionTitle, @StudentID, @JobType, @StartDate, @EndDate, @Responsibility)" UpdateCommand="UPDATE [PLACEMENT] SET [City] = @City, [StateAbbrev] = @StateAbbrev, [CompanyID] = @CompanyID, [PositionTypeID] = @PositionTypeID, [PositionTitle] = @PositionTitle, [StudentID] = @StudentID, [JobType] = @JobType, [StartDate] = @StartDate, [EndDate] = @EndDate, [Responsibility] = @Responsibility WHERE [PlacementID] = @PlacementID">
        <DeleteParameters>
            <asp:QueryStringParameter Name="PlacementID" QueryStringField="PlacementID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateAbbrev" Type="String" />
            <asp:Parameter Name="CompanyID" Type="Int32" />
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
            <asp:Parameter Name="PositionTitle" Type="String" />
            <asp:Parameter Name="StudentID" Type="String" />
            <asp:Parameter Name="JobType" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Responsibility" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="PlacementID" QueryStringField="PlacementID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateAbbrev" Type="String" />
            <asp:Parameter Name="CompanyID" Type="Int32" />
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
            <asp:Parameter Name="PositionTitle" Type="String" />
            <asp:Parameter Name="StudentID" Type="String" />
            <asp:Parameter Name="JobType" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Responsibility" Type="String" />
            <asp:Parameter Name="PlacementID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_PlacementSkills" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT s.SkillName FROM PLACEMENT_SKILL AS ps INNER JOIN SKILL AS s ON ps.SkillID = s.SkillID WHERE (ps.PlacementID = @PlacementID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PlacementID" QueryStringField="PlacementID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePlacementType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION_TYPE] ORDER BY PositionTypeName"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [COMPANY] ORDER BY Name"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [STUDENT] ORDER BY StudentID"></asp:SqlDataSource>
    <div class="row">
        <div class="col-md-8">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceDetails" Width="100%" CssClass="formview" >
                <EditItemTemplate>
                   <div role="form">
                       <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Placement ID:</label>
                                    <asp:Label ID="PlacementIDLabel1" runat="server" Text='<%# Bind("PlacementID") %>' CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Student ID:</label>
                                    <asp:DropDownList ID="DropDownListStudent" runat="server" DataSourceID="SqlDataSourceStudent" DataTextField="StudentID" DataValueField="StudentID" CssClass="form-control" Text='<%# Bind("StudentID")%>'></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Name:</label>
                                    <asp:DropDownList ID="CompanyDropDownList" runat="server" DataSourceID="SqlDataSourceCompany" DataTextField="Name" DataValueField="CompanyID" CssClass="form-control" Text='<%# Bind("CompanyID") %>'></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Job Type:</label>
                                    <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Type:</label>
                                    <asp:DropDownList ID="PositionTypeDropDownList" runat="server" DataSourceID="SqlDataSourcePlacementType" DataTextField="PositionTypeName" DataValueField="PositionTypeID" CssClass="form-control" Text='<%# Bind("PositionTypeID")%>'></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Title:</label>
                                    <asp:TextBox ID="PositionTitleTextBox" runat="server" Text='<%# Bind("PositionTitle") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>State:</label>
                                    <asp:TextBox ID="StateAbbrevTextBox" runat="server" Text='<%# Bind("StateAbbrev") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Start Date:</label>
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate", "{0:MM-dd-yyyy}") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>End Date:</label>
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate", "{0:MM-dd-yyyy}")%>' CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Responsibility:</label>
                                    <asp:TextBox ID="ResponsibilityTextBox" runat="server" Text='<%# Bind("Responsibility") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-right">
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" /> &nbsp;
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div role="form">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Student ID:</label>
                                    <asp:TextBox ID="StudentIDTextBox" runat="server" Text='<%# Bind("StudentID") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Name:</label>
                                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Job Type:</label>
                                    <asp:TextBox ID="JobTypeTextBox" runat="server" Text='<%# Bind("JobType") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Type Name:</label>
                                    <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Title:</label>
                                    <asp:TextBox ID="PositionTitleTextBox" runat="server" Text='<%# Bind("PositionTitle") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>State:</label>
                                    <asp:TextBox ID="StateAbbrevTextBox" runat="server" Text='<%# Bind("StateAbbrev") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Start Date:</label>
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>End Date:</label>
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Responsibility:</label>
                                    <asp:TextBox ID="ResponsibilityTextBox" runat="server" Text='<%# Bind("Responsibility") %>' CssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                   <div role="form">
                       <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Company Name:</label>
                                    <asp:Label ID="NameLabel" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Job Type:</label>
                                    <asp:Label ID="JobTypeLabel" runat="server" CssClass="form-control" Text='<%# Bind("JobType") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Type:</label>
                                    <asp:Label ID="PositionTypeNameLabel" runat="server" CssClass="form-control" Text='<%# Bind("PositionTypeName") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Position Title:</label>
                                    <asp:Label ID="PositionTitleLabel" runat="server" CssClass="form-control" Text='<%# Bind("PositionTitle") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:Label ID="CityLabel" runat="server" CssClass="form-control" Text='<%# Bind("City")%>' />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>State:</label>
                                    <asp:Label ID="StateAbbrevLabel" runat="server" CssClass="form-control" Text='<%# Bind("StateAbbrev") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Start Date:</label>
                                    <asp:Label ID="StartDateLabel" runat="server" CssClass="form-control" Text='<%# Bind("StartDate", "{0:MM-dd-yyyy}")%>' />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>End Date:</label>
                                    <asp:Label ID="EndDateLabel" runat="server" CssClass="form-control" Text='<%# Bind("EndDate", "{0:MM-dd-yyyy}")%>' />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Responsibilities:</label>
                                    <asp:TextBox ID="ResponsibilityLabel" runat="server" CssClass="form-control" Text='<%# Bind("Responsibility") %>' TextMode="MultiLine" ReadOnly="True" BackColor="White" Rows="4" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Skills Required:</label>
                            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource_PlacementSkills" CssClass="form-control" DataTextField="SkillName" DataValueField="SkillName"></asp:ListBox>
                        </div>
                    </div>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete Placement" CssClass="btn btn-link" OnClientClick="return confirm ('Are you sure you want to delete this position type?')"/>&nbsp;
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Edit" Text="Edit Placement" CssClass="btn btn-primary"/>
                    </div>
                </ItemTemplate>

            </asp:FormView>
        </div>
    </div>
</asp:Content>