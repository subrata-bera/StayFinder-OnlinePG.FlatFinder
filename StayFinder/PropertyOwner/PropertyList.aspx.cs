using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Configuration;

public partial class PropertyOwner_PropertyList : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("~/Login.aspx");
                
            }
            else
            {
                string email = Session["Email"].ToString();
                LoadUserProfile(email);
                LoadPropertyDetails(Session["Email"].ToString());
            }
        }
    }
    
        
    private void LoadPropertyDetails(string email)
    {
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM PropertyDetails WHERE Email = @Email ORDER BY ID DESC", conn))
        {
            cmd.Parameters.AddWithValue("@Email", email);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            rptPropertyList.DataSource = reader;
            rptPropertyList.DataBind();
            conn.Close();
        }
    }
    protected void signout_Click(object sender, EventArgs e)
    {
        Session.Clear();
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


    protected void rptPropertyList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "DeleteProperty")
        {
            try
            {
                if (e.CommandArgument != null)
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString))
                    {
                        SqlCommand cmd = new SqlCommand("DeleteProperty", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", id);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }

                    // Refresh Property List
                    LoadPropertyDetails(Session["Email"].ToString());

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Error: " + ex.Message + "');", true);
            }
        }
    }








}