'Add these two imports so you have access to the mail features.
Imports System.Net.Mail
Imports System.Net

Partial Class Contact
    Inherits System.Web.UI.Page

    Protected Sub sendMail_Click(sender As Object, e As EventArgs) Handles sendMail.Click
        'Declare variables to create a new mail message and client connection.
        Dim msg As New MailMessage
        Dim client As New SmtpClient

        Dim sendersName As String
        Dim sendersEmail As String
        Dim sendersSubject As String
        Dim sendersMessage As String

        sendersName = senderName.Text.ToString() 'capture the senders name from the textbox
        sendersEmail = senderAddress.Text.ToString() 'capture the senders email from the textbox
        sendersSubject = senderSubject.Text.ToString() 'capture the senders subject from the textbox
        sendersMessage = senderMessage.Text.ToString().Replace(Environment.NewLine, "<br />")   ' get the text from the message textbox keep text box formatting by replacing new lines (returns) with <br/>


        msg.To.Add("scott-thompson@uiowa.edu")  'destination email address
        msg.From = New MailAddress("ui.6k183@gmail.com")  'account used to send the email.
        msg.ReplyToList.Add(sendersEmail) 'set the senders email address as the "reply to" for easy of sending a response
        msg.Subject = sendersSubject  'set the message subject line
        msg.Body = sendersMessage  'add the message body
        msg.IsBodyHtml = True


        client.Host = "smtp.gmail.com"  'place your smtp server inside quotation marks - gmail is smtp.gmail.com
        client.Port = 587  'place your smtp port here - gmail is 587
        client.Credentials = New NetworkCredential("ui.6k183", "6k183U*I")  'enter you username and password for gmail
        client.EnableSsl = True  'gmail uses ssl
        client.Send(msg)  'send you msg (variable from above)

        'Clear out the textboxes after the message is sent.
        'If not, it does not appear to send and the user will click "send" repeatedly, sending multiple messages.
        senderAddress.Text = ""
        senderMessage.Text = ""

        'Write into the label that the message has been sent.
        confirmSent.Text = "Thank you.  Your message has been sent."

        'After the message has displayed for 2 seconds, "reload" the page.
        Response.AddHeader("REFRESH", "2;URL=default.aspx")

    End Sub

End Class
