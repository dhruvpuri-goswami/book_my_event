<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="managing.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    /* Add these styles to your <style> section */
.btn {
    margin: 2px 0; /* Add a small margin on top and bottom of each button */
}

/* If you want to set a specific width for the columns containing the buttons */
.command-column {
    width: 80px; /* Adjust as needed */
}

</style>
    <form id="form2" runat="server">
        <h2 class="mb-4">Manage Events</h2>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-responsive-md" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDeleted="GenreGridView_RowDeleted" OnRowEditing="GenreGridView_RowEditing" OnRowUpdating="GenreGridView_RowUpdating" OnRowCancelingEdit="GenreGridView_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                <asp:BoundField DataField="event_name" HeaderText="event_name" SortExpression="event_name" />
                <asp:BoundField DataField="organizer" HeaderText="organizer" SortExpression="organizer" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="capacity" HeaderText="capacity" SortExpression="capacity" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary btn-sm command-column" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger btn-sm command-column" />

            </Columns>
            <HeaderStyle CssClass="thead-dark" />
        </asp:GridView>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:event_booking %>" SelectCommand="SELECT [id], [event_name], [organizer], [address], [price], [capacity], [Description], [date] FROM [tbl_events]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tbl_events] WHERE [id] = @original_id AND [event_name] = @original_event_name AND [organizer] = @original_organizer AND [address] = @original_address AND [price] = @original_price AND [capacity] = @original_capacity AND [Description] = @original_Description AND [date] = @original_date" InsertCommand="INSERT INTO [tbl_events] ([event_name], [organizer], [address], [price], [capacity], [Description], [date]) VALUES (@event_name, @organizer, @address, @price, @capacity, @Description, @date)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tbl_events] SET [event_name] = @event_name, [organizer] = @organizer, [address] = @address, [price] = @price, [capacity] = @capacity, [Description] = @Description, [date] = @date WHERE [id] = @original_id AND [event_name] = @original_event_name AND [organizer] = @original_organizer AND [address] = @original_address AND [price] = @original_price AND [capacity] = @original_capacity AND [Description] = @original_Description AND [date] = @original_date">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_event_name" Type="String" />
            <asp:Parameter Name="original_organizer" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_price" Type="Int32" />
            <asp:Parameter Name="original_capacity" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_date" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="event_name" Type="String" />
            <asp:Parameter Name="organizer" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="capacity" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name=    "date" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="event_name" Type="String" />
            <asp:Parameter Name="organizer" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="capacity" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="date" Type="DateTime" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_event_name" Type="String" />
            <asp:Parameter Name="original_organizer" Type="String" />
            <asp:Parameter Name="original_address" Type="String" />
            <asp:Parameter Name="original_price" Type="Int32" />
            <asp:Parameter Name="original_capacity" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_date" Type="DateTime" />
        </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>



