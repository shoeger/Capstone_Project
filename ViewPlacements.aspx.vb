
Partial Class ViewPlacements
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

    Protected Sub searchTextbox_TextChanged(sender As Object, e As EventArgs) Handles searchTextbox.TextChanged

        Dim searchword As String

        searchword = "SELECT p.PlacementID, c.Name, pt.PositionTypeName, p.City, p.StateAbbrev, p.JobType FROM PLACEMENT AS p INNER JOIN COMPANY AS c ON p.CompanyID = c.CompanyID INNER JOIN POSITION_TYPE AS pt ON p.PositionTypeID = pt.PositionTypeID where (JobType Like '%" + searchTextbox.Text.ToString() + "%')"

        SqlDataSource1.SelectCommand = searchword

    End Sub
End Class
