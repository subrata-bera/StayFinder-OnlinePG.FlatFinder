using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Messages : System.Web.UI.Page
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
                LoadMessages();
                
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
    private void LoadMessages()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from ContactUs order by ID desc", conn);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            rptMessages.DataSource = reader;
            lblError.Visible = false;
            rptMessages.DataBind();
        }
        else
        {
            rptMessages.DataSource = null;
            lblError.Visible = true;
            rptMessages.DataBind();
        }
        conn.Close();
    }
}