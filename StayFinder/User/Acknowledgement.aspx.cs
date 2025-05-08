using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Acknowledgement : System.Web.UI.Page
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
                    LoadDetails(requestId);
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

    private void LoadDetails(int requestId)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("Booking_Confirmation", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@ID", requestId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            lblId.Text = reader["ID"].ToString();
            lblRequestDate.Text = Convert.ToDateTime(reader["RequestDate"]).ToString("dd MMMM yyyy");
            lblPropertyName.Text = reader["PropertyName"].ToString();
            lblStatus.Text = reader["Status"].ToString();
            lblAddress.Text = reader["Address"].ToString();
            lblRequestDate.Text = Convert.ToDateTime(reader["Bookingdate"]).ToString("dd MMMM yyyy");
            lblPropertyOwnerName.Text = reader["Ownername"].ToString();
            lblType.Text = reader["PropertyType"].ToString();
            lblVisitorName.Text = reader["UserName"].ToString();
            lblVisitorContact.Text = reader["Mobile"].ToString();
            lblGender.Text = reader["Gender"].ToString();
        }
    }
}