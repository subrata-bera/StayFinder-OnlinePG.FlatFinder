using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Owner_View : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["ID"]);
                LoadProfilePicture(id);
                LoadOwnerDetails(id);
                LoadProperty(id);
            }
            else
            {
                Response.Redirect("~/General/AdminLogin.aspx");
            }

        }
    }

    private void LoadProfilePicture(int id)
    {
        SqlCommand cmd = new SqlCommand("select ProfilePic from PropertyOwnerDetails where ID = @id", conn);
        cmd.Parameters.AddWithValue("@id", id);

        conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {

                if (reader["ProfilePic"] != DBNull.Value)
                {
                    byte[] imgData = (byte[])reader["ProfilePic"];
                    string base64String = Convert.ToBase64String(imgData);
                    imgProfile.Src = "data:image/png;base64," + base64String;

                }
                else
                {
                    imgProfile.Src = "../General/Assets/DefaultProfileImage.png";
                }
               
            }
        conn.Close();
            
    }

    private void LoadOwnerDetails(int id)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select Name, Email, Contact, Address from PropertyOwnerDetails where ID = @id", conn);
        cmd.Parameters.AddWithValue("@id", id);

        SqlDataReader reader = cmd.ExecuteReader();

        if(reader.Read())
        {
            lblName.Text = reader["Name"].ToString();
            lblEmail.Text = reader["Email"].ToString();
            lblContact.Text = reader["Contact"].ToString();
            lblAddress.Text = reader["Address"].ToString();
        }
        conn.Close();
    }


    private void LoadProperty(int id)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select PropertyImage, PropertyName, Location, PropertyType, Gender from PropertyDetails where OwnerId = @OwnerId order by ID desc", conn);
        cmd.Parameters.AddWithValue("@OwnerId", id);

        SqlDataReader reader = cmd.ExecuteReader();
       
        
            if (reader.HasRows)
            {
                rptProperties.DataSource = reader;
                rptProperties.DataBind();
            }
        
        conn.Close();
    }
   
}