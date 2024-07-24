<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="CRUD.ViewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="formViewUser" runat="server" class="container mt-5">
        <div class="card">
            <h2 class="card-header">User Details</h2>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">First Name:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblFirstNameValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Last Name:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblLastNameValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Email Address:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblEmailAddressValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Contact Number:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblContactNumberValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fax:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblFaxValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">State:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblStateValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">User Type:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblUserTypeValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Profession Background:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblProfessionBackgroundValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Education Completed:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblEducationCompletedValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Membership:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblMembershipValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Membership Duration:</label>
                            <div class="col-sm-8">
                                <asp:Label ID="lblMembershipDurationValue" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-12 text-center">
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" CssClass="btn btn-secondary" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Include Bootstrap JS (Optional, if needed) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
