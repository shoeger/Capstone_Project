
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
End Class
