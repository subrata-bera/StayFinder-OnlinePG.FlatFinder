using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_PropertyOwner_Home : System.Web.UI.Page
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
                LoadDashboardData(email);
            }
            else
            {
                Response.Redirect("~/General/PropertyOwnerLogin.aspx"); // Redirect to login if no session
            }
        }
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
    private void LoadDashboardData(string email)
    {
        conn.Open();
        SqlCommand cmdPending = new SqlCommand("select count(*) from PropertyDetails where Email = @Email and ApprovalStatus = 'Pending'", conn);
        cmdPending.Parameters.AddWithValue("@Email", email);
        lblPendingProperties.Text = cmdPending.ExecuteScalar().ToString();

       
        SqlCommand cmdRejected = new SqlCommand("select count(*) from PropertyDetails where Email = @Email and ApprovalStatus = 'Rejected'", conn);
        cmdRejected.Parameters.AddWithValue("@Email", email);
        lblRejectedProperties.Text = cmdRejected.ExecuteScalar().ToString();

        SqlCommand cmdTotalProperty = new SqlCommand("select count(*) from PropertyDetails where Email = @Email", conn);
        cmdTotalProperty.Parameters.AddWithValue("@Email", email);
        lblTotalProperties.Text = cmdTotalProperty.ExecuteScalar().ToString();

        SqlCommand cmdApprovedProperty = new SqlCommand("select count(*) from PropertyDetails where Email = @Email and ApprovalStatus = 'Approved'", conn);
        cmdApprovedProperty.Parameters.AddWithValue("@Email", email);
        lblApprovedProperties.Text = cmdApprovedProperty.ExecuteScalar().ToString();

        SqlCommand cmdPendingRequests = new SqlCommand("select count(*) from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID  where PropertyDetails.Email = @Email and BookingRequests.Status = 'Pending' ", conn);
        cmdPendingRequests.Parameters.AddWithValue("@Email", email);
        lblPendingBookings.Text = cmdPendingRequests.ExecuteScalar().ToString();

        SqlCommand cmdApprovedRequests = new SqlCommand("select count(*) from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID  where PropertyDetails.Email = @Email and BookingRequests.Status = 'Approved' ", conn);
        cmdApprovedRequests.Parameters.AddWithValue("@Email", email);
        lblAcceptedBookings.Text = cmdApprovedRequests.ExecuteScalar().ToString();
        conn.Close();
    }
}