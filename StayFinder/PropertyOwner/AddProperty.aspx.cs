using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PropertyOwner_AddProperty : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=SUBRATA\\SQLEXPRESS;Initial Catalog=StayFinder;User ID=sa;Password=1234");

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
                Response.Redirect("~/General/PropertyOwnerLogin.aspx");             }
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
    protected void addproperty_Click(object sender, EventArgs e)
    {
        if (int.Parse(txtRent.Text) < 0)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Enter a valid rent.";
        }
        else
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("InsertPropertyDetails", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("PropertyName", txtPropertyName.Text);
            cmd.Parameters.AddWithValue("PropertyType", ddlPropertyType.Text);
            cmd.Parameters.AddWithValue("Gender", ddlPropertyGender.Text);
            cmd.Parameters.AddWithValue("Location", txtLocation.Text);
            cmd.Parameters.AddWithValue("Rent", txtRent.Text);
            cmd.Parameters.AddWithValue("NumberOfRooms", txtRoom.Text);
            cmd.Parameters.AddWithValue("Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("Facilities_1", chWifi.Checked ? "WiFi" : "");
            cmd.Parameters.AddWithValue("Facilities_2", chParking.Checked ? "Parking" : "");
            cmd.Parameters.AddWithValue("Facilities_3", chFood.Checked ? "Food" : "");
            cmd.Parameters.AddWithValue("Contact", txtContact.Text);
            cmd.Parameters.AddWithValue("OwnerName", Session["Name"].ToString());
            cmd.Parameters.AddWithValue("Email", Session["Email"].ToString());
            cmd.Parameters.AddWithValue("City", txtCity.Text);

            byte[] imagedata = null;
            if (PropertyImage.HasFile)
            {
                using (System.IO.BinaryReader br = new System.IO.BinaryReader(PropertyImage.PostedFile.InputStream))
                {
                    imagedata = br.ReadBytes(PropertyImage.PostedFile.ContentLength);
                }
                cmd.Parameters.AddWithValue("PropertyImage", imagedata);
            }
            else
            {
                cmd.Parameters.AddWithValue("@PropertyImage", DBNull.Value);
            }
            cmd.ExecuteNonQuery();
            conn.Close();
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Property added successfully.";
            txtContact.Text = "";
            txtDescription.Text = "";
            ; txtLocation.Text = "";
            txtPropertyName.Text = "";
            txtRent.Text = "";
            txtRoom.Text = "";
            ddlPropertyType.ClearSelection();
            chWifi.Checked = false;
            chParking.Checked = false;
            chFood.Checked = false;
        }
    }
}