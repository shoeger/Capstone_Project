<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddSkill_FormView.aspx.vb" Inherits="Admin_AddSkill_FormView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add a New Skill Type</h1>
            </div>
    </div>

    <div id="AddSkillType">

    <p><asp:FormView ID="FormView1" runat="server" DataKeyNames="SkillTypeID" DataSourceID="SqlDataSourceAddSKill2" DefaultMode="Insert">
        <EditItemTemplate>
            SkillTypeID:
            <asp:Label ID="SkillTypeIDLabel1" runat="server" Text='<%# Eval("SkillTypeID") %>' />
            <br />
            SkillTypeName:
            <asp:TextBox ID="SkillTypeNameTextBox" runat="server" Text='<%# Bind("SkillTypeName") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            SkillTypeName:
            <asp:TextBox ID="SkillTypeNameTextBox" runat="server" Text='<%# Bind("SkillTypeName") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            SkillTypeID:
            <asp:Label ID="SkillTypeIDLabel" runat="server" Text='<%# Eval("SkillTypeID") %>' />
            <br />
            SkillTypeName:
            <asp:Label ID="SkillTypeNameLabel" runat="server" Text='<%# Bind("SkillTypeName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSourceAddSKill2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [SKILL_TYPE] WHERE [SkillTypeID] = @SkillTypeID" InsertCommand="INSERT INTO [SKILL_TYPE] ([SkillTypeName]) VALUES (@SkillTypeName)" SelectCommand="SELECT * FROM [SKILL_TYPE]" UpdateCommand="UPDATE [SKILL_TYPE] SET [SkillTypeName] = @SkillTypeName WHERE [SkillTypeID] = @SkillTypeID">
        <DeleteParameters>
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SkillTypeName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SkillTypeName" Type="String" />
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </p>

        </div>

    <p>&nbsp;</p>
</asp:Content>

