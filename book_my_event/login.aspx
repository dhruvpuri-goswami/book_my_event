<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Book My Event</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mt-5 mb-4 animate_animated animate_fadeInDown">Book My Event</h2>
            <div class="card mt-2 animate_animated animate_fadeIn">
                <div class="card-header">
                    <h3 class="mb-0"><i class="fas fa-user"></i> Login</h3>
                </div>
                <form method="post" runat="server">
                     <div class="card-body">
                    <asp:Panel runat="server" DefaultButton="btnLogin">
                        <div class="form-group">
                    <label for="txtUsername"><i class="fas fa-envelope"></i> Username </label>
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="Enter username"></asp:TextBox>
     
                        </div>

                        <!-- Password Field -->
                        <div class="form-group">
                            <label for="txtPassword"><i class="fas fa-lock"></i> Password</label>
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter password"></asp:TextBox>
                       
                        </div>

                        <!-- Remember Me Checkbox -->
                        <div class="form-group form-check">
                            <asp:CheckBox ID="chkRememberMe" CssClass="form-check-input" runat="server" />
                            <asp:Label AssociatedControlID="chkRememberMe" CssClass="form-check-label" runat="server">Remember me</asp:Label>
                        </div>

                        <!-- Login Button -->
                        <asp:Button ID="btnLogin" CssClass="btn btn-dark btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />

                        <!-- Forgot Password Link>
                        <div class="mt-3 text-center">
                            <asp:HyperLink NavigateUrl="#" runat="server">Forgot Password?</asp:HyperLink>
                        </div -->
                    </asp:Panel>
                </div>
                </form>

                <div class="card-footer text-center">
                    New here? <asp:HyperLink NavigateUrl="register.aspx" runat="server">Register now</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>