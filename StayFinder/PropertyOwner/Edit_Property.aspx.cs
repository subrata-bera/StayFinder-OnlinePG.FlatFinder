using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class PropertyOwner_Edit_Property : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                string propertyId = Request.QueryString["ID"];
                LoadPropertyDetails(propertyId);
            }
            else
            {
                Response.Redirect("~/General/PropertyOwnerLogin.aspx");
            }
        }
    }
    private void LoadPropertyDetails(string propertyId)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from PropertyDetails where ID = @PropertyId", conn);
        cmd.Parameters.AddWithValue("@PropertyId", propertyId);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.Read())
        {
            txtPropertyName.Text = reader["PropertyName"].ToString();
            ddlPropertyType.Text = reader["PropertyType"].ToString();
            ddlTenantGender.Text = reader["Gender"].ToString();
            txtEmail.Text = reader["Email"].ToString();
            txtAddress.Text = reader["Location"].ToString();
            txtCity.Text = reader["City"].ToString();
            txtLandmark.Text = reader["Landmark"].ToString();
            txtPincode.Text = reader["Pin"].ToString();

            txtContact.Text = reader["Contact"].ToString();

            txtSingleUnit.Text = reader["SingleRoomUnit"].ToString();
            txtDoubleUnit.Text = reader["DoubleRoomUnit"].ToString();
            txtTripleUnit.Text = reader["TripleRoomUnit"].ToString();

            txtSingleRent.Text = reader["SingleRoomRent"].ToString();
            txtDoubleRent.Text = reader["DoubleRoomRent"].ToString();
            txtTripleRent.Text = reader["TripleRoomRent"].ToString();

            txtSingleSize.Text = reader["SingleRoomSize"].ToString();
            txtDoubleSize.Text = reader["TripleRoomSize"].ToString();
            txtTripleSize.Text = reader["TripleRoomSize"].ToString();
            txtRooms.Text = reader["NumberOfRooms"].ToString();

            if (!string.IsNullOrEmpty(reader["Facility_Wifi"].ToString()))

            {
                chkWifi.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_Parking"].ToString()))
            {
                chkParking.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_Power"].ToString()))
            {
                chkPower.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_WashingMachine"].ToString()))
            {
                chkWashingMachine.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_Geyser"].ToString()))
            {
                chkGeyser.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_CCTV"].ToString()))
            {
                chkCCTV.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_Security"].ToString()))
            {
                chkSecurity.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_AC"].ToString()))
            {
                chkAC.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Facility_Water"].ToString()))
            {
                chkWater.Checked = true;
            }

            if (!string.IsNullOrEmpty(reader["Rules_NoSmoking"].ToString()))
            {
                chkSmoking.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Rules_NoAlcohol"].ToString()))
            {
                chkAlcohol.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Rules_NoPets"].ToString()))
            {
                chkPets.Checked = true;
            }
            if (!string.IsNullOrEmpty(reader["Rules_OnlyStudents"].ToString()))
            {
                chkStudent.Checked = true;
            }

            txtDescription.Text = reader["Description"].ToString();

            conn.Close();
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string propertyId = Request.QueryString["ID"];
        // Check image file sizes (1 MB = 108576 bytes)
        if ((PropertyImage.HasFile && PropertyImage.PostedFile.ContentLength > 1048576) ||
            (PropertyImage_2.HasFile && PropertyImage_2.PostedFile.ContentLength > 1048576) ||
            (PropertyImage_3.HasFile && PropertyImage_3.PostedFile.ContentLength > 1048576))
        {
            string script1 = "alert('One or more images exceed the 1 MB limit. Please upload smaller images.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script1, true);
            return;
        }

        SqlCommand cmd = new SqlCommand("EditProperty", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@PropertyName", txtPropertyName.Text);
        cmd.Parameters.AddWithValue("@PropertyType", ddlPropertyType.Text);
        cmd.Parameters.AddWithValue("@Gender", ddlTenantGender.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@City", txtCity.Text);
        cmd.Parameters.AddWithValue("@Landmark", txtLandmark.Text);
        cmd.Parameters.AddWithValue("@Pin", txtPincode.Text);

        cmd.Parameters.AddWithValue("@PropertyId", propertyId);

        cmd.Parameters.AddWithValue("@NumberOfRooms", txtRooms.Text);
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
        cmd.Parameters.AddWithValue("@Facility_Wifi", chkWifi.Checked ? "WiFi" : "");
        cmd.Parameters.AddWithValue("@Facility_Parking", chkParking.Checked ? "Parking" : "");
        cmd.Parameters.AddWithValue("@Facility_Power", chkPower.Checked ? "Power Backup" : "");
        cmd.Parameters.AddWithValue("@Facility_WashingMachine", chkWashingMachine.Checked ? "Washing Machine" : "");
        cmd.Parameters.AddWithValue("@Facility_Geyser", chkGeyser.Checked ? "Geyser" : "");
        cmd.Parameters.AddWithValue("@Facility_CCTV", chkCCTV.Checked ? "CCTV" : "");
        cmd.Parameters.AddWithValue("@Facility_Security", chkSecurity.Checked ? "Security" : "");
        cmd.Parameters.AddWithValue("@Facility_AC", chkAC.Checked ? "AC" : "");
        cmd.Parameters.AddWithValue("@Facility_Water", chkWater.Checked ? "Water Purifier" : "");

        cmd.Parameters.AddWithValue("@Rules_NoSmoking", chkSmoking.Checked ? "No Smoking" : "");
        cmd.Parameters.AddWithValue("@Rules_NoAlcohol", chkAlcohol.Checked ? "No Alcohol" : "");
        cmd.Parameters.AddWithValue("@Rules_NoPets", chkPets.Checked ? "No Pets" : "");
        cmd.Parameters.AddWithValue("@Rules_OnlyStudents", chkStudent.Checked ? "Only Students" : "");

        cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

        cmd.Parameters.AddWithValue("@sUnit", txtSingleUnit.Text);
        cmd.Parameters.AddWithValue("@sRent", txtSingleRent.Text);
        cmd.Parameters.AddWithValue("@sSize", txtSingleSize.Text);

        cmd.Parameters.AddWithValue("@dUnit", txtDoubleUnit.Text);
        cmd.Parameters.AddWithValue("@dRent", txtSingleRent.Text);
        cmd.Parameters.AddWithValue("@dSize", txtSingleSize.Text);

        cmd.Parameters.AddWithValue("@tUnit", txtTripleUnit.Text);
        cmd.Parameters.AddWithValue("@tRent", txtTripleRent.Text);
        cmd.Parameters.AddWithValue("@tSize", txtTripleSize.Text);



        if (PropertyImage.HasFile)
        {
            using (BinaryReader br = new BinaryReader(PropertyImage.PostedFile.InputStream))
            {
                byte[] imagedata = br.ReadBytes(PropertyImage.PostedFile.ContentLength);
                cmd.Parameters.Add("@PropertyImage", SqlDbType.VarBinary).Value = imagedata;
            }
        }
        else
        {
            cmd.Parameters.Add("@PropertyImage", SqlDbType.VarBinary).Value = DBNull.Value;
        }

        if (PropertyImage_2.HasFile)
        {
            using (BinaryReader br = new BinaryReader(PropertyImage_2.PostedFile.InputStream))
            {
                byte[] imagedata2 = br.ReadBytes(PropertyImage_2.PostedFile.ContentLength);
                cmd.Parameters.Add("@PropertyImage_2", SqlDbType.VarBinary).Value = imagedata2;
            }
        }
        else
        {
            cmd.Parameters.Add("@PropertyImage_2", SqlDbType.VarBinary).Value = DBNull.Value;
        }

        if (PropertyImage_3.HasFile)
        {
            using (BinaryReader br = new BinaryReader(PropertyImage_3.PostedFile.InputStream))
            {
                byte[] imagedata3 = br.ReadBytes(PropertyImage_3.PostedFile.ContentLength);
                cmd.Parameters.Add("@PropertyImage_3", SqlDbType.VarBinary).Value = imagedata3;
            }
        }
        else
        {
            cmd.Parameters.Add("@PropertyImage_3", SqlDbType.VarBinary).Value = DBNull.Value;
        }


        conn.Open();

        cmd.ExecuteNonQuery();
        conn.Close();

        string script2 = "alert('Property details updated successfully.');";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", script2, true);
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PropertyOwner/PropertyList.aspx");
    }
    
}