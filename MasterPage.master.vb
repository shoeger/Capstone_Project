
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Display current year to copyright label
        copyYear.Text = Date.Now.Year

        If Not Roles.IsUserInRole("admin") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "Manage Users" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Not Roles.IsUserInRole("admin") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "Manage Placements" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Not Roles.IsUserInRole("student") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "Add Placement" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Not Roles.IsUserInRole("student") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "My Account" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Roles.IsUserInRole("admin") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "Contact Us" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Roles.IsUserInRole("admin") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "About Us" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If

        If Roles.IsUserInRole("admin") Then
            Dim menuItems As MenuItemCollection = menu_Master.Items
            Dim adminItem As New MenuItem()
            For Each MenuItem As MenuItem In menuItems
                If MenuItem.Value = "Beers" Then
                    adminItem = MenuItem
                End If
            Next
            menuItems.Remove(adminItem)
        End If


    End Sub

    Protected Sub menu_Master_MenuItemClick(sender As Object, e As MenuEventArgs) Handles menu_Master.MenuItemClick

        Dim menuItems As MenuItemCollection = menu_Master.Items
        Dim adminItem As New MenuItem()

        'Handle the logout action
        For Each MenuItem In menuItems
            If MenuItem.Text = "Log Off" Then
                FormsAuthentication.SignOut()
                FormsAuthentication.RedirectToLoginPage()
            End If
        Next

    End Sub

    Protected Sub menu_Master_PreRender(sender As Object, e As EventArgs) Handles menu_Master.PreRender

        Dim menuItems As MenuItemCollection = menu_Master.Items

        If Not Request.IsAuthenticated Then
            'Find the Log Off menu item using LINQ (requires .NET 3.5)
            Dim logOffItem = From m In menuItems
                                Where m.Text = "Log Off"
                                Select m

            'If found
            For Each item In logOffItem
                    'Change the text according the the user login status
                    item.Text = "Login"
                    item.Value = "Login"
                    item.NavigateUrl = FormsAuthentication.LoginUrl
            Next
        End If
    End Sub
End Class

