// Name: Disha Darji
// ID: 8849133

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in, otherwise redirect to login page
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            LoadFeaturedEvents();
        }
    }

    // Load events from the database and bind them to the repeater
    private void LoadFeaturedEvents()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            string query = "SELECT * FROM tbl_events";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptFeaturedEvents.DataSource = dt;
                rptFeaturedEvents.DataBind();
            }
        }
    }

    // ItemDataBound event handler for the repeater
    protected void rptFeaturedEvents_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;
            byte[] imageData = (byte[])rowView["image"];

            // Convert image data to base64 for display
            string imageBase64 = Convert.ToBase64String(imageData);
            string imageSrc = $"data:image/jpeg;base64,{imageBase64}";

            // Display event image using Image control
            Image imgEvent = (Image)e.Item.FindControl("imgEvent");
            if (imgEvent != null)
            {
                imgEvent.ImageUrl = imageSrc;
            }

            // Attach click event handler to the "Book Now" button
            Button btnBookNow = (Button)e.Item.FindControl("btnBookNow");
            if (btnBookNow != null)
            {
                btnBookNow.Click += BtnBookNow_Click;
            }
        }
    }

    // Click event handler for the "Book Now" button
    private void BtnBookNow_Click(object sender, EventArgs e)
    {
        // Retrieve event ID from the clicked button's container
        Button btnBookNow = (Button)sender;
        RepeaterItem item = (RepeaterItem)btnBookNow.NamingContainer;
        if (item != null)
        {
            DataRowView rowView = (DataRowView)item.DataItem;
            string eventId = rowView["event_id"].ToString(); // Assuming you have an "event_id" column in the table

            // Redirect to payment page with event information
            Response.Redirect($"payment.aspx?ename={eventId}");
        }
    }
}
