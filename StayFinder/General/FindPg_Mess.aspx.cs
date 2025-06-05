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
                LoadCityDropdown();
                LoadRentDropdown();
            
        }
    }
    private void LoadCityDropdown()
    {
        string query = "SELECT DISTINCT City FROM PropertyDetails WHERE City IS NOT NULL AND City <> '' ORDER BY City";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            conn.Close();

            ddlLocation.Items.Clear();
            ddlLocation.Items.Add(new ListItem("-- Any Location --", "")); // Default option

            foreach (DataRow row in dt.Rows)
            {
                string originalCity = row["City"].ToString().Trim();
                string formattedCity = System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(originalCity.ToLower());

                ddlLocation.Items.Add(new ListItem(formattedCity, originalCity));
            }
        }
    }

    private void LoadRentDropdown()
    {
        string query = @"
        SELECT DISTINCT 
            (SELECT MAX(v) 
             FROM (VALUES 
                 (ISNULL(SingleRoomRent, 0)), 
                 (ISNULL(DoubleRoomRent, 0)), 
                 (ISNULL(TripleRoomRent, 0))
             ) AS value_table(v)) AS MaxRent
        FROM PropertyDetails
        WHERE SingleRoomRent IS NOT NULL 
           OR DoubleRoomRent IS NOT NULL 
           OR TripleRoomRent IS NOT NULL
        ORDER BY MaxRent ASC;
    ";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            conn.Close();

            ddlMaxRent.Items.Clear();
            ddlMaxRent.Items.Add(new ListItem("-- Any Rent --", "")); 

            foreach (DataRow row in dt.Rows)
            {
                string rent = row["MaxRent"].ToString();
                ddlMaxRent.Items.Add(new ListItem( rent, rent));
            }
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
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        string selectedCity = ddlLocation.SelectedValue;
        string selectedMaxRent = ddlMaxRent.SelectedValue;

        string query = @"SELECT * FROM PropertyDetails WHERE ApprovalStatus = 'Approved'";

        if (!string.IsNullOrEmpty(selectedCity))
        {
            query += " AND City = @City";
        }

        if (!string.IsNullOrEmpty(selectedMaxRent))
        {
            query += @"
            AND (
                ISNULL(SingleRoomRent, 0) <= @MaxRent OR
                ISNULL(DoubleRoomRent, 0) <= @MaxRent OR
                ISNULL(TripleRoomRent, 0) <= @MaxRent
            )";
        }

        query += " ORDER BY ID DESC";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            if (!string.IsNullOrEmpty(selectedCity))
            {
                cmd.Parameters.AddWithValue("@City", selectedCity);
            }

            if (!string.IsNullOrEmpty(selectedMaxRent))
            {
                cmd.Parameters.AddWithValue("@MaxRent", Convert.ToInt32(selectedMaxRent));
            }

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

            noDataMessage.Visible = dt.Rows.Count == 0;
        }
    }

    }
 
