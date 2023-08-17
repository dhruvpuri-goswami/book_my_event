<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Book My Event</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        .feature-icon {
            color: #007BFF;
            margin-bottom: 15px;
        }
        .jumbotron {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('banner.jpg');
            background-size: cover;
            color: white;
            text-shadow: 1px 1px 2px black;
        }

        footer {
            background-color: #343a40;
        }
    </style>
</head>
<body>

<!-- Navbar/Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Book My Event</a>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.aspx">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.aspx">Login</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<div class="jumbotron jumbotron-fluid text-center">
    <div class="container">
        <h1 class="display-4 ">Welcome to Book My Event</h1>
        <p class="lead">Your one-stop solution for all event bookings!</p>
        <a href="register.aspx" class="btn btn-info  btn-lg">Get Started</a>
    </div>
</div>

<!-- Featured Events Section -->
<div class="container mt-5">
    <h2 class="animate_animated animate_slideInRight">Featured Events</h2>
    <asp:Repeater ID="rptFeaturedEvents" runat="server" OnItemDataBound="rptFeaturedEvents_ItemDataBound">
        <ItemTemplate>
            <div class="card mb-3 animate_animated animate_zoomIn">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <asp:Image ID="imgEvent" runat="server" CssClass="card-img" />
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("event_name") %></h5>
                            <p><strong>Organizer:</strong> <%# Eval("organizer") %></p>
                            <p><strong>Address:</strong> <%# Eval("address") %></p>
                            <p><strong>Price:</strong> <%# Eval("price") %> USD</p>
                            <p><strong>Capacity:</strong> <%# Eval("capacity") %> people</p>
                            <p class="card-text"><%# Eval("description") %></p>
                            <a href="booking.aspx?ename=<%# Eval("id") %>" class="btn btn-dark">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

<!-- Features Section -->
<div class="container mt-5 pb-5">
    <div class="row">
        <div class="col-md-4 text-center animate_animated animate_flipInX">
            <i class="fas fa-calendar-alt fa-3x mb-3"></i>
            <h4>Wide Range of Events</h4>
            <p>From concerts to workshops, we've got it all.</p>
        </div>
        <div class="col-md-4 text-center animate_animated animate_flipInX">
            <i class="fas fa-ticket-alt fa-3x mb-3"></i>
            <h4>Easy Booking</h4>
            <p>Seamless booking process with instant confirmation.</p>
        </div>
        <div class="col-md-4 text-center animate_animated animate_flipInX">
            <i class="fas fa-star fa-3x mb-3"></i>
            <h4>Top Rated</h4>
            <p>Trusted by thousands for events and bookings.</p>
        </div>
    </div>
</div>

<!-- Call to Action at the bottom -->
<div class="bg-light py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h3>Ready to explore the best events?</h3>
                <p>Join our community and discover amazing events near you.</p>
            </div>
            <div class="col-md-4">
                <a href="Register.aspx" class="btn btn-dark btn-block btn-lg">Join Now</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="mt-5 py-4 bg-dark text-white">
    <div class="container text-center">
        <p>&copy; 2023 Book My Event. All rights reserved.</p>
        <small><a href="#" class="text-white-50">Privacy Policy</a> | <a href="#" class="text-white-50">Terms of Service</a></small>
    </div>
</footer>

</body>
</html>
