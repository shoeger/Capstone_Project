Imports System.Data.SqlClient

Partial Class AddPositions_Company
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
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlConn
        sqlCmd.CommandText = "sp_PLACEMENTAPP_AddPlacement"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@City", city))
        sqlCmd.Parameters.Add(New SqlParameter("@StateAbbrev", stateAbbrev))
        sqlCmd.Parameters.Add(New SqlParameter("@CompanyID", companyID))
        sqlCmd.Parameters.Add(New SqlParameter("@PositionTypeID", positionTypeID))
        sqlCmd.Parameters.Add(New SqlParameter("@PositionTitle", positionTitle))
        sqlCmd.Parameters.Add(New SqlParameter("@StudentID", studentID))
        sqlCmd.Parameters.Add(New SqlParameter("@JobType", jobType))
        sqlCmd.Parameters.Add(New SqlParameter("@StartDate", startDate))
        sqlCmd.Parameters.Add(New SqlParameter("@EndDate", endDate))
        sqlCmd.Parameters.Add(New SqlParameter("@Responsibility", responsibility))
        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        Response.Redirect("ViewPlacements.aspx")

    End Sub
End Class
