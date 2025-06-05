using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_Document_View : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string bookingId = Request.QueryString["ID"];
            if (!string.IsNullOrEmpty(bookingId))
            {
                LoadDocumentImage(bookingId);
                
            }
            else
            {
                Response.Redirect("BookingRequests.aspx");
            }
        }
    }
    private void LoadDocumentImage(string bookingId)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT DocumentPhoto FROM BookingRequests WHERE ID = @ID", conn);
            cmd.Parameters.AddWithValue("@ID", bookingId);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader["DocumentPhoto"] != DBNull.Value)
                {
                    byte[] imageBytes = (byte[])reader["DocumentPhoto"];
                    string base64String = Convert.ToBase64String(imageBytes);
                    imgDocument.ImageUrl = "data:image/png;base64," + base64String;
                }
                else
                {
                    imgDocument.ImageUrl = "../General/Assets/DefaultProfileImage.png"; // Show default if no image
                }
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            // Handle error properly (optional: show a message)
            Response.Write("<script>alert('Error loading image: " + ex.Message + "');</script>");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
    }

    protected void back_Click(object sender, EventArgs e)
    {
        string requestId = Request.QueryString["ID"];
        Response.Redirect("~/PropertyOwner/Request_View.aspx?ID=" + requestId);
    }
}