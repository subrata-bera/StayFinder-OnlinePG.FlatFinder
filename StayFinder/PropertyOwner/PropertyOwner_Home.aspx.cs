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
            if (Session["ID"] != null)
            {
                string id = Session["ID"].ToString();
                LoadUserProfile(id);
                LoadDashboardData(id);
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
    private void LoadUserProfile(string id)
    {
        using (SqlCommand cmd = new SqlCommand("SELECT ProfilePic FROM PropertyOwnerDetails WHERE ID = @id", conn))
        {
            cmd.Parameters.AddWithValue("@ID", id);
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
                    profileImage.Src = "../General/Assets/DefaultProfileImage.png"; 
                }
            }
            conn.Close();
        }
    }
    private void LoadDashboardData(string id)
    {
        conn.Open();
        SqlCommand cmdPending = new SqlCommand("select count(*) from PropertyDetails where OwnerId = @OwnerId and ApprovalStatus = 'Pending'", conn);
        cmdPending.Parameters.AddWithValue("@OwnerId", id);
        lblPendingProperties.Text = cmdPending.ExecuteScalar().ToString();

       
        SqlCommand cmdRejected = new SqlCommand("select count(*) from PropertyDetails where OwnerId = @OwnerId and ApprovalStatus = 'Rejected'", conn);
        cmdRejected.Parameters.AddWithValue("@OwnerId", id);
        lblRejectedProperties.Text = cmdRejected.ExecuteScalar().ToString();

        SqlCommand cmdTotalProperty = new SqlCommand("select count(*) from PropertyDetails where OwnerId = @OwnerId", conn);
        cmdTotalProperty.Parameters.AddWithValue("@OwnerId", id);
        lblTotalProperties.Text = cmdTotalProperty.ExecuteScalar().ToString();

        SqlCommand cmdApprovedProperty = new SqlCommand("select count(*) from PropertyDetails where OwnerId = @OwnerId and ApprovalStatus = 'Approved'", conn);
        cmdApprovedProperty.Parameters.AddWithValue("@OwnerId", id);
        lblApprovedProperties.Text = cmdApprovedProperty.ExecuteScalar().ToString();

        SqlCommand cmdPendingRequests = new SqlCommand("select count(*) from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID  where PropertyDetails.OwnerId = @OwnerId and BookingRequests.Status = 'Pending' ", conn);
        cmdPendingRequests.Parameters.AddWithValue("@OwnerId", id);
        lblPendingBookings.Text = cmdPendingRequests.ExecuteScalar().ToString();

        SqlCommand cmdApprovedRequests = new SqlCommand("select count(*) from PropertyDetails join BookingRequests on PropertyDetails.ID = BookingRequests.PropertyID  where PropertyDetails.OwnerId = @OwnerId and BookingRequests.Status = 'Approved' ", conn);
        cmdApprovedRequests.Parameters.AddWithValue("@OwnerId", id);
        lblAcceptedBookings.Text = cmdApprovedRequests.ExecuteScalar().ToString();
        conn.Close();
    }
}