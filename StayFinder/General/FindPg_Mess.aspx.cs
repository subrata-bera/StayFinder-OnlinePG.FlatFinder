using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class General_FIndPg_Mess : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        noDataMessage.Visible = false; 

        if (!IsPostBack)
        {

         
                LoadPropertyDetails();
            
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPropertyDetails();
    }

    protected void ddlRent_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPropertyDetails();
    }
    private void LoadPropertyDetails()
    {
        string query = "SELECT * FROM PropertyDetails WHERE 1=1 AND ApprovalStatus = 'Approved'";
        if (!string.IsNullOrEmpty(ddlCity.SelectedValue))
        {
            query += " AND City=@City";
        }
        if (!string.IsNullOrEmpty(ddlRent.SelectedValue))
        {
            query += " AND CAST(Rent AS INT) <= @Rent";
        }
        query += " ORDER BY ID DESC";
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            if (!string.IsNullOrEmpty(ddlCity.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
            }
            if (!string.IsNullOrEmpty(ddlRent.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@Rent", ddlRent.SelectedValue);
            }
            
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            rptPropertyList.DataSource = reader;
            rptPropertyList.DataBind();
            conn.Close();
            if (rptPropertyList.Items.Count == 0)
            {
                noDataMessage.Visible = true; // Yaha Show Hoga
            }
        }
    }   
    }
 
