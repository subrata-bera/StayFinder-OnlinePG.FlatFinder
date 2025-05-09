﻿using System;
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
            if (Session["Email"] != null)
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
       
        int rent;
        if (!int.TryParse(txtRent.Text, out rent) || rent < 0)
        {
            string script = "alert('Please enter a valid positive number for Rent.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            return;
        }

        else
        {
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

            


            cmd.Parameters.AddWithValue("Rent", txtRent.Text);
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
            cmd.Parameters.AddWithValue("Email", Session["Email"].ToString());


            byte[] imagedata = null;
            byte[] imagedata_2 = null;
            byte[] imagedata_3 = null;
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
            string script = "alert('Property Added Successfull.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
     
        }
    }
}