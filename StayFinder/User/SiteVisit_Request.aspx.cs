using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_SiteVisit_Request : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);
    int Rent;
    int TotalRent;
    string selectedText;
    int numberofpeople;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["SelectedPropertyId"] != null)
            {
                string propertyId = Session["SelectedPropertyId"].ToString();
                lblUserName.Text = Session["Name"].ToString();
                

             

            }
            else
            {
                Response.Redirect("~/User/Login.aspx"); 
            }
        }
    }

    private void RentCalculation()
    {
        selectedText = ddlRoomType.SelectedItem.Text;
        numberofpeople = int.Parse(txtNumberOfPeople.Text);
        Rent = 0;

        string query = "";

        if (selectedText == "Single Room")
        {
            query = "SELECT SingleRoomRent AS Rent FROM PropertyDetails WHERE ID = @id";
        }
        else if (selectedText == "Double Room")
        {
            query = "SELECT DoubleRoomRent AS Rent FROM PropertyDetails WHERE ID = @id";
        }
        else if (selectedText == "Triple Room")
        {
            query = "SELECT TripleRoomRent AS Rent FROM PropertyDetails WHERE ID = @id";
        }

        if (!string.IsNullOrEmpty(query))
        {
            using (SqlConnection localConn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, localConn))
                {
                    cmd.Parameters.AddWithValue("@id", Session["SelectedPropertyId"].ToString());
                    localConn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Rent = int.Parse(reader["Rent"].ToString());
                        }
                    }
                }
            }
        }

        TotalRent = Rent * numberofpeople;
    }


    protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
    {
        conn.Open();

        RentCalculation();
        
        if (!string.IsNullOrEmpty(selectedText) && selectedText != "-- Select Your Room Type --")
        {
            string script = "alert('You has been selected " + selectedText + "and your Total rentt is: " + TotalRent + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
        conn.Close();
    }


    protected void submit_Click(object sender, EventArgs e)
    {
        conn.Open();
        RentCalculation();

        string query = "SELECT UserEmail FROM BookingRequests WHERE Mobile = @mobile AND PropertyID = @propertyId";
        SqlDataAdapter adp = new SqlDataAdapter(query, conn);

        // Set parameter values
        adp.SelectCommand.Parameters.AddWithValue("@mobile", txtNumber.Text);
        adp.SelectCommand.Parameters.AddWithValue("@propertyId", Session["SelectedPropertyId"].ToString());
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Your booking request is already submitted.";
        }
        else
        {

            if (DocumentPhoto.HasFile)
            {
                int fileSizeInKB = DocumentPhoto.PostedFile.ContentLength / 1024;
                if (fileSizeInKB > 500)
                {
                    lblError.ForeColor = System.Drawing.Color.Red;
                    lblError.Text = "Document size must be 500 KB or less.";
                    return;
                }
            }


            SqlCommand cmd = new SqlCommand("InsertBookingRequests", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", txtName.Text);
            cmd.Parameters.AddWithValue("@UserEmail", Session["Email"].ToString());
            cmd.Parameters.AddWithValue("@Mobile", txtNumber.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@NumberOfPeople", txtNumberOfPeople.Text);
            cmd.Parameters.AddWithValue("@DocumentType", ddlDocument.Text);
            cmd.Parameters.AddWithValue("@Gender", gender.Text);
            cmd.Parameters.AddWithValue("@BookingDate", txtDate.Text);
            cmd.Parameters.AddWithValue("@PropertyId", Session["SelectedPropertyId"].ToString());
            cmd.Parameters.AddWithValue("@RequestType", Session["RequestType"].ToString());
            cmd.Parameters.AddWithValue("@TotalAmount", TotalRent);
        

            cmd.Parameters.AddWithValue("@RoomType", ddlRoomType.Text);




            string docNumber = "";
            switch (ddlDocument.SelectedValue)
            {
                case "Aadhar Card":
                    docNumber = txtAadhar.Text;
                    break;
                case "Pan Card":
                    docNumber = txtPan.Text;
                    break;
                case "Voter Id":
                    docNumber = txtVoterId.Text;
                    break;
                case "Driving License":
                    docNumber = txtDrivingLicense.Text;
                    break;
            }
            cmd.Parameters.AddWithValue("@DocumentsNumber", docNumber);

            byte[] imagedata = null;
            if (DocumentPhoto.HasFile)
            {
                using (System.IO.BinaryReader br = new System.IO.BinaryReader(DocumentPhoto.PostedFile.InputStream))
                {
                    imagedata = br.ReadBytes(DocumentPhoto.PostedFile.ContentLength);
                }
                cmd.Parameters.AddWithValue("DocumentPhoto", imagedata);
            }
            else
            {
                cmd.Parameters.AddWithValue("@DocumentPhoto", DBNull.Value);
            }

          
            cmd.ExecuteNonQuery();
            conn.Close();
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Data submitted successfully.";


            SqlCommand getIdCmd = new SqlCommand("SELECT TOP 1 ID FROM BookingRequests WHERE Mobile = @Mobile ORDER BY ID DESC", conn);
            getIdCmd.Parameters.AddWithValue("@Mobile", txtNumber.Text);

            conn.Open();
            object idObj = getIdCmd.ExecuteScalar();
            conn.Close();

            if (idObj != null)
            {
                Session["BookingRequestID"] = idObj.ToString(); // Save ID into session
            }

            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Data submitted successfully.";

            Response.Redirect("~/User/ThankYou.aspx");

        }

   


    }

 


}