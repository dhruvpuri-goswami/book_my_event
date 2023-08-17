using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class myevents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in.
        if (Session["UserID"] == null)
        {
            Response.Redirect("login.aspx");
        }

        // Load user-specific events if the page is loaded for the first time.
        if (!IsPostBack)
        {
            LoadUserEvents();
        }
    }

    // Fetch and display events specific to the logged-in user.
    private void LoadUserEvents()
    {
        // Establish connection to the database.
        string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // SQL query to fetch events booked by the logged-in user.
            string query = @"
                SELECT e.* FROM tbl_events e
                INNER JOIN tbl_booking b ON e.id = b.event_id
                WHERE b.user_id = @UserID";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Add user ID parameter from the session.
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                // Execute the query and bind the result to the repeater control.
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptFeaturedEvents.DataSource = dt;
                rptFeaturedEvents.DataBind();
            }
        }
    }

    // Process and display each event in the repeater control.
    protected void rptFeaturedEvents_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Convert image data to Base64 for display.
            DataRowView rowView = (DataRowView)e.Item.DataItem;
            byte[] imageData = (byte[])rowView["image"];
            string imageBase64 = Convert.ToBase64String(imageData);
            string imageSrc = string.Format("data:image/jpeg;base64,{0}", imageBase64);


            // Set the image source for the event.
            Image imgEvent = (Image)e.Item.FindControl("imgEvent");
            if (imgEvent != null)
            {
                imgEvent.ImageUrl = imageSrc;
            }
        }
    }
}
