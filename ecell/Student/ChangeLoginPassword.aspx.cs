using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChangeLoginPassword : System.Web.UI.Page
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
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtOldPassword.Text = string.Empty;
        txtNewPassword.Text = string.Empty;
        txtRetypeNewPassword.Text = string.Empty;

    }


    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        try
        {
            /******       CREATION OF NECCESSARY OBJECTS    ********/

            if (adapter == null)
            {
                adapter = new SqlDataAdapter();
                adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            }

            /**********************************************************/

            string LoggedInUserId = Session["LoggedInUserId"].ToString();
            string sqlToFecth = "select pass FROM tblStudentRegistration where id = @id";

            adapter.SelectCommand = new SqlCommand(sqlToFecth, con);

            adapter.SelectCommand.Parameters.AddWithValue("@id", LoggedInUserId);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            //int rowsAffected = adapter.InsertCommand.ExecuteNonQuery();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            dataSet = new DataSet();
            adapter.Fill(dataSet, "tblStudentRegistration");

            DataTable table = dataSet.Tables["tblStudentRegistration"];
            DataRow row = table.Rows[0];

            string oldPassword = row[0].ToString();

            if (txtOldPassword.Text == oldPassword)
            {

                adapter = null;
                dataSet = null;

                /******       CREATION OF NECCESSARY OBJECTS    ********/

                if (adapter == null)
                {
                    adapter = new SqlDataAdapter();
                    adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                }

                /**********************************************************/

                string sqlToUpdate = "update tblStudentRegistration SET  pass = @pass WHERE id = @id";

                adapter.UpdateCommand = new SqlCommand(sqlToUpdate, con);

                adapter.UpdateCommand.Parameters.AddWithValue("@pass", txtNewPassword.Text);
                adapter.UpdateCommand.Parameters.AddWithValue("@id", LoggedInUserId);

                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                int rowsAffected = adapter.UpdateCommand.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                if (rowsAffected != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password successfully changed')", true);
                }


            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Password incorrect')", true);

            }
        }
        catch (Exception ex)
        {
            
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '" + ex.Message +")", true);
        }
        txtOldPassword.Text = string.Empty;
        txtNewPassword.Text = string.Empty;
        txtRetypeNewPassword.Text = string.Empty;

    }
}