﻿// Name: Disha Darji
// ID: 8849133

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserID"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
}
