// Name: Disha Darji
// ID: 8849133

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in as an admin, otherwise redirect to login page
        if (Session["AdminUserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void GenreGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int Id;
        if (!int.TryParse(((TextBox)(row.Cells[1].Controls[0])).Text, out Id))
        {
            return;
        }
        string eventName = ((TextBox)(row.Cells[2].Controls[0])).Text;
        string organizer = ((TextBox)(row.Cells[3].Controls[0])).Text;
        string address = ((TextBox)(row.Cells[4].Controls[0])).Text;
        string price = ((TextBox)(row.Cells[5].Controls[0])).Text;
        string capacity = ((TextBox)(row.Cells[6].Controls[0])).Text;
        string Description = ((TextBox)(row.Cells[7].Controls[0])).Text;

        // Update parameters for SqlDataSource
        SqlDataSource1.UpdateParameters["id"].DefaultValue = Id.ToString();
        SqlDataSource1.UpdateParameters["event_name"].DefaultValue = eventName;
        SqlDataSource1.UpdateParameters["organizer"].DefaultValue = organizer;
        SqlDataSource1.UpdateParameters["address"].DefaultValue = address;
        SqlDataSource1.UpdateParameters["price"].DefaultValue = price;
        SqlDataSource1.UpdateParameters["capacity"].DefaultValue = capacity;
        SqlDataSource1.UpdateParameters["Description"].DefaultValue = Description;

        // Perform the update
        SqlDataSource1.Update();

        GridView1.EditIndex = -1;
    }

    // Gridview cancel edit
    protected void GenreGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
    }

    // Gridview row delete
    protected void GenreGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            Response.Write("An error occurred while deleting the row. Error message: " + e.Exception.Message);
        }
    }

    // Gridview row edit
    protected void GenreGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
    }
}
