
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub login1_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles login1.Authenticate

        login1.Focus()

    End Sub

    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles login1.LoggedIn

    End Sub
End Class
