<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CRUD.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
    <form id="formListPage" runat="server">
        <div class="container mt-5">
            <h2>User List</h2>
            <div class="table-responsive">
                <asp:GridView ID="gvUsers" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" OnRowCommand="gvUsers_RowCommand" OnRowDeleting="gvUsers_RowDeleting" DataKeyNames="UserID">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                        <asp:BoundField DataField="Fax" HeaderText="Fax" />
                        <asp:BoundField DataField="StateName" HeaderText="State" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" />
                        <asp:TemplateField HeaderText="Membership">
                            <ItemTemplate>
                                <asp:Label ID="lblMembership" runat="server" Text='<%# Eval("Membership") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkView" runat="server" CommandName="View" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-info btn-sm" Text="View" />
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-primary btn-sm" Text="Edit" />
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-danger btn-sm" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies (if needed) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-Gp4r499zVJHV1f/Wu4qYbM4S6VcXvc7FpDzZFA1A9fQvqvuFF2uEx3A9PvFP8Vfk" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-wDcHM6vlk5N+2K9qljcu8hFpU4YfL2itf3fV+sFpzTCtcWR+i1Kf8f+1TKOzI8J3" crossorigin="anonymous"></script>
</body>
</html>
