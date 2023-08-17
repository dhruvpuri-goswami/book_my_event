// Name: Disha Darji
// ID: 8849133

using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class booking : System.Web.UI.Page
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
            // Check if eventid is present in the query string
            if (Request.QueryString["eventid"] != null)
            {
                string eventId = Request.QueryString["eventid"];
                int userId = Convert.ToInt32(Session["UserID"]);
                DateTime bookingDate = DateTime.Now;

                // Call method to insert booking record
                InsertBookingRecord(eventId, userId, bookingDate);
            }
        }
    }

    // Method to insert booking record into the database
    private void InsertBookingRecord(string eventId, int userId, DateTime bookingDate)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            string query = "INSERT INTO tbl_booking (event_id, user_id, date) VALUES (@EventId, @UserId, @BookingDate)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@EventId", eventId); // Use @EventId here
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@BookingDate", bookingDate);
                cmd.ExecuteNonQuery();

                // Display a thank you message using JavaScript
                string script = "alert('Thanks for Booking!');";
                ClientScript.RegisterStartupScript(this.GetType(), "Thanks", script, true);
            }
        }
    }
}
