
Partial Class ManageSkills
    Inherits System.Web.UI.Page

    Protected Sub FormViewSkillType_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormViewSkillType.ItemDeleted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewSkillType_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormViewSkillType.ItemInserted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewSkillType_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormViewSkillType.ItemUpdated
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewSkill_ItemDeleted(sender As Object, e As FormViewDeletedEventArgs) Handles FormViewSkill.ItemDeleted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewSkill_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles FormViewSkill.ItemInserted
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub

    Protected Sub FormViewSkill_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles FormViewSkill.ItemUpdated
        'Redirect to same page
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
    End Sub
End Class
