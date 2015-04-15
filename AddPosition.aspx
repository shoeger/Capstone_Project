<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddPosition.aspx.vb" Inherits="AddPositions_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:SqlDataSource ID="SqlDataSource_Company" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT [Name] FROM [COMPANY]"></asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SqlDataSource_CompanyDetails" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" InsertCommand="INSERT INTO [COMPANY] ([Name], [Description], [Street], [City], [StateAbbrev], [ZipCode]) VALUES (@Name, @Description, @Street, @City, @StateAbbrev, @ZipCode)" SelectCommand="SELECT * FROM [COMPANY] WHERE ([Name] = @Name)">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateAbbrev" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListCompany1" Name="Name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Add a New Position</h1>
        </div>
    </div>

    <asp:MultiView ID="AddPositionMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="CompanyView" runat="server">
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Select a Company</label> 
                            <asp:DropDownList ID="DropDownListCompany1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Company" DataTextField="Name" DataValueField="Name" class="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyID" DataSourceID="SqlDataSource_CompanyDetails">
                <EditItemTemplate>
                    CompanyID:
                    <asp:Label ID="CompanyIDLabel1" runat="server" Text='<%# Eval("CompanyID") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    <br />
                    Street:
                    <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                    <br />
                    City:
                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                    <br />
                    StateAbbrev:
                    <asp:TextBox ID="StateAbbrevTextBox" runat="server" Text='<%# Bind("StateAbbrev") %>' />
                    <br />
                    ZipCode:
                    <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Company Name:</label>
                                    <asp:TextBox ID="NameTextBox" runat="server" class="form-control" Text='<%# Bind("Name") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Description:</label>
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" class="form-control" Text='<%# Bind("Description") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Street:</label>
                                    <asp:TextBox ID="StreetTextBox" runat="server" class="form-control" Text='<%# Bind("Street") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>City:</label>
                                    <asp:TextBox ID="CityTextBox" runat="server" class="form-control" Text='<%# Bind("City") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>State:</label>
                                    <asp:TextBox ID="StateAbbrevTextBox" runat="server" class="form-control" Text='<%# Bind("StateAbbrev") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Zip Code:</label>
                                     <asp:TextBox ID="ZipCodeTextBox" runat="server" class="form-control" Text='<%# Bind("ZipCode") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-wrapper">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" class="btn btn-default" /> &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Class="btn btn-default" />
                    </div>

                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Company Name:</label>
                                    <asp:Label ID="NameLabel" runat="server" class="form-control" Text='<%# Bind("Name") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Description:</label>
                                    <asp:Label ID="DescriptionLabel" runat="server" class="form-control" Text='<%# Bind("Description") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Street:</label>
                                    <asp:Label ID="StreetLabel" runat="server" class="form-control" Text='<%# Bind("Street") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>City:</label>
                                    <asp:Label ID="CityLabel" runat="server" class="form-control" Text='<%# Bind("City") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>State:</label>
                                    <asp:Label ID="StateAbbrevLabel" runat="server" class="form-control" Text='<%# Bind("StateAbbrev") %>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>Zip Code:</label>
                                     <asp:Label ID="ZipCodeLabel" runat="server" class="form-control" Text='<%# Bind("ZipCode") %>' />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" class="btn btn-default" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
            <asp:Button CommandName="NextView" ID="ButtonCompanyNext" runat="server" Text="Next" class="btn btn-primary" />
        </asp:View>
        <asp:View ID="PositionView" runat="server">
            
            <asp:SqlDataSource ID="SqlDataSource_PositionType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION_TYPE]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Position" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION] WHERE ([PositionTypeID] = @PositionTypeID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListPositionType" Name="PositionTypeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class="row">
                <div class="col-md-8">
                    <label for="jobType" class="control-label input-group">Select a Job Type:</label>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default">
                            <input name="jobType" value="F" type="radio">Full Time
                        </label>
                        <label class="btn btn-default">
                            <input name="jobType" value="I" type="radio">Intership
                        </label>
                    </div> 
                </div> 
                
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Select Position Type:</label>
                            <asp:DropDownList ID="DropDownListPositionType" runat="server" DataSourceID="SqlDataSource_PositionType" DataTextField="PositionTypeName" DataValueField="PositionTypeID" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Select Position Title:</label>
                            <asp:DropDownList ID="DropDownListPositionName" runat="server" DataSourceID="SqlDataSource_Position" DataTextField="PositionName" DataValueField="PositionID" class="form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <asp:Button CommandName="PrevView" ID="ButtonPositionPrev" runat="server" Text="Previous" class="btn btn-primary" />
            <asp:Button CommandName="NextView" ID="ButtonPositionNext" runat="server" Text="Next" class="btn btn-primary" />
             
        </asp:View>
        <asp:View ID="PositionDetailsView" runat="server">
            <asp:SqlDataSource ID="SqlDataSource_Major" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [MAJOR]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Semester" runat="server"></asp:SqlDataSource>
            <table>
                <tr>
                    <td>Major (Primary):</td>
                    <td><asp:DropDownList ID="DropDownListMajorPrimary" runat="server" DataSourceID="SqlDataSource_Major" DataTextField="MajorName" DataValueField="MajorID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Major (Secondary):</td>
                    <td><asp:DropDownList ID="DropDownListMajorSecondary" runat="server" DataSourceID="SqlDataSource_Major" DataTextField="MajorName" DataValueField="MajorID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Date Starting:</td>
                    <td><asp:Calendar ID="CalendarStartDate" runat="server"></asp:Calendar></td>
                </tr>
                <tr>
                    <td>Date Ending (if availabile):</td>
                    <td><asp:Calendar ID="CalendarEndDate" runat="server"></asp:Calendar></td>
                </tr>
                <tr>
                    <td>Contact First Name:</td>
                    <td><asp:TextBox ID="TextBoxContactFirstName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Contact Last Name:</td>
                    <td><asp:TextBox ID="TextBoxContactLastName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Contact Phone:</td>
                    <td><asp:TextBox ID="TextBoxContactPhone" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Contact Email:</td>
                    <td><asp:TextBox ID="TextBoxContactEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Position Paid:</td>
                    <td>
                        <asp:RadioButton ID="RadioButtonInterPaid" runat="server" Text="Yes" /><asp:RadioButton ID="RadioButtonInternUnpaid" runat="server" Text="No" /></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><asp:TextBox ID="TextBoxSalary" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Button CommandName="PrevView" ID="ButtonPositionDetailsPrev" runat="server" Text="Previous" class="btn btn-primary" />
            <asp:Button CommandName="NextView" ID="ButtonPositionDetailsNext" runat="server" Text="Next" class="btn btn-primary" />
        </asp:View>
        <asp:View ID="SkillsView" runat="server">
            <asp:SqlDataSource ID="SqlDataSource_SkillType1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM SKILL WHERE SkillTypeID = 1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_SkillType2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM SKILL WHERE SkillTypeID = 2"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_SkillType3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM SKILL WHERE SkillTypeID = 3"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_SkillType4" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM SKILL WHERE SkillTypeID = 4"></asp:SqlDataSource>
            <h2>Database Skills</h2>
            <asp:CheckBoxList ID="CheckBoxListSkillType1" runat="server" DataSourceID="SqlDataSource_SkillType1" DataTextField="SkillName" DataValueField="SkillID">
            </asp:CheckBoxList>
            <h2>Language Tools Skills</h2>
            <asp:CheckBoxList ID="CheckBoxListSkillType2" runat="server" DataSourceID="SqlDataSource_SkillType2" DataTextField="SkillName" DataValueField="SkillID">
            </asp:CheckBoxList>
            <h2>Operating Systems Skills</h2>
            <asp:CheckBoxList ID="CheckBoxListSkillType3" runat="server" DataSourceID="SqlDataSource_SkillType3" DataTextField="SkillName" DataValueField="SkillID">
            </asp:CheckBoxList>
            <h2>Hardware Skills</h2>
            <asp:CheckBoxList ID="CheckBoxListSkillType4" runat="server" DataSourceID="SqlDataSource_SkillType4" DataTextField="SkillName" DataValueField="SkillID">
            </asp:CheckBoxList>
            <br />
            <br />
            <asp:Button CommandName="PrevView" ID="ButtonSkillsPrev" runat="server" Text="Previous" class="btn btn-primary" />
            <asp:Button CommandName="NextView" ID="ButtonSkillsNext" runat="server" Text="Next" class="btn btn-primary" />
        </asp:View>
    </asp:MultiView>
        





</asp:Content>

