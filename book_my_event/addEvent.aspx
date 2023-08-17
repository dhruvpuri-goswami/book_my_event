<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="addEvent.aspx.cs" Inherits="addEvent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg">
                    <div class="card-header bg-dark text-white">
                        <h3 class="mb-0"><i class="fas fa-calendar-plus"></i> Add Event</h3>
                    </div>
                    <form method="post" runat="server" enctype="multipart/form-data">
                        <div class="card-body">
                            <asp:Panel runat="server" DefaultButton="btnAdd">

                                <!-- Event Name Field -->
                                <div class="form-group">
                                    <label for="txtName"><i class="fas fa-calendar"></i> Event Name</label>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Enter Event Name"></asp:TextBox>
                                </div>

                                <!-- Organizer Name Field -->
                                <div class="form-group">
                                    <label for="txtOrganizer"><i class="fas fa-user-tie"></i> Organizer Name</label>
                                    <asp:TextBox ID="txtOrganizer" CssClass="form-control" runat="server" placeholder="Enter Organizer Name"></asp:TextBox>
                                </div>

                                <!-- Address Field -->
                                <div class="form-group">
                                    <label for="txtAddress"><i class="fas fa-map-marker-alt"></i> Address</label>
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Enter Address"></asp:TextBox>
                                </div>

                                <!-- Price Field -->
                                <div class="form-group">
                                    <label for="txtPrice"><i class="fas fa-dollar-sign"></i> Price</label>
                                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" placeholder="Enter Price"></asp:TextBox>
                                </div>

                                <!-- Capacity Field -->
                                <div class="form-group">
                                    <label for="txtCapa"><i class="fas fa-users"></i> Capacity</label>
                                    <asp:TextBox ID="txtCapa" CssClass="form-control" runat="server" placeholder="Enter Capacity"></asp:TextBox>
                                </div>

                                <!-- Image Upload Field -->
                                <div class="form-group">
                                    <label for="fileUpload"><i class="fas fa-image"></i> Image</label>
                                    <asp:FileUpload ID="fileUpload" CssClass="form-control-file" runat="server" />
                                </div>

                                <!-- Description Field -->
                                <div class="form-group">
                                    <label for="txtDesc"><i class="fas fa-info-circle"></i> Description</label>
                                    <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server" placeholder="Enter Description" TextMode="MultiLine"></asp:TextBox>
                                </div>

                                <!-- Date Field -->
                                <div class="form-group">
                                    <label for="txtDate"><i class="fas fa-calendar-alt"></i> Date</label>
                                    <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                                </div>

                                <!-- Add Button -->
                                <div class="form-group">
                                    <asp:Button ID="btnAdd" CssClass="btn btn-dark btn-block" runat="server" Text="Add" OnClick="BtnAdd_Click" />
                                </div>

                            </asp:Panel>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
