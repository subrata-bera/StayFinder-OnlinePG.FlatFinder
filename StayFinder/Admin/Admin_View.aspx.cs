using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)  // Checking if ID exists in query string
            {
                int propertyID;
                if (int.TryParse(Request.QueryString["ID"], out propertyID))  // Validating if it's an integer
                {
                    LoadPropertyDetails(propertyID);
                    lblUserName.Text = Session["Name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Property ID format');window.location='FindPg_Mess.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid or missing Property ID');window.location='FindPg_Mess.aspx';</script>");
            }

        }
    }
    private void LoadPropertyDetails(int propertyID)
    {
        string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM PropertyDetails WHERE ID = @ID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ID", propertyID);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblName.Text = reader["PropertyName"].ToString();
                lblType.Text = reader["PropertyType"].ToString();
                lblAddress.Text = reader["Location"].ToString();
                lblLandmark.Text = reader["Landmark"].ToString();

                //facilities here
                lblFacilities_1.Text = reader["Facility_Wifi"].ToString() +", ";
                lblFacilities_2.Text = reader["Facility_Parking"].ToString() + ", ";
                lblFacilities_3.Text = reader["Facility_Power"].ToString() + ", ";
                lblFacilities_4.Text = reader["Facility_WashingMachine"].ToString() + ", ";
                lblFacilities_5.Text = reader["Facility_Geyser"].ToString() + ", ";
                lblFacilities_6.Text = reader["Facility_CCTV"].ToString() + ", ";
                lblFacilities_7.Text = reader["Facility_Security"].ToString() + ", ";
                lblFacilities_8.Text = reader["Facility_AC"].ToString() + ", ";
                lblFacilities_9.Text = reader["Facility_Water"].ToString() + ", ";

                //rules here

                lblRules_1.Text = reader["Rules_NoSmoking"].ToString() + ", ";
                lblRules_2.Text = reader["Rules_NoAlcohol"].ToString() + ", ";
                lblRules_3.Text = reader["Rules_NoPets"].ToString() + ", ";
                lblRules_4.Text = reader["Rules_OnlyStudents"].ToString() + ", ";

                lblDescription.Text = reader["Description"].ToString();
                // Load Image
                byte[] imageBytes1 = (byte[])reader["PropertyImage"];
                string imageBase64 = Convert.ToBase64String(imageBytes1);
                img1.ImageUrl = "data:image/png;base64," + imageBase64;

                byte[] imageBytes2 = (byte[])reader["PropertyImage_2"];
                string imageBase64_2 = Convert.ToBase64String(imageBytes2);
                img2.ImageUrl = "data:image/png;base64," + imageBase64_2;

                byte[] imageBytes3 = (byte[])reader["PropertyImage_3"];
                string imageBase64_3 = Convert.ToBase64String(imageBytes3);
                img3.ImageUrl = "data:image/png;base64," + imageBase64_3;

                lblOwnerName.Text = reader["OwnerName"].ToString();
                lblContact.Text = reader["Contact"].ToString();

                lblNumberOfRooms.Text = reader["NumberOfRooms"].ToString();
                lblRent.Text = reader["Rent"].ToString();

                lblGender.Text = reader["Gender"].ToString();

               
            }
            else
            {
                Response.Write("<script>alert('Property not found');window.location='FindPg_Mess.aspx';</script>");
            }
        }
    }
    protected void Approve_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int propertyID;
            if (int.TryParse(Request.QueryString["ID"], out propertyID))
            {
                string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("UpdatePropertyDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ApprovalStatus", "Approved");
                    cmd.Parameters.AddWithValue("@ApprovedBy", Session["Name"].ToString());
                    cmd.Parameters.AddWithValue("@ApprovedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ID", propertyID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("<script>alert('Property Approved Successfully');window.location='PendingProperties.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Property ID');window.location='PendingProperties.aspx';</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Property ID not found');window.location='PendingProperties.aspx';</script>");
        }
    }
    protected void Reject_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int propertyID;
            if (int.TryParse(Request.QueryString["ID"], out propertyID))
            {
                string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("UpdatePropertyDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ApprovalStatus", "Rejected");
                    cmd.Parameters.AddWithValue("@ApprovedBy", "");
                    cmd.Parameters.AddWithValue("@ApprovedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ID", propertyID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("<script>alert('Property is Rejected');window.location='PendingProperties.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Property ID');window.location='PendingProperties.aspx';</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Property ID not found');window.location='PendingProperties.aspx';</script>");
        }
    }
    

}