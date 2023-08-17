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

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string fullName = txtFullName.Text;
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string confirmPassword = txtConfirmPassword.Text;

        // Basic validation
        if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            // Display an error message (you would use a label or other control)
            string script1 = "alert('No field must be empty!');";
            ClientScript.RegisterStartupScript(this.GetType(), "EmptyFields", script1, true);
            return;
        }

        if (password != confirmPassword)
        {
            // Passwords don't match; display an error message
            string script2 = "alert('Password must be same!');";
            ClientScript.RegisterStartupScript(this.GetType(), "PasswordMismatch", script2, true);
            return;
        }

        // Registration logic
        string connectionString = ConfigurationManager.ConnectionStrings["event_booking"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "INSERT INTO tbl_user (username, email, password) VALUES (@FullName, @Email, @Password)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.ExecuteNonQuery();
            }
        }

        // Display a successful alert message using JavaScript
        string script = "alert('Registration successful!');";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

        Response.Redirect("login.aspx");  
    }
   
}