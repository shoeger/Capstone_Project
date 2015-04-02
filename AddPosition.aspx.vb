
Partial Class AddPositions_Company
    Inherits System.Web.UI.Page

    Protected Sub FormView1_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        Response.Redirect("AddPositions_Company.aspx")
    End Sub


    Protected Sub FormView1_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Response.Redirect("AddPositions_Company.aspx")
    End Sub

End Class
