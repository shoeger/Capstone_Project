
Partial Class Admin_ManagePlacements
    Inherits System.Web.UI.Page

    Protected Sub GridViewPlacements_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridViewPlacements.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim myVal As String = e.Row.Cells(2).Text
            If myVal = "I" Then
                e.Row.Cells(2).Text = "Internship"
            ElseIf myVal = "F" Then
                e.Row.Cells(2).Text = "Full-time"
            End If
        End If
    End Sub


    Protected Sub buttonSearch_Click(sender As Object, e As EventArgs) Handles buttonSearch.Click

        Dim searchWord As String
        Dim userInput As String

        ' Retrieve user input and convert format readable by database for searching job type
        If textboxSearch.Text.ToLower.ToString() = "intern" Or textboxSearch.Text.ToLower.ToString() = "internship" Then
            userInput = "I"
        ElseIf textboxSearch.Text.ToLower.ToString() = "fulltime" Or textboxSearch.Text.ToLower.ToString() = "full-time" Or textboxSearch.Text.ToLower.ToString() = "full time" Or textboxSearch.Text.ToLower.ToString() = "full" Then
            userInput = "F"
        Else
            userInput = "No Result"
        End If

        searchWord = "SELECT p.PlacementID, c.Name, pt.PositionTypeName, p.City, p.StateAbbrev, p.JobType FROM PLACEMENT AS p INNER JOIN COMPANY AS c ON p.CompanyID = c.CompanyID INNER JOIN POSITION_TYPE AS pt ON p.PositionTypeID = pt.PositionTypeID where (Name Like '%" + textboxSearch.Text.ToString() + "%') or (PositionTypeName Like '%" + textboxSearch.Text.ToString() + "%') or (JobType Like '%" + userInput + "%') or (City Like '%" + textboxSearch.Text.ToString() + "%') or (StateAbbrev Like '%" + textboxSearch.Text.ToString() + "%')"

        SqlDataSource_Placements.SelectCommand = searchWord

    End Sub

End Class
