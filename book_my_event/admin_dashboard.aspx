<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="admin_dashboard.aspx.cs" Inherits="admin_dashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- Styles for the dashboard cards -->
<style>
    .dashboard-card {
        transition: transform .2s;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .dashboard-card:hover {
        transform: translateY(-5px);
    }
    .card-header {
        font-weight: 600;
    }
    .card-title {
        font-size: 24px;
        font-weight: 500;
    }
</style>

<div class="row">
    <!-- Total Events -->
    <div class="col-lg-3 col-md-6 mb-4">
        <div class="card text-white bg-primary mb-3 dashboard-card">
            <div class="card-header"><i class="fas fa-calendar-alt"></i> Total Events</div>
            <div class="card-body">
                <h5 class="card-title">
                    <asp:Label runat="server" ID="totalEvents"></asp:Label>
                </h5>
            </div>
        </div>
    </div>
    
    <!-- Total Users -->
    <div class="col-lg-3 col-md-6 mb-4">
        <div class="card text-white bg-success mb-3 dashboard-card">
            <div class="card-header"><i class="fas fa-users"></i> Total Users</div>
            <div class="card-body">
                <h5 class="card-title"><asp:Label runat="server" ID="totalUsers"></asp:Label></h5>
            </div>
        </div>
    </div>

    <!-- Recent Bookings -->
    <div class="col-lg-3 col-md-6 mb-4">
        <div class="card text-white bg-warning mb-3 dashboard-card">
            <div class="card-header"><i class="fas fa-ticket-alt"></i> Recent Bookings</div>
            <div class="card-body">
                <h5 class="card-title"><asp:Label runat="server" ID="recentBookings"></asp:Label></h5>
            </div>
        </div>
    </div>

    <!-- Total Revenue -->
    <div class="col-lg-3 col-md-6 mb-4">
        <div class="card text-white bg-danger mb-3 dashboard-card">
            <div class="card-header"><i class="fas fa-dollar-sign"></i> Total Revenue</div>
            <div class="card-body">
                <h5 class="card-title"><asp:Label runat="server" ID="totalRevenue"></asp:Label></h5>
            </div>
        </div>
    </div>
</div>


</asp:Content>
