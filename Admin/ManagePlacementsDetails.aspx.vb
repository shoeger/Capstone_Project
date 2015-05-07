Imports System.Data.SqlClient

Partial Class Admin_ManagePlacementsDetails
    Inherits System.Web.UI.Page

    Protected Sub FormView1_DataBound(sender As Object, e As EventArgs) Handles FormView1.DataBound
        If FormView1.CurrentMode = FormViewMode.ReadOnly Then
            Dim jobTypeLabel As Label = FormView1.FindControl("JobTypeLabel")

            If jobTypeLabel.Text = "I" Then
                jobTypeLabel.Text = "Internship"
            ElseIf jobTypeLabel.Text = "F" Then
                jobTypeLabel.Text = "Full-time"
            End If
        End If
    End Sub

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Response.Redirect("~/Admin/ManagePlacements.aspx")
    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

End Class
