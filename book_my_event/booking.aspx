<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="booking.aspx.cs" Inherits="booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card text-white bg-dark mb-3 animate__animated animate__zoomIn">
                    <div class="card-header">
                        <i class="fas fa-check-circle"></i> Success
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Payment Successful!</h4>
                        <p class="card-text">Thank you for your payment. Your booking details are as follows:</p>
                        <hr class="bg-white">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        setTimeout(function () {
            window.location.href = 'myevents.aspx';  // Redirect to the next page after 3 seconds
        }, 3000);
    </script>
</asp:Content>
