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
            <asp:Button CommandName="NextView" ID="ButtonCompany" runat="server" Text="Next" CssClass="Button" />
        </asp:View>
        <asp:View ID="PositionView" runat="server">

                <asp:SqlDataSource ID="SqlDataSource_PositionType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION_TYPE]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Position" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION] WHERE ([PositionTypeID] = @PositionTypeID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListPositionType" Name="PositionTypeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <p>
                Select Position Type:
                <asp:DropDownList ID="DropDownListPositionType" runat="server" DataSourceID="SqlDataSource_PositionType" DataTextField="PositionTypeName" DataValueField="PositionTypeID" Width="301px">
                </asp:DropDownList>
                <br />
            </p>
            <p>
                Select Position Title:
                <asp:DropDownList ID="DropDownListPositionName" runat="server" DataSourceID="SqlDataSource_Position" DataTextField="PositionName" DataValueField="PositionID" Width="300px">
                </asp:DropDownList>
            </p>

        </asp:View>
    </asp:MultiView>
        





</asp:Content>

