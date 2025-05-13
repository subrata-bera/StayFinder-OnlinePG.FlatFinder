using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_PendingProperties : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Name"] != null)
            {
                lblUserName.Text = Session["Name"].ToString();
                string email = Session["Email"].ToString();
               
            }
            else
            {
                Response.Redirect("~/General/AdminLogin.aspx");

            }
        }
    }
    private void LoadPropertyDetails()
    {
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM PropertyDetails WHERE ApprovalStatus = 'Pending' ORDER BY ID DESC", conn))
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                rptPropertyList.DataSource = reader;
                rptPropertyList.DataBind();
                lblNoProperty.Visible = false; // Hide message if data found
            }
            else
            {
                rptPropertyList.DataSource = null;
                rptPropertyList.DataBind();
                lblNoProperty.Visible = true; // Show message if no data
            }
            conn.Close();
        }
    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/General/AdminLogin.aspx");
    }
}