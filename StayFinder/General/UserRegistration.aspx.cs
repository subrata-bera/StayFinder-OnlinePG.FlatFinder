using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserRegistration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterClick(object sender, EventArgs e)
    {
        if (txtPassword.Text != txtConfirmPassword.Text)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Password not matched.";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        else
        {
            SqlDataAdapter adp = new SqlDataAdapter("select Email from UserDetails where Email = '"+txtEmail.Text+"'",conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "User already exist.";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("InsertUserDetails", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Registered successfull.";
                txtName.Text = "";
                txtEmail.Text = "";
                txtContact.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";

            }
            
            
        }
    }
}