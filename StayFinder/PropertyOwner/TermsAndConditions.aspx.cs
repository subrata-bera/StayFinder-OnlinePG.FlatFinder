using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_TermsAndConditions : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();
                LoadUserProfile(email);
            }
            else
            {
                Response.Redirect("~/General/PropertyOwnerLogin.aspx");
            }
        }
    }
    private void LoadUserProfile(string email)
    {
        using (SqlCommand cmd = new SqlCommand("SELECT ProfilePic FROM PropertyOwnerDetails WHERE Email = @Email", conn))
        {
            cmd.Parameters.AddWithValue("@Email", email);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblUserName.Text = Session["Name"].ToString();

                if (reader["ProfilePic"] != DBNull.Value)
                {
                    byte[] imgData = (byte[])reader["ProfilePic"];
                    string base64String = Convert.ToBase64String(imgData);
                    profileImage.Src = "data:image/png;base64," + base64String;

                }
                else
                {
                    profileImage.Src = "../General/Assets/DefaultProfileImage.png" ;
                }
            }
            conn.Close();
        }
    }
    protected void Proceed_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PropertyOwner/AddProperty.aspx");
    }
}