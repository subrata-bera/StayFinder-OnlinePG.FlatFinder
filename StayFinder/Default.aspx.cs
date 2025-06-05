using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into ContactUs (Name, Email, Message) values (@Name, @Email, @Message)", conn);
        cmd.Parameters.AddWithValue("@Name", txtName.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        // Clear inputs
        txtName.Text = "";
        txtEmail.Text = "";
        txtMessage.Text = "";

        // Register SweetAlert popup
        string script = @"
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Message Sent!',
                text: 'Thank you for contacting us. We will get back to you soon.',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK'
            });
        </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "popup", script);
    }
}