<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddPosition.aspx.vb" Inherits="AddPositions_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>  &nbsp;</p>

    
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
    <br />
    <asp:MultiView ID="AddPositionMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="CompanyView" runat="server">
            <br />
            Select or Add A New Company
            <br />
            <br />
            <asp:DropDownList ID="DropDownListCompany1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Company" DataTextField="Name" DataValueField="Name" Width="300px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyID" DataSourceID="SqlDataSource_CompanyDetails" HorizontalAlign="Center">
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
                    <table>
                        <tr>
                            <td class="left_column">Name</td>
                            <td class="right_column">
                                <asp:TextBox ID="NameTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("Name") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Description</td>
                            <td class="right_column">
                                <asp:TextBox ID="DescriptionTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("Description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Street</td>
                            <td class="right_column">
                                <asp:TextBox ID="StreetTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("Street") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">City</td>
                            <td class="right_column">
                                <asp:TextBox ID="CityTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("City") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">State</td>
                            <td class="right_column">
                                <asp:TextBox ID="StateAbbrevTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("StateAbbrev") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Zip Code</td>
                            <td class="right_column">
                                <asp:TextBox ID="ZipCodeTextBox0" runat="server" CssClass="textbox" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table>
                        <tr>
                            <td class="left_column">Name</td>
                            <td class="right_column">
                                <asp:Label ID="NameLabel" runat="server" CssClass="label" Text='<%# Bind("Name") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Description</td>
                            <td class="right_column">
                                <asp:Label ID="DescriptionLabel" runat="server" CssClass="label" Text='<%# Bind("Description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Street</td>
                            <td class="right_column">
                                <asp:Label ID="StreetLabel" runat="server" CssClass="label" Text='<%# Bind("Street") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">City</td>
                            <td class="right_column">
                                <asp:Label ID="CityLabel" runat="server" CssClass="label" Text='<%# Bind("City") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">State</td>
                            <td class="right_column">
                                <asp:Label ID="StateAbbrevLabel" runat="server" CssClass="label" Text='<%# Bind("StateAbbrev") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="left_column">Zip Code</td>
                            <td class="right_column">
                                <asp:Label ID="ZipCodeLabel" runat="server" CssClass="label" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
            <asp:Button CommandName="NextView" ID="ButtonCompanyNext" runat="server" Text="Next" CssClass="Button" />
        </asp:View>
        <asp:View ID="PositionView" runat="server">
            
            <asp:SqlDataSource ID="SqlDataSource_PositionType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION_TYPE]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Position" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION] WHERE ([PositionTypeID] = @PositionTypeID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListPositionType" Name="PositionTypeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <table>
                <tr>
                    <td>Position Type:</td>
                    <td><asp:RadioButton ID="RadioButtonFullTime" runat="server" Text=" Full Time" /><asp:RadioButton ID="RadioButtonInternship" runat="server" Text="Internship"/></td>
                </tr>
                <tr>
                    <td>Select Position Type:</td>
                    <td><asp:DropDownList ID="DropDownListPositionType" runat="server" DataSourceID="SqlDataSource_PositionType" DataTextField="PositionTypeName" DataValueField="PositionTypeID" Width="301px">
                </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Select Position Title:</td>
                    <td><asp:DropDownList ID="DropDownListPositionName" runat="server" DataSourceID="SqlDataSource_Position" DataTextField="PositionName" DataValueField="PositionID" Width="300px">
                </asp:DropDownList></td>
                </tr>
            </table>

            <asp:Button CommandName="NextView" ID="ButtonPositionNext" runat="server" Text="Next" CssClass="Button" />
             
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
            <asp:Button CommandName="NextView" ID="ButtonPositionDetailsNext" runat="server" Text="Next" CssClass="Button" />
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
            <asp:Button CommandName="NextView" ID="ButtonSkillsNext" runat="server" Text="Next" CssClass="Button" />
        </asp:View>
    </asp:MultiView>
        





</asp:Content>

