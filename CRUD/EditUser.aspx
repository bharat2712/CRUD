<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="YourNamespace.EditUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Optional: Custom styles specific to your application */
        .form-group {
            margin-bottom: 1rem;
        }
        .radio-group {
            margin-top: 1rem;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <form id="formEditUser" runat="server" class="container mt-5"><h2>Edit User</h2>
        <div class="row">
            
            <div class="col-md-6">
                
                <div class="form-group">
                    <asp:HiddenField ID="hfUserID" runat="server" />
                    <label for="txtFirstName">First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="txtEmailAddress">Email Address:</label>
                    <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="txtContactNumber">Contact Number:</label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="txtFax">Fax:</label>
                    <asp:TextBox ID="txtFax" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ddlState">State:</label>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlUserType">User Type:</label>
                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="txtProfessionBackground">Profession Background:</label>
                    <asp:TextBox ID="txtProfessionBackground" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label>Education Completed:</label><br />
                    <asp:CheckBoxList ID="cblEducationCompleted" runat="server" CssClass="form-check">
                        <asp:ListItem Text="10th" Value="10th" />
                        <asp:ListItem Text="12th" Value="12th" />
                        <asp:ListItem Text="Graduation" Value="Graduation" />
                        <asp:ListItem Text="Post Graduation" Value="Post Graduation" />
                    </asp:CheckBoxList>
                </div>
                <div class="radio-group">
                    <label>Take Membership:</label><br />
                    <asp:RadioButtonList ID="rbMembership" runat="server" CssClass="form-check">
                        <asp:ListItem Text="Yes" Value="Yes" />
                        <asp:ListItem Text="No" Value="No" />
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <label for="txtMembershipDuration">Membership Duration:</label>
                    <asp:TextBox ID="txtMembershipDuration" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary ml-2" />
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
