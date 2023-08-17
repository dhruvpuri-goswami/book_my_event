<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="myevents.aspx.cs" Inherits="myevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
        <h2 class="text-light animate__animated animate__slideInRight">Your Events</h2><br />
        <asp:Repeater ID="rptFeaturedEvents" runat="server" OnItemDataBound="rptFeaturedEvents_ItemDataBound">
            <ItemTemplate>
                <div class="card mb-3 bg-dark animate__animated animate__zoomIn">
                    <div class="row no-gutters">
                        <div class="col-md-4 img-container">
                            <asp:Image ID="imgEvent" runat="server" CssClass="card-img event-image" />
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title text-primary">
                                    <i class="fas fa-calendar-alt"></i> <%# Eval("event_name") %>
                                </h5>
                                <p><strong class="text-success"><i class="fas fa-user"></i> Organizer:</strong> <%# Eval("organizer") %></p>
                                <p><strong class="text-warning"><i class="fas fa-map-marker-alt"></i> Address:</strong> <%# Eval("address") %></p>
                                <p><strong class="text-info"><i class="fas fa-dollar-sign"></i> Price:</strong> <%# Eval("price") %> USD</p>
                                <p><strong class="text-danger"><i class="fas fa-users"></i> Capacity:</strong> <%# Eval("capacity") %> people</p>
                                <p class="card-text text-muted"><%# Eval("description") %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <style>
        .img-container {
            overflow: hidden;
            position: relative;
            height: 300px; /* Adjust this value as needed */
        }

        .event-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
        }

        .card {
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .card-body {
            background: rgba(0, 0, 0, 0.1);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
</asp:Content>
