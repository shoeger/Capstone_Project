Imports System.Data.SqlClient

Partial Class AddPlacement
    Inherits System.Web.UI.Page

    Dim stateList As String() = {"AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MH", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "PW", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"}

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        DropDownListStates.DataSource = stateList
        DropDownListStates.DataBind()

    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Response.Redirect("AddPosition.aspx")
    End Sub


    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Response.Redirect("AddPosition.aspx")
    End Sub

    Protected Sub ButtonSubmit_Click(sender As Object, e As EventArgs) Handles ButtonSubmit.Click

        Dim city As String = TextBoxCity.Text.ToString
        Dim stateAbbrev As String = DropDownListStates.SelectedItem.ToString
        Dim companyID As Integer = DropDownListCompany1.SelectedValue
        Dim positionTypeID As Integer = DropDownListPositionType.SelectedValue
        Dim positionTitle As String = PositionName.Text.ToString
        Dim studentID As String = DropDownListStudents.SelectedValue
        Dim jobType As String
        Dim startDate As Date = labelStartDate.Value
        Dim endDate As Date = labelEndDate.Value
        Dim responsibility As String = TextBoxResponsibility.Text.ToString

        ' Set value based on radio button selected
        If radioJobTypeF.Checked = True Then
            jobType = radioJobTypeF.Value.ToString
        ElseIf radioJobTypeI.Checked = True Then
            jobType = radioJobTypeI.Value.ToString
        End If

        Dim sqlConn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_Placement").ConnectionString)
        Dim sqlAdp As New SqlDataAdapter

        ' Run stored procedure sp_PLACEMENT_AddPlacement to add to DB and return PlacementID
        Dim sqlCmdAdd As New SqlCommand
        Dim returnValue As Integer

        sqlCmdAdd.Connection = sqlConn
        sqlCmdAdd.CommandText = "sp_PLACEMENTAPP_AddPlacement"
        sqlCmdAdd.CommandType = Data.CommandType.StoredProcedure

        sqlCmdAdd.Parameters.Add(New SqlParameter("@City", city))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@StateAbbrev", stateAbbrev))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@CompanyID", companyID))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@PositionTypeID", positionTypeID))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@PositionTitle", positionTitle))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@StudentID", studentID))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@JobType", jobType))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@StartDate", startDate))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@EndDate", endDate))
        sqlCmdAdd.Parameters.Add(New SqlParameter("@Responsibility", responsibility))
        sqlConn.Open()
        returnValue = sqlCmdAdd.ExecuteScalar()
        sqlConn.Close()


        ' If checkbox is checked, run stored procedure sp_PLACEMENT_AddSkills to add to DB
        Dim sqlCmdSkill As New SqlCommand

        sqlCmdSkill.Connection = sqlConn
        sqlCmdSkill.CommandText = "sp_PLACEMENTAPP_AddSkills"
        sqlCmdSkill.CommandType = Data.CommandType.StoredProcedure

        sqlConn.Open()
        For i = 0 To CheckBoxListSkillType1.Items.Count - 1
            If CheckBoxListSkillType1.Items(i).Selected Then
                sqlCmdSkill.Parameters.Add(New SqlParameter("@PlacementID", returnValue))
                sqlCmdSkill.Parameters.Add(New SqlParameter("@SkillID", CheckBoxListSkillType1.Items(i).Value))
                sqlCmdSkill.ExecuteNonQuery()
                sqlCmdSkill.Parameters.Clear()
            End If
        Next
        For i = 0 To CheckBoxListSkillType2.Items.Count - 1
            If CheckBoxListSkillType2.Items(i).Selected Then
                sqlCmdSkill.Parameters.Add(New SqlParameter("@PlacementID", returnValue))
                sqlCmdSkill.Parameters.Add(New SqlParameter("@SkillID", CheckBoxListSkillType2.Items(i).Value))
                sqlCmdSkill.ExecuteNonQuery()
                sqlCmdSkill.Parameters.Clear()
            End If
        Next
        For i = 0 To CheckBoxListSkillType3.Items.Count - 1
            If CheckBoxListSkillType3.Items(i).Selected Then
                sqlCmdSkill.Parameters.Add(New SqlParameter("@PlacementID", returnValue))
                sqlCmdSkill.Parameters.Add(New SqlParameter("@SkillID", CheckBoxListSkillType3.Items(i).Value))
                sqlCmdSkill.ExecuteNonQuery()
                sqlCmdSkill.Parameters.Clear()
            End If
        Next
        For i = 0 To CheckBoxListSkillType4.Items.Count - 1
            If CheckBoxListSkillType4.Items(i).Selected Then
                sqlCmdSkill.Parameters.Add(New SqlParameter("@PlacementID", returnValue))
                sqlCmdSkill.Parameters.Add(New SqlParameter("@SkillID", CheckBoxListSkillType4.Items(i).Value))
                sqlCmdSkill.ExecuteNonQuery()
                sqlCmdSkill.Parameters.Clear()
            End If
        Next
        sqlConn.Close()

        Response.Redirect("ViewPlacements.aspx")

    End Sub
End Class
