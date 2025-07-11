﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class General_PropertyDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)  
            {
                int propertyID;
                if (int.TryParse(Request.QueryString["ID"], out propertyID))  
                {
                    LoadPropertyDetails(propertyID);
                    LoadReviews(propertyID);
                    ShowRating(propertyID);

                }
                else
                {
                    Response.Write("<script>alert('Invalid Property ID format');window.location='FindPg_Mess.aspx';</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid or missing Property ID');window.location='FindPg_Mess.aspx';</script>");
            }
        }
    }
    private void LoadPropertyDetails(int propertyID)
    {
        string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT * FROM PropertyDetails WHERE ID = @ID";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ID", propertyID);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblName.Text = reader["PropertyName"].ToString();
                lblDescription.Text = reader["Description"].ToString();
                lblType.Text = reader["PropertyType"].ToString();
                lblFacilities_1.Text = reader["Facility_Wifi"].ToString();
                lblFacilities_2.Text = reader["Facility_Parking"].ToString();
               // lblFacilities_3.Text = reader["Facility_Parking"].ToString();
                lblFacilities_4.Text = reader["Facility_WashingMachine"].ToString();
                lblFacilities_5.Text = reader["Facility_Geyser"].ToString();
                lblFacilities_6.Text = reader["Facility_CCTV"].ToString();
                lblFacilities_7.Text = reader["Facility_Security"].ToString();
                lblFacilities_8.Text = reader["Facility_AC"].ToString();
                lblFacilities_9.Text = reader["Facility_Water"].ToString();

                rules_1.Text = reader["Rules_NoSmoking"].ToString();
                rules_2.Text = reader["Rules_NoAlcohol"].ToString();
                rules_1.Text = reader["Rules_NoPets"].ToString();
                rules_1.Text = reader["Rules_OnlyStudents"].ToString();


                lblNumberOfRooms.Text = reader["NumberOfRooms"].ToString();
                lblOwnerName.Text = reader["OwnerName"].ToString();
                lblAddress.Text = reader["Location"].ToString();
                lblContact.Text = reader["Contact"].ToString();
                lblGender.Text = reader["Gender"].ToString();

                lblSingleRoomRent.Text = reader["SingleRoomRent"].ToString()+" /Month";
                lblSingleRoomSize.Text = reader["SingleRoomSize"].ToString()+" Sqft.";
                lblDoubleRoomRent.Text = reader["DoubleRoomRent"].ToString()+" /Month";
                lblDoubleRoomSize.Text = reader["DoubleRoomSize"].ToString()+" Sqft.";
                lblTripleRoomRent.Text = reader["TripleRoomRent"].ToString()+" /Month";
                lblTripleRoomSize.Text = reader["TripleRoomSize"].ToString()+" Sqft.";

                
               
               

                byte[] imageBytes = (byte[])reader["PropertyImage"];
                string imageBase64 = Convert.ToBase64String(imageBytes);
                PropertyImage1.ImageUrl = "data:image/png;base64," + imageBase64;
                PropertyImage.ImageUrl = "data:image/png;base64," + imageBase64;

                byte[] imageBytes2 = (byte[])reader["PropertyImage_2"];
                string imageBase64_2 = Convert.ToBase64String(imageBytes2);
                PropertyImage2.ImageUrl = "data:image/png;base64," + imageBase64_2;

                byte[] imageBytes3 = (byte[])reader["PropertyImage_3"];
                string imageBase64_3 = Convert.ToBase64String(imageBytes3);
                PropertyImage3.ImageUrl = "data:image/png;base64," + imageBase64_3;
            }
            else
            {
                Response.Write("<script>alert('Property not found');window.location='FindPg_Mess.aspx';</script>");
            }
        }
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/General/FindPg_Mess.aspx");
    }

    protected void btnSubmitReview_Click(object sender, EventArgs e)
    {
        string user = txtUserName.Text;
        int rating = Convert.ToInt32(ddlRating.SelectedValue);
        string review = txtReview.Text;
        int propertyID = Convert.ToInt32(Request.QueryString["ID"]);

        string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            if (txtReview.Text == "" || txtUserName.Text == "" || ddlRating.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter all fields.');", true);
                return;
            }
            else
            {
                string query = "INSERT INTO PropertyReviews (PropertyID, UserName, Rating, ReviewText) VALUES (@PropertyID, @UserName, @Rating, @ReviewText)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PropertyID", propertyID);
                cmd.Parameters.AddWithValue("@UserName", user);
                cmd.Parameters.AddWithValue("@Rating", rating);
                cmd.Parameters.AddWithValue("@ReviewText", review);

                conn.Open();
                cmd.ExecuteNonQuery();

                txtUserName.Text = "";
                txtReview.Text = "";
                ddlRating.ClearSelection();
            }
        }

        LoadReviews(propertyID);
        ShowRating(propertyID);
    }

    private void LoadReviews(int propertyID)
    {
        string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string query = "SELECT UserName, Rating, ReviewText, ReviewDate FROM PropertyReviews WHERE PropertyID = @PropertyID ORDER BY ReviewDate DESC";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@PropertyID", propertyID);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            rptReviews.DataSource = reader;
            rptReviews.DataBind();
        }
    }

    public void ShowRating(int propertyID)
    {
        string connStr = ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string ratingQuery = "SELECT AVG(CAST(Rating AS FLOAT)) FROM PropertyReviews WHERE PropertyID = @ID";
            SqlCommand ratingCmd = new SqlCommand(ratingQuery, conn);
            ratingCmd.Parameters.AddWithValue("@ID", propertyID);

            conn.Open();
            object avgRatingObj = ratingCmd.ExecuteScalar();
            if (avgRatingObj != DBNull.Value)
            {
                double avgRating = Convert.ToDouble(avgRatingObj);
                lblAvgRating.Text = avgRating.ToString("0.0");  
            }
            else
            {
                lblAvgRating.Text = "No rating yet";
            }
        }
    }

     protected void BookingClick(object sender, EventArgs e)
    {
        string propertyId = Request.QueryString["ID"]; 
        if (!string.IsNullOrEmpty(propertyId))
        {
            Session["SelectedPropertyId"] = propertyId;
            Response.Redirect("~/General/UserLogin.aspx");
        }
        else
        {
            Response.Write("<script>alert('Property ID missing');</script>");
        }

    }


}