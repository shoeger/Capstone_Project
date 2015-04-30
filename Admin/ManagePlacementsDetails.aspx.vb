
Partial Class Admin_ManagePlacementsDetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound

        Dim jobTypeLabel As Label = FormView1.FindControl("JobTypeLabel")

        If jobTypeLabel.Text = "I" Then
            jobTypeLabel.Text = "Internship"
        ElseIf jobTypeLabel.Text = "F" Then
            jobTypeLabel.Text = "Full-time"
        End If
    End Sub

End Class
