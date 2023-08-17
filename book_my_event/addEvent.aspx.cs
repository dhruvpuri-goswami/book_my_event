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

public partial class addEvent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if the user is logged in as an admin, otherwise redirect to login page
        if (Session["AdminUserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    // Event handler for the "Add" button click
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

        if (fileUpload.HasFile)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Retrieve form input values
                string eventName = txtName.Text;
                string organizerName = txtOrganizer.Text;
                string address = txtAddress.Text;
                int price = int.Parse(txtPrice.Text); // Assuming valid integer input
                int capacity = int.Parse(txtCapa.Text); // Assuming valid integer input
                string desc = txtDesc.Text;
                DateTime dateTime = DateTime.Parse(txtDate.Text);

                // Read the uploaded image data into a byte array
                int length = fileUpload.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                fileUpload.PostedFile.InputStream.Read(pic, 0, length);

                // SQL query to insert event data into the database
                string query = "INSERT INTO tbl_events (event_name, organizer, address, price, capacity, Description, date, image) VALUES (@EventName, @OrganizerName, @Address, @Price, @Capacity, @Description, @Date, @image)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EventName", eventName);
                    cmd.Parameters.AddWithValue("@OrganizerName", organizerName);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Capacity", capacity);
                    cmd.Parameters.AddWithValue("@Description", desc); // Use @Description here
                    cmd.Parameters.AddWithValue("@Date", dateTime); // Use @Date here
                    cmd.Parameters.AddWithValue("@image", pic);
                    cmd.ExecuteNonQuery(); // Execute the SQL command
                }
            }

            // Display a successful alert message using JavaScript
            string script = "alert('Event added successfully!');";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}
