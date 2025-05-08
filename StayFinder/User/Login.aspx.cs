using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Login : System.Web.UI.Page
{
    SqlDataAdapter adp = new SqlDataAdapter("select * from UserDetails", ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        adp.Fill(dt);
    }
    protected void signinClick(object sender, EventArgs e)
    {
        if (txtEmail.Text == "" || txtPassword.Text == "")
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Please enter all fileds.";
        }
        else
        {
            try
            {
                DataRow[] dr = dt.Select("Email = '" + txtEmail.Text + "'");
                if (txtPassword.Text == dr[0]["Password"].ToString())
                {
                    Session["Email"] = dr[0]["Email"].ToString();
                    Session["Name"] = dr[0]["Name"].ToString();
                    Response.Redirect("~/User/Home.aspx");
                }
                else
                {
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Text = "Invalid Email or Password.";
                }
            }
            catch
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid Email or Password.";
            }

        }
    }
}