<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ManageSkills.aspx.vb" Inherits="ManageSkills" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Manage Skills</title> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSourceSkillListbox" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [SKILL] ORDER BY SkillName"></asp:SqlDataSource>
            
    <asp:SqlDataSource ID="SqlDataSourceSkillFormview" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [SKILL] WHERE [SkillID] = @SkillID" InsertCommand="INSERT INTO [SKILL] ([SkillName], [SkillTypeID]) VALUES (@SkillName, @SkillTypeID)" SelectCommand="SELECT * FROM [SKILL] WHERE ([SkillID] = @SkillID)" UpdateCommand="UPDATE [SKILL] SET [SkillName] = @SkillName, [SkillTypeID] = @SkillTypeID WHERE [SkillID] = @SkillID">
        <DeleteParameters>
            <asp:Parameter Name="SkillID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SkillName" Type="String" />
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBoxSkill" Name="SkillID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SkillName" Type="String" />
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
            <asp:Parameter Name="SkillID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSkillTypeListbox" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [SKILL_TYPE] ORDER BY SkillTypeName"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSkillTypeFormview" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" DeleteCommand="DELETE FROM [SKILL_TYPE] WHERE [SkillTypeID] = @SkillTypeID" InsertCommand="INSERT INTO [SKILL_TYPE] ([SkillTypeName]) VALUES (@SkillTypeName)" SelectCommand="SELECT * FROM [SKILL_TYPE] WHERE ([SkillTypeID] = @SkillTypeID)" UpdateCommand="UPDATE [SKILL_TYPE] SET [SkillTypeName] = @SkillTypeName WHERE [SkillTypeID] = @SkillTypeID">
        <DeleteParameters>
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SkillTypeName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="SkillTypeNameListBox" Name="SkillTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SkillTypeName" Type="String" />
            <asp:Parameter Name="SkillTypeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Manage Skills</h1>
            </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <label>Select a skill type:</label>
            <asp:ListBox ID="SkillTypeNameListBox" runat="server" DataSourceID="SqlDataSourceSkillTypeListbox" DataTextField="SkillTypeName" DataValueField="SkillTypeID" CssClass="form-control" AutoPostBack="True" ></asp:ListBox>
            <br />
            <asp:FormView ID="FormViewSkillType" runat="server" DataKeyNames="SkillTypeID" DataSourceID="SqlDataSourceSkillTypeFormview" CssClass="col-md-12" >
                <EditItemTemplate>
                    <label>Skill Type ID:</label>
                    <asp:Label ID="SkillTypeIDLabel1" runat="server" Text='<%# Eval("SkillTypeID") %>' CssClass="form-control" Enabled="false" />
                    <br />
                    <label>Skill Type Name:</label>
                    <asp:TextBox ID="SkillTypeNameTextBox" runat="server" Text='<%# Bind("SkillTypeName") %>' CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCallNum" runat="server" ErrorMessage="Please enter a skill type name" CssClass="text-danger" ControlToValidate="SkillTypeNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <label>Skill Type Name:</label>
                    <asp:TextBox ID="SkillTypeNameTextBox" runat="server" Text='<%# Bind("SkillTypeName") %>' CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCallNum" runat="server" ErrorMessage="Please enter a skill type name" CssClass="text-danger" ControlToValidate="SkillTypeNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="text-right">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-primary" OnClientClick="return confirm ('Are you sure you want to delete this skill type?')"/>
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Skill Type" CssClass="btn btn-primary" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-8">
            <p><strong>-- OR --</strong></p>
        </div>
    </div>  
    <br />
    <div class="row">
        <div class="col-md-8">
            <label>Select a skill:</label>
            <asp:ListBox ID="ListBoxSkill" runat="server" DataSourceID="SqlDataSourceSkillListbox" DataTextField="SkillName" DataValueField="SkillID" CssClass="form-control" AutoPostBack="True" ></asp:ListBox>
            <br />
            <asp:FormView ID="FormViewSkill" runat="server" DataKeyNames="SkillTypeID" DataSourceID="SqlDataSourceSkillFormview" CssClass="col-md-12" >
                <EditItemTemplate>
                    <label>Skill ID:</label>
                    <asp:Label ID="SkillIDLabel" runat="server" Text='<%# Bind("SkillID")%>' CssClass="form-control" Enabled="false" />
                    <br />
                    <label>Skill Name:</label>
                    <asp:TextBox ID="SkillNameTextBox" runat="server" Text='<%# Bind("SkillName")%>' CssClass="form-control"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSkillName" runat="server" ErrorMessage="Please enter a skill name" CssClass="text-danger" ControlToValidate="SkillNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <label>Skill Type Name:</label>
                    <asp:DropDownList ID="DropDownListSkillType" runat="server" DataSourceID="SqlDataSourceSkillTypeListbox" DataTextField="SkillTypeName" DataValueField="SkillTypeID" Text='<%# Bind("SkillTypeID")%>' CssClass="form-control" ></asp:DropDownList>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <label>Skill Name:</label>
                    <asp:TextBox ID="SkillNameTextBox" runat="server" Text='<%# Bind("SkillName")%>' CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSkillName" runat="server" ErrorMessage="Please enter a skill name" CssClass="text-danger" ControlToValidate="SkillNameTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    <label>Skill Type Name:</label>
                    <asp:DropDownList ID="DropDownListSkillType" runat="server" DataSourceID="SqlDataSourceSkillTypeListbox" DataTextField="SkillTypeName" DataValueField="SkillTypeID" Text='<%# Bind("SkillTypeID")%>' CssClass="form-control" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a skill type" CssClass="text-danger" ControlToValidate="DropDownListSkillType" Display="Dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <div class="text-right">
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-link" />
                        &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="text-right">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-primary" OnClientClick="return confirm ('Are you sure you want to delete this skill?')"/>
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Skill" CssClass="btn btn-primary" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
</asp:Content>

