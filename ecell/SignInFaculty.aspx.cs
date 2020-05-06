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

        if (Session["LoggedInFUserId"] != null)
        {
            Response.Redirect("~/Faculty/mission.aspx");
        }
        
    }



    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtEmail.Text = string.Empty;
        txtPassword.Text = string.Empty;
    }


    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        string sqlToCheckCorrectLoginDetails = "select count(*) FROM tblFacultyRegistration where email = @email AND pass = @pass AND status = 'Activated'";
        string sqlToFectchUserId = "select id FROM tblFacultyRegistration where email = @email AND pass = @pass AND status = 'Activated'";

        if (adapter == null)
        {
            adapter = new SqlDataAdapter();
            adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
        }


        // Cretate command
        adapter.SelectCommand = new SqlCommand(sqlToCheckCorrectLoginDetails, con);


        // Create parameters
        adapter.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
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
                adapter.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
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
                adapter.Fill(dataSet, "tblFacultyRegistration");
                if (dataSet.Tables["tblFacultyRegistration"].Rows.Count > 0 && dataSet.Tables.Count > 0)
                {
                    string LoggedInFUserId = dataSet.Tables["tblFacultyRegistration"].Rows[0][0].ToString();
                    Session.Add("LoggedInFUserId", LoggedInFUserId);

                    Response.Redirect("~/Faculty/mission.aspx");

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully logged in')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Worng Email or Password or Your Account is not activated')", true);
                txtEmail.Text = string.Empty;
                txtPassword.Text = string.Empty;
            }
        }
    }
}