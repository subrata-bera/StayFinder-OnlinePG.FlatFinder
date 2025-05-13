using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ManageUsers : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] != null)
            {
                LoadUsersDetails();
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

    private void LoadUsersDetails()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select ID, Name, Email, Contact from UserDetails order by ID desc", conn);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            rptUsers.DataSource = reader;
            rptUsers.DataBind();
            lblNoUser.Visible = false;
        }
        else
        {
            rptUsers.DataSource = null;
            rptUsers.DataBind();
            lblNoUser.Visible = true;
        }
        conn.Close();

    }

}