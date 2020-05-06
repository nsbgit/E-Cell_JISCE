using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChangePublishingEmailPassword : System.Web.UI.Page
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

            string sqlToFecth = "select emailPass FROM tblAdminDetails where id = 1";

            adapter.SelectCommand = new SqlCommand(sqlToFecth, con);

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
            adapter.Fill(dataSet, "tblAdminDetails");

            DataTable table = dataSet.Tables["tblAdminDetails"];
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

                string sqlToUpdate = "update tblAdminDetails SET  emailPass = @emailPass WHERE id = 1";

                adapter.UpdateCommand = new SqlCommand(sqlToUpdate, con);

                adapter.UpdateCommand.Parameters.AddWithValue("@emailPass", txtNewPassword.Text);

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

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '" + ex.Message + ")", true);
        }
        txtOldPassword.Text = string.Empty;
        txtNewPassword.Text = string.Empty;
        txtRetypeNewPassword.Text = string.Empty;

    }
}