using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Payment : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);
    string status;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                int bookingId = Convert.ToInt32(Request.QueryString["ID"]);
                LoadAmount(bookingId);
            }
            else
            {
                Response.Redirect("~/User/Login.aspx");
            }
        }
    }
    private void LoadAmount(int bookingId)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("select TotalAmount from BookingRequests where ID = @id", conn);
        cmd.Parameters.AddWithValue("@id", bookingId);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.Read())
        {
            btnPay.Text = "Pay ₹ " + reader["TotalAmount"].ToString();
        }
        conn.Close();

    }
    protected void btnPay_Click(object sender, EventArgs e)
    {
        
        int bookingid = Convert.ToInt32(Request.QueryString["ID"]);
        if (upiId.Text != "" || txtCardNumber.Text != "" || txtCVV.Text != "" || txtExpire.Text != "" || txtName.Text != "" || txtWallet.Text != "" || ddlBank.Text != "")
        {
           
            conn.Open();
            SqlCommand cmdSuccess = new SqlCommand("select PaymentStatus from Payment where BookingId = @bookingid", conn);
            cmdSuccess.Parameters.AddWithValue("@bookingid", bookingid);
            SqlDataReader readerSuccess = cmdSuccess.ExecuteReader();
            if (readerSuccess.Read())
            {
                status = readerSuccess["PaymentStatus"].ToString();
            }
            readerSuccess.Close();
            conn.Close();
            if (status == "Success")
            {
                //string script = "alert('Payment is already done for this booking.');";
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                string script = @"
        <script>
            Swal.fire({
                icon: 'info',
                title: 'Paid',
                text: 'Payment is already done for this booking.',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK'
            });
        </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "popup", script);
            }
              
            
            else
            {

                conn.Open();
                string amount = "";
               
                SqlCommand cmdAmount = new SqlCommand("select TotalAmount from BookingRequests where ID = @id", conn);
                cmdAmount.Parameters.AddWithValue("@id", bookingid);
                SqlDataReader reader = cmdAmount.ExecuteReader();
                if (reader.Read())
                {
                    amount = reader["TotalAmount"].ToString();
                }
                reader.Close();
                conn.Close();

                SqlCommand cmd = new SqlCommand("insert into Payment (BookingId, Amount, PaymentStatus) values (@Bookingid, @Amount, 'Success')", conn);
                cmd.Parameters.AddWithValue("@bookingid", bookingid);
                cmd.Parameters.AddWithValue("@Amount", amount);
                conn.Open();
                cmdAmount.ExecuteNonQuery();
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/User/Payment_Reciept.aspx");
            }
        }
        else
        {
            string script = "alert('Please enter payment details.');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}