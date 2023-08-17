// Name: Disha Darji
// ID: 8849133

using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            double eventPrice = GetEventPriceFromQueryStringOrDatabase();
            lblEventPrice.Text = $"${eventPrice.ToString("0.00")}";

            double additionalCharges = eventPrice * 0.1;  
            lblAdditionalCharges.Text = $"${additionalCharges.ToString("0.00")}";

            double totalAmount = eventPrice + additionalCharges;
            lblTotalAmount.Text = $"${totalAmount.ToString("0.00")}";
        }
    }

    private double GetEventPriceFromQueryStringOrDatabase()
    {
        double price = 50.00;  
        if (Request.QueryString["ename"] != null)
        {
            string eventName = Request.QueryString["ename"];
        }
        return price;
    }

    protected void BtnSubmitPayment_Click(object sender, EventArgs e)
    {
        int eventID;
        if (!int.TryParse(Request.QueryString["ename"], out eventID))
        {
            return;
        }


        Response.Redirect("booking.aspx?eventid=" + eventID);
    }


}
