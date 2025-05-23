using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_Edit_Property : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);
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
                    string email = Session["Email"].ToString();
                    LoadUserProfile(email);
                }
                else
                {
                    Response.Write("<script>alert('Invalid Property ID format');window.location='PropertyList.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid or missing Property ID');window.location='PropertList.aspx';</script>");
            }
        }
    }
    private void LoadPropertyDetails(int propertyID)
    {
       
            string query = "SELECT * FROM PropertyDetails WHERE ID = @ID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ID", propertyID);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtPropertyName.Text = reader["PropertyName"].ToString();
                ddlPropertyType.Text = reader["PropertyType"].ToString();
                ddlPropertyGender.Text = reader["Gender"].ToString();
                txtLocation.Text = reader["Location"].ToString();
                txtCity.Text = reader["City"].ToString();
                txtRent.Text = reader["Rent"].ToString();
                txtRoom.Text = reader["NumberOfRooms"].ToString();
                txtDescription.Text = reader["Description"].ToString();
                txtContact.Text = reader["Contact"].ToString();
                conn.Close();

             
            }
            else
            {
                Response.Write("<script>alert('Property not found');window.location='PropertyList.aspx';</script>");
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
                    profileImage.Src = "data:image/png;base64," + base64String; // Set image source

                }
                else
                {
                    profileImage.Src = "../General/Assets/DefaultProfileImage.png";  // Default profile image
                }
            }
            conn.Close();
        }
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int propertyID;
            if (int.TryParse(Request.QueryString["ID"], out propertyID))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("EditProperty", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PropertyName", txtPropertyName.Text);
                cmd.Parameters.AddWithValue("@PropertyType", ddlPropertyType.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlPropertyGender.Text);
                cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                cmd.Parameters.AddWithValue("@Rent", txtRent.Text);
                cmd.Parameters.AddWithValue("@NumberOfRooms", txtRoom.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Facilities_1", chWifi.Checked ? "WiFi" : "");
                cmd.Parameters.AddWithValue("@Facilities_2", chParking.Checked ? "Parking" : "");
                cmd.Parameters.AddWithValue("@Facilities_3", chFood.Checked ? "Food" : "");
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@ID", propertyID);  // Now propertyID is defined

                byte[] imagedata = null;
                if (PropertyImage.HasFile)
                {
                    using (System.IO.BinaryReader br = new System.IO.BinaryReader(PropertyImage.PostedFile.InputStream))
                    {
                        imagedata = br.ReadBytes(PropertyImage.PostedFile.ContentLength);
                    }
                    cmd.Parameters.AddWithValue("@PropertyImage", imagedata);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PropertyImage", DBNull.Value);
                }

                cmd.ExecuteNonQuery();  // Execute the SQL command
                conn.Close();

                Response.Write("<script>alert('Property Updated Successfully');window.location='PropertyList.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Invalid Property ID');window.location='PropertyList.aspx';</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Property ID not found');window.location='PropertyList.aspx';</script>");
        }
    }

}