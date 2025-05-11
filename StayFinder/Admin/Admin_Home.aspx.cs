using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Home : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Name"] != null)
            {
                string email = Session["Email"].ToString();
                lblUserName.Text = Session["Name"].ToString();
                LoadDashBoardData(email);
            }
            else
            {
                Response.Redirect("~/General/AdminLogin.aspx");
            }
        }
    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/General/AdminLogin.aspx");
    }

    private void LoadDashBoardData(string email)
    {
        conn.Open();
        SqlCommand cmdOwner = new SqlCommand("select count(*) from PropertyOwnerDetails",conn);
        lblOwners.Text = cmdOwner.ExecuteScalar().ToString();

        SqlCommand cmdProperty = new SqlCommand("select count(*) from PropertyDetails", conn);
        lblTotalProperties.Text = cmdProperty.ExecuteScalar().ToString();

        SqlCommand cmdPending = new SqlCommand("select count(*) from PropertyDetails where ApprovalStatus = 'Pending'", conn);
        lblPending.Text = cmdPending.ExecuteScalar().ToString();

        SqlCommand cmdApprove = new SqlCommand("select count(*) from PropertyDetails where ApprovalStatus = 'Approved'", conn);
        lblApproved.Text = cmdApprove.ExecuteScalar().ToString();

        SqlCommand cmdRejected = new SqlCommand("select count(*) from PropertyDetails where ApprovalStatus = 'Rejected'", conn);
        lblRejected.Text = cmdRejected.ExecuteScalar().ToString();



    }
}