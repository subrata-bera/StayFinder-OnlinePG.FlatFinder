using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_ThankYou : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Print_Click(object sender, EventArgs e)
    {
        if (Session["BookingRequestID"] != null)
        {
            string id = Session["BookingRequestID"].ToString();
            Response.Redirect("~/User/SiteVisit_Confirmation.aspx?ID=" + id);
        }
        else
        {
            Response.Write("<script>alert('Booking ID not found. Please try again.');</script>");
        }
    }
    protected void home_Click(object sender, EventArgs e)
    {
        if (Session["SelectedPropertyId"] != null)
        {
            string propertyId = Session["SelectedPropertyId"].ToString();
            Response.Redirect("~/General/PropertyDetails.aspx?ID=" + propertyId);
        }
        else
        {
            Response.Redirect("~/General/FindPg_Mess.aspx"); // If session missing, go to FindPg page
        } 
    }
}