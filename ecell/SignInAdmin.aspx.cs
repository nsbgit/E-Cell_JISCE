using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignInFaculty : System.Web.UI.Page
{
    public static string conString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
    SqlConnection con = new SqlConnection(conString);
    SqlDataAdapter adapter;
    DataSet dataSet;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }

        if (Session["LoggedInAUserId"] != null)
        {
            Response.Redirect("~/Admin/AdminProfile.aspx");
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtEmail.Text = string.Empty;
        txtPassword.Text = string.Empty;
    }


    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        string sqlToCheckCorrectLoginDetails = "select count(*) FROM tblAdminDetails where userId = @userId AND pass = pass";
        string sqlToFectchUserId = "select id FROM tblAdminDetails where userId = @userId AND pass = pass";

        if (adapter == null)
        {
            adapter = new SqlDataAdapter();
            adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
        }


        // Cretate command
        adapter.SelectCommand = new SqlCommand(sqlToCheckCorrectLoginDetails, con);


        // Create parameters
        adapter.SelectCommand.Parameters.AddWithValue("@userId", txtEmail.Text.Trim());
        adapter.SelectCommand.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());

        if (txtEmail.Text != "" && txtPassword.Text != "")
        {

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            int rowsAffected = Convert.ToInt32(adapter.SelectCommand.ExecuteScalar());
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            if (rowsAffected == 1)
            {
                adapter = null;
                adapter = new SqlDataAdapter();
                adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;

                adapter.SelectCommand = new SqlCommand(sqlToFectchUserId, con);
                adapter.SelectCommand.Parameters.AddWithValue("@userId", txtEmail.Text.Trim());
                adapter.SelectCommand.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //adapter.SelectCommand.ExecuteReader();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }


                if (dataSet == null)
                {
                    dataSet = new DataSet();
                }
                adapter.Fill(dataSet, "tblAdminDetails");
                if (dataSet.Tables["tblAdminDetails"].Rows.Count > 0 && dataSet.Tables.Count > 0)
                {
                    string LoggedInAUserId = dataSet.Tables["tblAdminDetails"].Rows[0][0].ToString();
                    Session.Add("LoggedInAUserId", LoggedInAUserId);

                    Response.Redirect("~/Admin/AdminProfile.aspx");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully logged in')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Worng Email or Password')", true);
                txtEmail.Text = string.Empty;
                txtPassword.Text = string.Empty;
            }
        }
    }
}