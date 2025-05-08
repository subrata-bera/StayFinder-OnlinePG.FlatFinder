using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_ViewDocument : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int requestId;
                if (int.TryParse(Request.QueryString["ID"], out requestId)) 
                {
                    LoadDocumentImage(requestId);
                }
                else
                {
                    Response.Write("<script>alert('Invalid Property ID format');window.location='Login.aspx';</script>");
                }
                
            }
             else
        {
            Response.Write("<script>alert('Invalid Property ID format');window.location='Login.aspx';</script>");
        }


        }

       
    }
    private void LoadDocumentImage(int id)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT DocumentPhoto FROM BookingRequests WHERE ID = @ID", conn);
            cmd.Parameters.AddWithValue("@ID", id);

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
                    imgDocument.ImageUrl = "~/General/Assets/defaultProperty.jpeg";
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
    }

    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Home.aspx");
    }


}