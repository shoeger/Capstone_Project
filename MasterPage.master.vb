
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        copyYear.Text = Date.Now.Year

    End Sub

End Class

