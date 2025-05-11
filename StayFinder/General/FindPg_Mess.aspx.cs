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
 
    private void LoadPropertyDetails()
    {
        string query = "SELECT * FROM PropertyDetails WHERE 1=1 AND ApprovalStatus = 'Approved' order by ID desc";

      
        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
          

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            conn.Close();

            // Add MinRent and MaxRent columns
            dt.Columns.Add("MinRent", typeof(int));
            dt.Columns.Add("MaxRent", typeof(int));

            foreach (DataRow row in dt.Rows)
            {
                int s = row["SingleRoomRent"] != DBNull.Value ? Convert.ToInt32(row["SingleRoomRent"]) : 0;
                int d = row["DoubleRoomRent"] != DBNull.Value ? Convert.ToInt32(row["DoubleRoomRent"]) : 0;
                int t = row["TripleRoomRent"] != DBNull.Value ? Convert.ToInt32(row["TripleRoomRent"]) : 0;

                int[] rents = new int[] { s, d, t };
                var validRents = rents.Where(r => r > 0).ToList();

                if (validRents.Any())
                {
                    row["MinRent"] = validRents.Min();
                    row["MaxRent"] = validRents.Max();
                }
                else
                {
                    row["MinRent"] = 0;
                    row["MaxRent"] = 0;
                }
            }


            rptPropertyList.DataSource = dt;
            rptPropertyList.DataBind();

            if (rptPropertyList.Items.Count == 0)
            {
                noDataMessage.Visible = true;
            }
        }
    }
    }
 
