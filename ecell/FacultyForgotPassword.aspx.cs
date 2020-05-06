using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentForgotPassword : System.Web.UI.Page
{
    public static string conString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
    SqlConnection con = new SqlConnection(conString);
    SqlDataAdapter adapter;
    DataSet dataSet;

    string email = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }


    protected void btnSendPass_Click(object sender, EventArgs e)
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

            // Create SQL Command
            string sql = "select COUNT(id) FROM tblFacultyRegistration where email = @email";

            // Create command
            adapter.SelectCommand = new SqlCommand(sql, con);

            // Create parameter
            adapter.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text);

            // Execute command
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            adapter.SelectCommand.ExecuteScalar();
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            dataSet = new DataSet();

            adapter.Fill(dataSet, "tblFacultyRegistration");



            string temp = dataSet.Tables["tblFacultyRegistration"].Rows[0][0].ToString();
            int count = dataSet.Tables["tblFacultyRegistration"].Rows.Count;

            if (count == 1 && temp == "1")
            {
                adapter = null;
                dataSet = null;


                string newPassword = new SomeFunctionalities().CreateStrongPassword();

                /******       CREATION OF NECCESSARY OBJECTS    ********/

                if (adapter == null)
                {
                    adapter = new SqlDataAdapter();
                    adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                }

                SqlDataAdapter adapter2 = new SqlDataAdapter();
                adapter2.MissingSchemaAction = MissingSchemaAction.AddWithKey;


                dataSet = new DataSet();


                /**********************************************************/

                // Create SQL Command
                string sqltoUpdatePassword = "update tblFacultyRegistration SET pass = @pass WHERE email = @email";
                string sqltoFetchDetails = "select firstName, lastName FROM tblFacultyRegistration WHERE email = @email";

                // Create command
                adapter.UpdateCommand = new SqlCommand(sqltoUpdatePassword, con);
                adapter2.SelectCommand = new SqlCommand(sqltoFetchDetails, con);

                // Create parameter
                adapter.UpdateCommand.Parameters.AddWithValue("@pass", newPassword);
                adapter.UpdateCommand.Parameters.AddWithValue("@email", txtEmail.Text);
                adapter2.SelectCommand.Parameters.AddWithValue("@email", txtEmail.Text);

                // Execute command
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                int rowsAffected = adapter.UpdateCommand.ExecuteNonQuery();
                adapter2.SelectCommand.ExecuteScalar();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }



                if (rowsAffected != 0)
                {
                    adapter2.Fill(dataSet, "tblFacultyRegistration");

                    DataTable table = dataSet.Tables[0];
                    DataRow row = table.Rows[0];

                    string firstName = row[0].ToString();
                    string lastName = row[1].ToString();


                    string to = txtEmail.Text;
                    string subject = "Password changed successfully";
                    string body = "Mr./Mrs. " + firstName + " " + lastName + ",\n"
                        + "\tYour password is successfully changed. Your new login details are :\n"
                        + "Email :  " + txtEmail.Text + "\n"
                        + "Password : " + newPassword;

                    new SomeFunctionalities().SendEmail(to, subject, body);

                    lblStatus.Text = "Password successfully reset. To know new password check your mail";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                    txtEmail.Text = string.Empty;

                }
            }
            else
            {
                lblStatus.Text = "This email id is not registered with us.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                txtEmail.Focus();

            }

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
        }
    }
}