using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PropertyOwner_AddProperty : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] != null && Session["ID"] != null && Session["Name"] != null)
            {
                string email = Session["Email"].ToString();
               // LoadUserProfile(email);
            }
            else
            {
                Response.Redirect("~/General/PropertyOwnerLogin.aspx");             }
        }
    }


    protected void Submit_Click(object sender, EventArgs e)
    {
        // Check image file sizes (1 MB = 108576 bytes)
        if ((PropertyImage.HasFile && PropertyImage.PostedFile.ContentLength > 1048576) ||
            (PropertyImage_2.HasFile && PropertyImage_2.PostedFile.ContentLength > 1048576) ||
            (PropertyImage_3.HasFile && PropertyImage_3.PostedFile.ContentLength > 1048576))
        {
            string script = "alert('One or more images exceed the 1 MB limit. Please upload smaller images.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            return;
        }

        conn.Open();
        SqlCommand cmd = new SqlCommand("InsertPropertyDetails", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("PropertyName", txtPropertyName.Text);
        cmd.Parameters.AddWithValue("PropertyType", ddlPropertyType.Text);
        cmd.Parameters.AddWithValue("Gender", ddlGender.Text);
        cmd.Parameters.AddWithValue("Location", txtAddress.Text);
        cmd.Parameters.AddWithValue("City", txtCity.Text);
        cmd.Parameters.AddWithValue("Landmark", txtLandmark.Text);
        cmd.Parameters.AddWithValue("Pin", txtpin.Text);

        cmd.Parameters.AddWithValue("NumberOfRooms", txtRooms.Text);
        cmd.Parameters.AddWithValue("Description", txtDescription.Text);
        cmd.Parameters.AddWithValue("Facility_Wifi", chkWifi.Checked ? "WiFi" : "");
        cmd.Parameters.AddWithValue("Facility_Parking", chkParking.Checked ? "Parking" : "");
        cmd.Parameters.AddWithValue("Facility_Power", chkPower.Checked ? "Power Backup" : "");
        cmd.Parameters.AddWithValue("Facility_WashingMachine", ChkWashingMachine.Checked ? "Washing Machine" : "");
        cmd.Parameters.AddWithValue("Facility_Geyser", chkGeyser.Checked ? "Geyser" : "");
        cmd.Parameters.AddWithValue("Facility_CCTV", chkCCTV.Checked ? "CCTV" : "");
        cmd.Parameters.AddWithValue("Facility_Security", chkSecurity.Checked ? "Security" : "");
        cmd.Parameters.AddWithValue("Facility_AC", chkAC.Checked ? "AC" : "");
        cmd.Parameters.AddWithValue("Facility_Water", chkWater.Checked ? "Water Purifier" : "");

        cmd.Parameters.AddWithValue("Rules_NoSmoking", chkSmoking.Checked ? "No Smoking" : "");
        cmd.Parameters.AddWithValue("Rules_NoAlcohol", chkAlcohol.Checked ? "No Alcohol" : "");
        cmd.Parameters.AddWithValue("Rules_NoPets", chkPets.Checked ? "No Pets" : "");
        cmd.Parameters.AddWithValue("Rules_OnlyStudents", chkStudent.Checked ? "Only Students" : "");

        cmd.Parameters.AddWithValue("Contact", txtContact.Text);
        cmd.Parameters.AddWithValue("OwnerName", Session["Name"].ToString());
        cmd.Parameters.AddWithValue("Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@OwnerId", Session["ID"].ToString());

        cmd.Parameters.AddWithValue("@SingleRoomUnit", txtSingleRoomUnit.Text);
        cmd.Parameters.AddWithValue("@SingleRoomRent", txtSingleRoomRent.Text);
        cmd.Parameters.AddWithValue("@DoubleRoomUnit", txtDoubleRoomUnit.Text);
        cmd.Parameters.AddWithValue("@DoubleRoomRent", txtDoubleRoomRent.Text);
        cmd.Parameters.AddWithValue("@TripleRoomUnit", txtTripleRoomUnit.Text);
        cmd.Parameters.AddWithValue("@TripleRoomRent", txtTripleRoomRent.Text);

        cmd.Parameters.AddWithValue("@SingleRoomSize", txtSingleRoomSize.Text);
        cmd.Parameters.AddWithValue("@DoubleRoomSize", txtDoubleRoomSize.Text);
        cmd.Parameters.AddWithValue("@TripleRoomSize", txtTripleRoomSize.Text);

        byte[] imagedata = null, imagedata_2 = null, imagedata_3 = null;

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

        if (PropertyImage_2.HasFile)
        {
            using (System.IO.BinaryReader br = new System.IO.BinaryReader(PropertyImage_2.PostedFile.InputStream))
            {
                imagedata_2 = br.ReadBytes(PropertyImage_2.PostedFile.ContentLength);
            }
            cmd.Parameters.AddWithValue("PropertyImage_2", imagedata_2);
        }
        else
        {
            cmd.Parameters.AddWithValue("@PropertyImage_2", DBNull.Value);
        }

        if (PropertyImage_3.HasFile)
        {
            using (System.IO.BinaryReader br = new System.IO.BinaryReader(PropertyImage_3.PostedFile.InputStream))
            {
                imagedata_3 = br.ReadBytes(PropertyImage_3.PostedFile.ContentLength);
            }
            cmd.Parameters.AddWithValue("PropertyImage_3", imagedata_3);
        }
        else
        {
            cmd.Parameters.AddWithValue("@PropertyImage_3", DBNull.Value);
        }

        cmd.ExecuteNonQuery();
        conn.Close();

        string successScript = "alert('Property added successfully.');";
        ClientScript.RegisterStartupScript(this.GetType(), "alert", successScript, true);
    }

}