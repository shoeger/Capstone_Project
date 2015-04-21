<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManagePositionTypes.aspx.vb" Inherits="ManagePositionTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Add a New Position Type</h1>
        </div>
    </div>

    <div id="AddPositionType">

    <p>
    
    <asp:FormView ID="FormViewAddPositionType" runat="server" DataKeyNames="PositionTypeID" DataSourceID="SqlDataSourceAddPositionType" DefaultMode="Insert">
        <EditItemTemplate>
            PositionTypeID:
            <asp:Label ID="PositionTypeIDLabel1" runat="server" Text='<%# Eval("PositionTypeID") %>' />
            <br />
            PositionTypeName:
            <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            PositionTypeName:
            <asp:TextBox ID="PositionTypeNameTextBox" runat="server" Text='<%# Bind("PositionTypeName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            PositionTypeID:
            <asp:Label ID="PositionTypeIDLabel" runat="server" Text='<%# Eval("PositionTypeID") %>' />
            <br />
            PositionTypeName:
            <asp:Label ID="PositionTypeNameLabel" runat="server" Text='<%# Bind("PositionTypeName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSourceAddPositionType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [POSITION_TYPE] WHERE [PositionTypeID] = @PositionTypeID" InsertCommand="INSERT INTO [POSITION_TYPE] ([PositionTypeName]) VALUES (@PositionTypeName)" SelectCommand="SELECT * FROM [POSITION_TYPE]" UpdateCommand="UPDATE [POSITION_TYPE] SET [PositionTypeName] = @PositionTypeName WHERE [PositionTypeID] = @PositionTypeID">
        <DeleteParameters>
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PositionTypeName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="PositionTypeName" Type="String" />
            <asp:Parameter Name="PositionTypeID" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>

  
    </p>

    </div>

    <br />

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Add a New Position Title</h1>
        </div>
    </div>

    <div id="AddPositionTitle">

    <p>
        <asp:FormView ID="FormViewAddPositionTitle" runat="server" DataKeyNames="PositionID" DataSourceID="SqlDataSourceAddPositionTitle" DefaultMode="Insert">
            <EditItemTemplate>
                PositionID:
                <asp:Label ID="PositionIDLabel1" runat="server" Text='<%# Eval("PositionID") %>' />
                <br />
                PositionName:
                <asp:TextBox ID="PositionNameTextBox" runat="server" Text='<%# Bind("PositionName") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                PositionTypeID:
                <asp:TextBox ID="PositionTypeIDTextBox" runat="server" Text='<%# Bind("PositionTypeID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PositionName:
                <asp:TextBox ID="PositionNameTextBox" runat="server" Text='<%# Bind("PositionName") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                PositionTypeID:
                <asp:TextBox ID="PositionTypeIDTextBox" runat="server" Text='<%# Bind("PositionTypeID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PositionID:
                <asp:Label ID="PositionIDLabel" runat="server" Text='<%# Eval("PositionID") %>' />
                <br />
                PositionName:
                <asp:Label ID="PositionNameLabel" runat="server" Text='<%# Bind("PositionName") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                PositionTypeID:
                <asp:Label ID="PositionTypeIDLabel" runat="server" Text='<%# Bind("PositionTypeID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        
        
       <asp:SqlDataSource ID="SqlDataSourceAddPositionTitle" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [POSITION] WHERE [PositionID] = @PositionID" InsertCommand="INSERT INTO [POSITION] ([PositionName], [Description], [PositionTypeID]) VALUES (@PositionName, @Description, @PositionTypeID)" SelectCommand="SELECT * FROM [POSITION]" UpdateCommand="UPDATE [POSITION] SET [PositionName] = @PositionName, [Description] = @Description, [PositionTypeID] = @PositionTypeID WHERE [PositionID] = @PositionID">
           <DeleteParameters>
               <asp:Parameter Name="PositionID" Type="Int32" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="PositionName" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="PositionTypeID" Type="Int32" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="PositionName" Type="String" />
               <asp:Parameter Name="Description" Type="String" />
               <asp:Parameter Name="PositionTypeID" Type="Int32" />
               <asp:Parameter Name="PositionID" Type="Int32" />
           </UpdateParameters>
        </asp:SqlDataSource>
    </p>

    </div>

</asp:Content>

