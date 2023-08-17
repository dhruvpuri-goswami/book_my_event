<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container animate__animated animate__fadeIn">
        <div class="card border-primary mb-3">
            <div class="card-header bg-dark text-white">
                <h3><i class="fas fa-credit-card"></i> Payment Details</h3>
            </div>
            <div class="card-body text-dark">
                <form id="paymentForm" runat="server">

                    <!-- Event Price -->
                    <div class="form-group">
                        <label for="eventPrice"><i class="fas fa-tag text-primary"></i> Event Price:</label>
                        <asp:Label ID="lblEventPrice" CssClass="form-control" runat="server"></asp:Label>
                    </div>

                    <!-- Additional Charges -->
                    <div class="form-group">
                        <label for="additionalCharges"><i class="fas fa-hand-holding-usd text-success"></i> Additional Charges (Tax & Fees):</label>
                        <asp:Label ID="lblAdditionalCharges" CssClass="form-control" runat="server"></asp:Label>
                    </div>

                    <!-- Total Amount -->
                    <div class="form-group">
                        <label for="totalAmount"><i class="fas fa-coins text-warning"></i> Total Amount:</label>
                        <asp:Label ID="lblTotalAmount" CssClass="form-control bg-light font-weight-bold" runat="server"></asp:Label>
                    </div>

                    <!-- Credit Card Information -->
                    <div class="form-group">
                        <label for="creditCard"><i class="fas fa-credit-card text-info"></i> Credit Card Number:</label>
                        <asp:TextBox ID="txtCreditCard" CssClass="form-control" runat="server" placeholder="1234 5678 9101 1121" required="true" MaxLength="16"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="expiryDate"><i class="fas fa-calendar-alt text-secondary"></i> Expiry Date:</label>
                        <asp:TextBox ID="txtExpiryDate" CssClass="form-control" runat="server" placeholder="MM/YY" required="true" MaxLength="5"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="cvv"><i class="fas fa-lock text-danger"></i> CVV:</label>
                        <asp:TextBox ID="txtCVV" CssClass="form-control" runat="server" placeholder="123" required="true" MaxLength="3"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnSubmitPayment" CssClass="btn btn-dark btn-lg btn-block" runat="server" Text="Submit Payment" OnClick="BtnSubmitPayment_Click" />

                </form>
            </div>
        </div>
    </div>
</asp:Content>
