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

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // This method will run when the page is loaded
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string fullName = txtUsername.Text;
        string password = txtPassword.Text;

        // Check if the user is an admin
        if (fullName == "root" && password == "root")
        {
            Session["AdminUserID"] = "root";

            // Redirect to admin dashboard if it's an admin
            Response.Redirect("admin_dashboard.aspx");
        }
        else
        {
            // Get the connection string for the database from the configuration
            string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open(); // Open the connection to the database

                // Query to check if a user exists with the provided username and password
                string query = "SELECT COUNT(*) FROM tbl_user WHERE username = @UsernameOrEmail AND password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Additional query to get the user's ID based on the provided username and password
                    string query1 = "SELECT id FROM tbl_user WHERE username = @UsernameOrEmail AND password = @Password";
                    SqlCommand cmd2 = new SqlCommand(query1, con);
                    cmd2.Parameters.AddWithValue("@UsernameOrEmail", fullName);
                    cmd2.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@UsernameOrEmail", fullName);
                    cmd.Parameters.AddWithValue("@Password", password);

                    // Execute the command and get the count of users matching the credentials
                    int userCount = (int)cmd.ExecuteScalar();

                    // Execute the second command to get the user's ID
                    object userId = cmd2.ExecuteScalar();

                    if (userCount > 0)
                    {
                        // If a matching user is found, start a session for the user
                        Session["UserID"] = userId.ToString();

                        // Redirect the user to their dashboard
                        Response.Redirect("user_dashboard.aspx");
                    }
                    else
                    {
                        // If no matching user is found, display an error message to the user
                        string script = "alert('Invalid Details!');";
                        ClientScript.RegisterStartupScript(this.GetType(), "InvalidMessage", script, true);
                    }
                }
            }
        }
    }
}
