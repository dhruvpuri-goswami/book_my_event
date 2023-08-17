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

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFeaturedEvents();
        }
    }

    // Load events
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

    // Showing events
    protected void rptFeaturedEvents_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;
            byte[] imageData = (byte[])rowView["image"];

            string imageBase64 = Convert.ToBase64String(imageData);
            string imageSrc = $"data:image/jpeg;base64,{imageBase64}";

            Image imgEvent = (Image)e.Item.FindControl("imgEvent");
            if (imgEvent != null)
            {
                imgEvent.ImageUrl = imageSrc;
            }

            Button btnBookNow = (Button)e.Item.FindControl("btnBookNow");
            if (btnBookNow != null)
            {
                btnBookNow.Click += BtnBookNow_Click; // Attach the click event
            }
        }
    }


    private void BtnBookNow_Click(object sender, EventArgs e)
    {

    }
}
