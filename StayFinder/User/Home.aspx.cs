using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Home : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] != null)
            {
                string email = Session["Email"].ToString();

             RequestsDetails(email);
             lblUserName.Text = Session["Name"].ToString();
            }
            else
            {
                Response.Redirect("~/User/Login.aspx"); // Redirect to login if no session
            }
        }
    }

    private void RequestsDetails(string email)
    {

        SqlCommand cmd = new SqlCommand("FetchUserRequestsDetails", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@UserEmail", email);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            rptRequests.DataSource = reader;
            rptRequests.DataBind();
            lblError.Visible = false; // Hide error label
        }
        else
        {
            rptRequests.DataSource = null;
            rptRequests.DataBind();
            lblError.Visible = true; // Show "No request found"
        }
        conn.Close();

    }
    protected void rptRequests_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "CancelRequest")
        {
            try
            {
                if (e.CommandArgument != null)
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["StayFinderConnection"].ConnectionString))
                    {
                        SqlCommand cmd = new SqlCommand("CancelRequest", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ID", id);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }

                    // Refresh Property List
                    RequestsDetails(Session["Email"].ToString());


                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Error: " + ex.Message + "');", true);
            }
        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/General/index.aspx");
        Session.Clear();
    }
}