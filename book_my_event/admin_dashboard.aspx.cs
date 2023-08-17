// Name: Disha Darji
// ID: 8849133

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in as an admin, otherwise redirect to login page
        if (Session["AdminUserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Queries to fetch various statistics
                string queryTotalEvents = "SELECT COUNT(*) FROM tbl_events";
                string queryTotalUsers = "SELECT COUNT(*) FROM tbl_user";
                string queryRecentBookings = "SELECT TOP 1 date FROM tbl_booking ORDER BY date DESC";
                string queryTotalRevenue = "SELECT SUM(price) FROM tbl_events";

                using (SqlCommand cmdTotalEvents = new SqlCommand(queryTotalEvents, con))
                using (SqlCommand cmdTotalUsers = new SqlCommand(queryTotalUsers, con))
                using (SqlCommand cmdRecentBookings = new SqlCommand(queryRecentBookings, con))
                using (SqlCommand cmdTotalRevenue = new SqlCommand(queryTotalRevenue, con))
                {
                    // Execute queries and fetch statistics
                    int Events = (int)cmdTotalEvents.ExecuteScalar();
                    int Users = (int)cmdTotalUsers.ExecuteScalar();
                    DateTime? recentBookingDate = cmdRecentBookings.ExecuteScalar() as DateTime?;
                    decimal? Revenue = cmdTotalRevenue.ExecuteScalar() as decimal?;

                    // Populate the dashboard with fetched data
                    totalEvents.Text = Events.ToString();
                    totalUsers.Text = Users.ToString();
                    recentBookings.Text = recentBookingDate.HasValue ? recentBookingDate.Value.ToShortDateString() : "No recent bookings";
                    totalRevenue.Text = Revenue.HasValue ? Revenue.Value.ToString("C") : "N/A";
                }
            }
        }
    }
}
