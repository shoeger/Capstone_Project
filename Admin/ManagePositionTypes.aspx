<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManagePositionTypes.aspx.vb" Inherits="ManagePositionTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Manage Position Types</title> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Manage Position Types</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <label>Please select a position type:</label>
            <asp:ListBox ID="PositionTypeNameListBox" runat="server" DataSourceID="SqlDataSourceAddPositionTypeListbox" DataTextField="PositionTypeName" DataValueField="PositionTypeID" CssClass="form-control" AutoPostBack="true" ></asp:ListBox>
            <br />
            <asp:FormView ID="FormViewAddPositionType" runat="server" DataKeyNames="PositionTypeID" DataSourceID="SqlDataSourceAddPositionTypeFormview" CssClass="col-md-12">
                <EditItemTemplate>
                    <label>Position Type ID:</label>
                    <asp:Label ID="PositionTypeIDLabel1" runat="server" Text='<%# Eval("PositionTypeID") %>' CssClass="form-control" Enabled="false" />
                    <br />
                    <label>Position Type Name:</label>
                    <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' CssClass="form-control" required="required" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPositionTypeName" runat="server" ErrorMessage="Please enter a skill type name" CssClass="text-danger" ControlToValidate="PositionTypeNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <label>Position Type Name:</label> 
                    <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPositionTypeName" runat="server" ErrorMessage="Please enter a skill type name" CssClass="text-danger" ControlToValidate="PositionTypeNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="text-right">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-primary" OnClientClick="return confirm ('Are you sure you want to delete this position type?')"/>
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Position Type" CssClass="btn btn-primary" />
                    </div>
                </ItemTemplate>
                </asp:FormView>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSourceAddPositionTypeListbox" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT * FROM [POSITION_TYPE]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceAddPositionTypeFormview" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [POSITION_TYPE] WHERE [PositionTypeID] = @PositionTypeID" InsertCommand="INSERT INTO [POSITION_TYPE] ([PositionTypeName]) VALUES (@PositionTypeName)" SelectCommand="SELECT * FROM [POSITION_TYPE] WHERE ([PositionTypeID] = @PositionTypeID)" UpdateCommand="UPDATE [POSITION_TYPE] SET [PositionTypeName] = @PositionTypeName WHERE [PositionTypeID] = @PositionTypeID">
        <DeleteParameters>
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PositionTypeName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="PositionTypeNameListBox" DefaultValue="" Name="PositionTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="PositionTypeName" Type="String" />
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>

