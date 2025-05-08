using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_RequestOptions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SiteVisit_Click(object sender, EventArgs e)
    {
        Session["RequestType"] = "Site Visit";
        Response.Redirect("~/User/SiteVisit_Request.aspx");
    }
    protected void DirectBooking_Click(object sender, EventArgs e)
    {
        Session["RequestType"] = "Direct Booking";
        Response.Redirect("~/User/SiteVisit_Request.aspx");
    }

}