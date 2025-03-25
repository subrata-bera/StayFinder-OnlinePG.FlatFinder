using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class General_PropertyOwnerRegistration : System.Web.UI.Page
{
  SqlConnection conn = new SqlConnection("Data Source=SUBRATA\\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void register_Click(object sender, EventArgs e)
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
            conn.Open();
            SqlDataAdapter adp = new SqlDataAdapter("select Email from PropertyOwnerDetails where Email = '" + txtEmail.Text + "'", conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = txtEmail.Text + " is already exist.";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("InsertPropertyOwnerDetails", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Name", txtName.Text);
                cmd.Parameters.AddWithValue("Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("Password", txtConfirmPassword.Text);

                byte[] imagedata = null;
                if (profilepicture.HasFile)
                {
                    using (System.IO.BinaryReader br = new System.IO.BinaryReader(profilepicture.PostedFile.InputStream))
                    {
                        imagedata = br.ReadBytes(profilepicture.PostedFile.ContentLength);
                    }
                    cmd.Parameters.AddWithValue("ProfilePic", imagedata);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@ProfilePic", DBNull.Value);
                }
                cmd.ExecuteNonQuery();
                conn.Close();
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "You registered successfully.";
                txtAddress.Text = "";
                txtConfirmPassword.Text = "";
                txtContact.Text = "";
                txtEmail.Text = "";
                txtName.Text = "";
                txtPassword.Text = "";
            }
        }
    }
}