<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Book My Event</title>
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
                    <h3 class="mb-0"><i class="fas fa-user-plus"></i> Register</h3>
                </div>
                <div class="card-body">
                    <form method="post" runat="server">
                        <!-- Full Name Field with RequiredFieldValidator -->
                        <div class="form-group">
                            <label for="txtFullName"><i class="fas fa-user"></i> Full Name</label>
                            <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" placeholder="Enter full name"></asp:TextBox>
                        </div>

                        <!-- Email Field with RequiredFieldValidator -->
                        <div class="form-group">
                            <label for="txtEmail"><i class="fas fa-envelope"></i> Email</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Enter email" TextMode="Email"></asp:TextBox>
                        </div>

                        <!-- Password Field with RequiredFieldValidator -->
                        <div class="form-group">
                            <label for="txtPassword"><i class="fas fa-lock"></i> Password</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                        </div>

                        <!-- Confirm Password Field with RequiredFieldValidator -->
                        <div class="form-group">
                            <label for="txtConfirmPassword"><i class="fas fa-lock"></i> Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Confirm password"></asp:TextBox>
                        </div>

                        <!-- Register Button -->
                        <asp:Button ID="btnRegister" CssClass="btn btn-dark btn-block" runat="server" Text="Register" OnClick="btnRegister_Click" />
                    </form>
                </div>
                <div class="card-footer text-center">
                    Already registered? <a href="login.aspx">Sign in now</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
