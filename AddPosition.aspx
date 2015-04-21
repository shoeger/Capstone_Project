<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AddPosition.aspx.vb" Inherits="AddPositions_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    Add Postion
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="head2" runat="server">
    <link href="css/bootstrap-datepicker.css" rel="stylesheet" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:SqlDataSource ID="SqlDataSource_Company" runat="server" ConnectionString="<%$ ConnectionStrings:PlacementDB3ConnectionString %>" SelectCommand="SELECT * FROM [COMPANY] ORDER BY Name"></asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SqlDataSource_CompanyDetails" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [COMPANY]" DeleteCommand="DELETE FROM [COMPANY] WHERE [CompanyID] = @CompanyID" InsertCommand="INSERT INTO [COMPANY] ([Name], [Industry]) VALUES (@Name, @Industry)" UpdateCommand="UPDATE [COMPANY] SET [Name] = @Name, [Industry] = @Industry WHERE [CompanyID] = @CompanyID">
        <DeleteParameters>
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Industry" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Industry" Type="String" />
            <asp:Parameter Name="CompanyID" Type="Int32" />
        </UpdateParameters>
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
                            <asp:DropDownList ID="DropDownListCompany1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Company" DataTextField="Name" DataValueField="CompanyID" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Select a Company --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                     <asp:FormView ID="FormView1" runat="server" DataKeyNames="CompanyID" DataSourceID="SqlDataSource_CompanyDetails" Width="100%">
                        <InsertItemTemplate>
                            <div role="form">
                                <div class="form-group">
                                    <label>Company Name:</label>
                                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Name") %>' />
                                </div>
                                <div class="form-group">
                                    <label>Industry:</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("Industry")%>' />
                                </div>
                                <div class="form-group">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-default" /> &nbsp;
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
                                </div> 
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div role="form">
                                <div class="form-group">
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" CssClass="btn btn-default" />
                                </div>
                            </div>  
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-8">
                    <label><u>Placement Location</u></label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>City:</label>
                            <asp:TextBox ID="TextBoxCity" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>State:</label>
                            <asp:DropDownList ID="DropDownListStates" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Select a State --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Button CommandName="NextView" ID="ButtonCompanyNext" runat="server" Text="Next" CssClass="btn btn-primary" />
        </asp:View>
        <asp:View ID="PositionView" runat="server">
            
            <asp:SqlDataSource ID="SqlDataSource_PositionType" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [POSITION_TYPE]"></asp:SqlDataSource>

            <div role="form" class="row col-md-8">
                <div class="form-group">
                    <label for="jobType" class="control-label input-group">Select a Job Type:</label>
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default">
                            <input id="radioJobTypeF" name="jobType" value="F" type="radio" runat="server" />Full Time
                        </label>
                        <label class="btn btn-default">
                            <input id="radioJobTypeI" name="jobType" value="I" type="radio" runat="server" />Intership
                        </label>
                    </div> 
                </div> 
                
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Select Position Type:</label>
                        <asp:DropDownList ID="DropDownListPositionType" runat="server" DataSourceID="SqlDataSource_PositionType" DataTextField="PositionTypeName" DataValueField="PositionTypeID" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Select a Position Type --" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="control-group form-group">
                    <div class="controls">
                        <label>Select Position Title:</label>
                        <asp:TextBox ID="PositionName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row col-md-8">
                <asp:Button CommandName="PrevView" ID="ButtonPositionPrev" runat="server" Text="Previous" CssClass="btn btn-primary" />
                <asp:Button CommandName="NextView" ID="ButtonPositionNext" runat="server" Text="Next" CssClass="btn btn-primary" />
             </div>

        </asp:View>
        <asp:View ID="PositionDetailsView" runat="server">
            <asp:SqlDataSource ID="SqlDataSource_Major" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [MAJOR]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Students" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Placement %>" SelectCommand="SELECT * FROM [STUDENT]"></asp:SqlDataSource>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Student ID:</label>
                            <asp:DropDownList ID="DropDownListStudents" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataSourceID="SqlDataSource_Students" DataTextField="StudentID" DataValueField="StudentID">
                                <asp:ListItem Text="-- Select your ID --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Major (Primary):</label>
                            <asp:DropDownList ID="DropDownListMajorPrimary" runat="server" DataSourceID="SqlDataSource_Major" DataTextField="MajorName" DataValueField="MajorID" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Select a Primary Major --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Major (Secondary, if applicable):</label>
                            <asp:DropDownList ID="DropDownListMajorSecondary" runat="server" DataSourceID="SqlDataSource_Major" DataTextField="MajorName" DataValueField="MajorID" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="-- Select a Secondary Major --" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Date Starting:</label>
                            <div id="datepickerStart" class="input-group date">
                                <input id="labelStartDate" type="text" class="form-control" runat="server"/>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Date Ending (if availabile):</label>
                            <div id="datepickerEnd" class="input-group date">
                                <input id="labelEndDate" type="text" class="form-control" runat="server"/>
                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Contact First Name:</label>
                            <asp:TextBox ID="TextBoxContactFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Contact Last Name:</label>
                            <asp:TextBox ID="TextBoxContactLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Contact Phone:</label>
                            <asp:TextBox ID="TextBoxContactPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Contact Email:</label>
                            <asp:TextBox ID="TextBoxContactEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div id="controls">
                            <label for="jobPaid" class="control-label input-group">Position Paid:</label>
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn btn-default"><input name="jobPaid" value="Y" type="radio" />Yes</label>
                                <label class="btn btn-default"><input name="jobPaid" value="N" type="radio" />No</label>
                            </div> 
                        </div>
                    </div>
                </div> 
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Salary:</label>
                            <asp:TextBox ID="TextBoxSalary" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Responsibilities:</label>
                            <asp:TextBox ID="TextBoxResponsibility" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <br />
            <asp:Button CommandName="PrevView" ID="ButtonPositionDetailsPrev" runat="server" Text="Previous" CssClass="btn btn-primary" />
            <asp:Button CommandName="NextView" ID="ButtonPositionDetailsNext" runat="server" Text="Next" CssClass="btn btn-primary" />

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
            <asp:Button CommandName="PrevView" ID="ButtonSkillsPrev" runat="server" Text="Previous" CssClass="btn btn-primary" />
            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
        </asp:View>
    </asp:MultiView>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script>
        $('.input-group.date').datepicker({
            autoclose: true,
            todayHighlight: true
        });
    </script>
</asp:Content>
