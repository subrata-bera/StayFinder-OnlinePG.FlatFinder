using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

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
        string connStr = @"Data Source=SUBRATA\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234";
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
                lblDescriptiojn.Text = reader["Description"].ToString();
                lblType.Text = reader["PropertyType"].ToString();
                lblFacilities_1.Text = reader["Facilities_1"].ToString();
                lblFacilities_2.Text = reader["Facilities_2"].ToString();
                lblFacilities_3.Text = reader["Facilities_3"].ToString();
                lblNumberOfRooms.Text = reader["NumberOfRooms"].ToString();
                lblOwnerName.Text = reader["OwnerName"].ToString();
                lblAddress.Text = reader["Location"].ToString();
                lblContact.Text = reader["Contact"].ToString();
                lblRent.Text = reader["Rent"].ToString();
                lblGender.Text = reader["Gender"].ToString();

                // Load Image
                byte[] imageBytes = (byte[])reader["PropertyImage"];
                string imageBase64 = Convert.ToBase64String(imageBytes);
                PropertyImage.ImageUrl = "data:image/png;base64," + imageBase64;
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
                string connStr = @"Data Source=SUBRATA\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234";
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("UpdatePropertyDetails", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ApprovalStatus","Approved");
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
                string connStr = @"Data Source=SUBRATA\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234";
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