using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class General_AdminLogin : System.Web.UI.Page
{
    SqlDataAdapter adp = new SqlDataAdapter("select * from AdminDetails", @"Data Source=SUBRATA\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234");
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        adp.Fill(dt);
    }
    protected void signin_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text == "" || txtPassword.Text == "")
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Please fill all details.";
        }
        else {
            try {
                DataRow[] dr = dt.Select("Email = '" + txtEmail.Text + "'");
                    if(txtPassword.Text == dr[0]["Password"].ToString())
                    {
                        Session["Name"] = dr[0]["Name"].ToString();
                        Session["Email"] = dr[0]["Email"].ToString();
                        Response.Redirect("~/Admin/Admin_Home.aspx");
                        
                    }
                    else
                    {
                        lblError.ForeColor = System.Drawing.Color.Red;
                        lblError.Text = "Invalid email or password.";
                    }
            }
            catch
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid email or password.";
            }
 
            
        }
    }

}