
Partial Class Login_Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Login1.Focus()

    End Sub

    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles Login1.LoggedIn
        Response.Redirect("~/Default.aspx")
    End Sub

End Class
