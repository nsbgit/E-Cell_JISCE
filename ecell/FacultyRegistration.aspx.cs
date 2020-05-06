using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacultyRegistration : System.Web.UI.Page
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
        TextBoxFirstName.Text = string.Empty;
        TextBoxLastName.Text = string.Empty;
        TextBoxEmail.Text = string.Empty;
        TextBoxMobile.Text = string.Empty;
        //TextBoxye.Text = string.Empty;
        DropDownListYear.SelectedIndex = 0;
        TextBoxDepartment.Text = string.Empty;
        TextBoxDoorNStreet.Text = string.Empty;
        TextBoxRlyStation.Text = string.Empty;
        TextBoxPO.Text = string.Empty;
        TextBoxPostalCode.Text = string.Empty;
        TextBoxDistrict.Text = string.Empty;
        TextBoxState.Text = string.Empty;
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (lblDuplicateEmail.Text != "This email id is already registered with us.")
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

                // generate strings
                string password = new SomeFunctionalities().CreateStrongPassword();
                string sqlToInsert = "insert into tblFacultyRegistration (firstName,lastName,email,pass,mobileNumber,joiningYear,department,doorNStreet,rlyStation,po,postalCode,district,state,status,dt) VALUES (@firstName,@lastName,@email,@pass,@mobileNumber,@joiningYear,@department,@doorNStreet,@rlyStation,@po,@postalCode,@district,@state,'Deactivated',getdate())";


                // Create command
                adapter.InsertCommand = new SqlCommand(sqlToInsert, con);



                // Create parameters
                adapter.InsertCommand.Parameters.AddWithValue("@firstName", TextBoxFirstName.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@lastName", TextBoxLastName.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@email", TextBoxEmail.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@pass", password);
                adapter.InsertCommand.Parameters.AddWithValue("@mobileNumber", TextBoxMobile.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@joiningYear", DropDownListYear.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@department", TextBoxDepartment.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@doorNStreet", TextBoxDoorNStreet.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@rlyStation", TextBoxRlyStation.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@po", TextBoxPO.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@postalCode", TextBoxPostalCode.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@district", TextBoxDistrict.Text);
                adapter.InsertCommand.Parameters.AddWithValue("@state", TextBoxState.Text);



                // Execute command
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                int rowsAffected = adapter.InsertCommand.ExecuteNonQuery();
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }


                /************   SEND USER ID AND PASSWORD TO THE PROVIDED MAIL ADDRESS *********/

                //if (rowsAffected != 0)
                //{
                //    string subject = "Account Confirmation Mail";

                //    string message = "Dear Mr./Mrs. " + TextBoxFirstName.Text + " " + TextBoxLastName.Text + "\n"
                //                + "\tYour User ID is : " + TextBoxEmail.Text + "\n"
                //                + "\tYour Password is : " + password + "\n" +
                //                "Please use this information to login into your account.";

                //    //new SomeFunctionalities().SendEmail(TextBoxEmail.Text, subject, message);
                //}



                /************************************************************************************/


                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You have successfully registered. Your User ID and Password will be shortly send to your email address after approval from admin')", true);
                lblStatus.Text = "You have successfully registered. Your User ID and Password will be shortly send to your email address after approval from admin";
                lblStatus.ForeColor = System.Drawing.Color.Green;

                TextBoxFirstName.Text = string.Empty;
                TextBoxLastName.Text = string.Empty;
                TextBoxEmail.Text = string.Empty;
                TextBoxMobile.Text = string.Empty;
                //TextBoxye.Text = string.Empty;
                DropDownListYear.SelectedIndex = 0;
                TextBoxDepartment.Text = string.Empty;
                TextBoxDoorNStreet.Text = string.Empty;
                TextBoxRlyStation.Text = string.Empty;
                TextBoxPO.Text = string.Empty;
                TextBoxPostalCode.Text = string.Empty;
                TextBoxDistrict.Text = string.Empty;
                TextBoxState.Text = string.Empty;
            }
            catch (Exception ex)
            {

                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
                lblStatus.Text = "Error : " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            } 
        }
        else
        {
            lblStatus.Text = "Please use a different email address.";
            lblStatus.ForeColor = System.Drawing.Color.Red;
            TextBoxEmail.Focus();
        }

    }


    protected void TextBoxEmail_TextChanged(object sender, EventArgs e)
    {
        string sqlToCheckDuplicateEmail = "select COUNT(id) FROM tblFacultyRegistration where email = @email";

        /******       CREATION OF NECCESSARY OBJECTS    ********/

        if (adapter == null)
        {
            adapter = new SqlDataAdapter();
            adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
        }

        /**********************************************************/

        adapter.SelectCommand = new SqlCommand(sqlToCheckDuplicateEmail, con);

        adapter.SelectCommand.Parameters.AddWithValue("@email", TextBoxEmail.Text.Trim());

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
            lblDuplicateEmail.Text = "This email id is already registered with us.";
            lblDuplicateEmail.ForeColor = System.Drawing.Color.Red;
            //lblDuplicateEmail.BackColor = System.Drawing.Color.Red;
            TextBoxEmail.Focus();
        }
        else
        {
            lblDuplicateEmail.Text = string.Empty;
        }
        //else
        //{
        //    if (TextBoxEmail.Text != "")
        //    {
        //        lblDuplicateEmail.Text = "Username is Available.";
        //        lblDuplicateEmail.ForeColor = System.Drawing.Color.Green;
        //        //lblDuplicateEmail.BackColor = System.Drawing.Color.Green;
        //        //TextBox10.Focus(); 
        //    }
        //    else
        //    {
        //        lblDuplicateEmail.Text = "Don't leave User Name field blank.";
        //        lblDuplicateEmail.ForeColor = System.Drawing.Color.Red;
        //    }
        //}
    }
}