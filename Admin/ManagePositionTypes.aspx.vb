
Partial Class ManagePositionTypes
    Inherits System.Web.UI.Page

    Protected Sub FormViewAddPositionType_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormViewAddPositionType.ItemDeleted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewAddPositionType_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormViewAddPositionType.ItemInserted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewAddPositionType_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormViewAddPositionType.ItemUpdated
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

End Class
