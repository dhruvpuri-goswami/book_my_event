<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card mt-4">
                    <div class="card-header">
                        <h3 class="mb-0"><i class="fas fa-users"></i> User Management</h3>
                    </div>
                    <div class="card-body">
                       <form id="form1" runat="server">
                        <asp:GridView ID="GridView1" CssClass="table table-bordered table-hover table-responsive-md" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger btn-sm" DeleteText="Remove" />
                            </Columns>
                            <HeaderStyle CssClass="thead-dark" />
                        </asp:GridView>
                           </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:event_booking %>" SelectCommand="SELECT [id], [username], [email] FROM [tbl_user]"></asp:SqlDataSource>
</asp:Content>
