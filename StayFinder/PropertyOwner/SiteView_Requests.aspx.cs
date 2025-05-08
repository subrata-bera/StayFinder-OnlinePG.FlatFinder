using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_SiteView_Requests : System.Web.UI.Page
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
                BookingRequests(Session["Email"].ToString());
            }
            else
            {
                Response.Redirect("~/General/PropertyOwnerLogin.aspx"); // Redirect to login if no session
            }
        }
    }
    private void BookingRequests(string email)
    {

        SqlCommand cmd = new SqlCommand("FetchBookingRequests", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Email", email);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        rptBookingRequest.DataSource = reader;
        rptBookingRequest.DataBind();
        conn.Close();

    }
    protected void signout_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/General/PropertyOwnerLogin.aspx");
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
                    profileImage.Src = "data:image/png;base64," + base64String; // Set image source

                }
                else
                {
                    profileImage.Src = "Assets/default-profile.png"; // Default profile image
                }
            }
            conn.Close();
        }
    }
}