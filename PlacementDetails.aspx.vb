
Partial Class PlacementDetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound

        Dim PositionTypeNameLabel As Label = CType(FormView1.FindControl("PositionTypeNameLabel"), Label)

        If PositionTypeNameLabel.Text = "I" Then
            PositionTypeNameLabel.Text = Convert.ToString("Internship")
        ElseIf PositionTypeNameLabel.Text = "F" Then
            PositionTypeNameLabel.Text = Convert.ToString("Full-time")
        End If

    End Sub

End Class
