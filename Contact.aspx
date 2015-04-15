<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="contact_container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Contact</h1>
            </div>
        </div>
  
        <% If Not IsPostBack Then%>
            <p>Got a question for us? Just fill out the form below and we'll happily get to get back to you within 24-48 hours!</p>

            <!-- Contact Form -->
            <div class="row">
                <div class="col-md-8">
                    <div class="control-group form-group">
                        <label for="name"></label>
                        <div class="controls">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" id="name" runat="server" required="required" />
                            <p class="help-block"></p>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email Address:</label>
                            <input type="email" class="form-control" id="email" runat="server" required="required" data-validation-required-message="Please enter your email address." />
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Subject:</label>
                            <input type="tel" class="form-control" id="subject" runat="server" required="required" data-validation-required-message="Please enter your phone number." />
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Message:</label>
                            <textarea rows="10" cols="100" class="form-control" id="message" runat="server" required="required" data-validation-required-message="Please enter your message" maxlength="999" style="resize:none"></textarea>
                        </div>
                    </div>
                    <asp:Button ID="sendMail" class="btn btn-primary" runat="server" Text="Send Message" />
                </div>
            <% Else%>
                <div class="alert alert-success" role="alert"><asp:Label ID="confirmSent" runat="server" Text=""></asp:Label></div>
            <% End If%>
        </div>
        <!-- /.row -->
    </div> <!-- End contact_container div -->
</asp:Content>

