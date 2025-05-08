using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_Request_View : System.Web.UI.Page
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
                int bookingID;
                if (int.TryParse(Request.QueryString["ID"], out bookingID))
                {
                    LoadBookingRequest(bookingID);
                }
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
                    profileImage.Src = "Assets/default-profile.png";
                }
            }
            conn.Close();
        }
    }
    private void LoadBookingRequest(int bookingID)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("FetchRequestApproval", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", bookingID);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblHeading.Text = reader["PropertyName"].ToString();
            lblName.Text = reader["Username"].ToString();
            lblContact.Text = reader["Mobile"].ToString();
            lblGender.Text = reader["Gender"].ToString();
            lblAddress.Text = reader["Address"].ToString();
            lblPeople.Text = reader["NumberOfPeople"].ToString();
            lblBookingdate.Text = Convert.ToDateTime(reader["BookingDate"]).ToString("dd-MM-yyyy");
            lblDocumentType.Text = reader["DocumentType"].ToString();
            lblDocumentNumber.Text = reader["DocumentsNumber"].ToString();
        }
        conn.Close();
    }
    protected void View_Click(object sender, EventArgs e)
    {
        string bookingId = Request.QueryString["ID"];
        if (!string.IsNullOrEmpty(bookingId))
        {
            Response.Redirect("~/PropertyOwner/Document_View.aspx?ID=" + bookingId);
        }
    }
    protected void Accept_Click(object sender, EventArgs e)
    {
        string bookingId = Request.QueryString["ID"];
        SqlCommand cmd = new SqlCommand("UpdateBookingStatus", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", bookingId);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('Request Accepted Successfully');window.location='SiteView_Requests.aspx';</script>");
    }
}