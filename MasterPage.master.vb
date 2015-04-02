
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub ButtonLogIn_Click(sender As Object, e As EventArgs) Handles ButtonLogIn.Click

        Response.Redirect("LogIn.aspx")

    End Sub



End Class

