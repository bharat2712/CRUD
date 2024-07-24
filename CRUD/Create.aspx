<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="CRUD.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="create" runat="server" class="container mt-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <h2>User Registration Form</h2>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <asp:Label ID="lbfirstName" runat="server" Text="First Name"=></asp:Label>
                    <asp:TextBox ID="txtfirstName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="txtlastName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbemail" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revRemail" runat="server"
                        ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Please Enter Valid Email Address" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbContact" runat="server" Text="Contact Number"></asp:Label>
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="txtContactNumber"
                        ValidationExpression="^\d{10}$" ErrorMessage="Please Enter Valid Contact Number" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbFax" runat="server" Text="Fax"></asp:Label>
                    <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revFax" ControlToValidate="txtFax" ValidationExpression="^\d{10}$"
                        runat="server" ErrorMessage="Please Enter Valid Fax Number" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbState" runat="server" Text="State"></asp:Label>
                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbUserType" runat="server" Text="User Type"></asp:Label>
                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlUserType_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbProfessionalBackground" runat="server" Text="Professional Background"></asp:Label>
                    <asp:TextBox ID="txtProfessionalBackground" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbEducationCompleted" runat="server" Text="Education"></asp:Label>
                    <asp:CheckBoxList ID="cblEducationCompleted" runat="server">
                        <asp:ListItem Text="10th" Value="10th"></asp:ListItem>
                        <asp:ListItem Text="12th" Value="12th"></asp:ListItem>
                        <asp:ListItem Text="Graduation" Value="Graduation"></asp:ListItem>
                        <asp:ListItem Text="Post Graduation" Value="Post Graduation"></asp:ListItem>
                    </asp:CheckBoxList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbMembership" runat="server" Text="Take Membership"></asp:Label>
                    <asp:RadioButtonList ID="rbMembership" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="rbMembershipIndexChange">
                        <asp:ListItem Text="Yes" Value="Yes" />
                        <asp:ListItem Text="No" Value="No" />
                    </asp:RadioButtonList>
                </div>

                <div class="form-group">
                    <asp:Label ID="lbMembershipDuration" runat="server" Text="Membership Duration"></asp:Label>
                    <asp:TextBox ID="txtMembershipDuration" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
