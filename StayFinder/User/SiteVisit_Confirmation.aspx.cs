using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_SiteVisit_Confirmation : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["BookingRequestID"] != null)
            {
                SqlCommand cmd = new SqlCommand("Booking_Confirmation", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", Session["BookingRequestID"]); // 🧠 pass the ID

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblUserName.Text = reader["UserName"].ToString();
                    lblRequestDate.Text = Convert.ToDateTime(reader["RequestDate"]).ToString("dd MMMM yyyy");
                    lblBookingDate.Text = Convert.ToDateTime(reader["BookingDate"]).ToString("dd MMMM yyyy");
                    lblBookingID.Text = reader["ID"].ToString();
                    lblPropertyName.Text = reader["PropertyName"].ToString();
                    lblOwnerName.Text = reader["OwnerName"].ToString();
                    lblPropertyType.Text = reader["PropertyType"].ToString();
                    lblPeople.Text = reader["NumberOfPeople"].ToString();
                    lblGender.Text = reader["Gender"].ToString();
                    lblStatus.Text = reader["Status"].ToString();
                }
                conn.Close();
            }
            else
            {
                Response.Redirect("~/General/UserLogin.aspx");
            }
        }
    }
    protected void back_Click(object sender, EventArgs e)
    {
        if (Session["SelectedPropertyId"] != null)
        {
            string propertyId = Session["SelectedPropertyId"].ToString();
            Response.Redirect("~/General/PropertyDetails.aspx?ID=" + propertyId);
        }
        else
        {
            Response.Redirect("~/General/FindPg_Mess.aspx"); // If session missing, go to FindPg page
        } 
    }
}