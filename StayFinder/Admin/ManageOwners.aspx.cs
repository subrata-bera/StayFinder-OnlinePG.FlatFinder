using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_ManageOwners : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] != null)
            {
                LoadOwnersDetails();
                lblUserName.Text = Session["Name"].ToString();
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

    private void LoadOwnersDetails()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select ID, ProfilePic, Name, Email, Contact from PropertyOwnerDetails order by ID desc", conn);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            rptOwners.DataSource = reader;
            rptOwners.DataBind();
            lblNoOwner.Visible = false;
        }
        else
        {
            rptOwners.DataSource = null;
            rptOwners.DataBind();
            lblNoOwner.Visible = true;
        }
        conn.Close();

    }

}