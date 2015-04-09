<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddSkill.aspx.vb" Inherits="Admin_AddSkill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <h3>Add Skill Type</h3>

    <asp:DetailsView ID="DetailsViewSkillType" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="SkillTypeID" DataSourceID="SqlDataSourceSkillType" DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="SkillTypeID" HeaderText="SkillTypeID" InsertVisible="False" ReadOnly="True" SortExpression="SkillTypeID" />
            <asp:BoundField DataField="SkillTypeName" HeaderText="SkillTypeName" SortExpression="SkillTypeName" />
            <asp:ButtonField ButtonType="Button" Text="Submit" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceSkillType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [SKILL_TYPE]"></asp:SqlDataSource>

</asp:Content>

