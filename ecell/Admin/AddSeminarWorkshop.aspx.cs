using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddSeminarWorkshop : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
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
            //string sqlToInsert = "insert into tblSeminarNWorkshop (title,date,time,venue,description,organisedBy) VALUES (@title,@date,@time,@venue,@description,@organisedBy',getdate())";
            string sqlToInsert = "insert into tblSeminarNWorkshop (title,wdate,wtime,venue,wdescription,organisedBy,dt) VALUES (@title,@wdate,@wtime,@venue,@wdescription,@organisedBy,getdate())";


            // Create command
            adapter.InsertCommand = new SqlCommand(sqlToInsert, con);



            // Create parameters
            adapter.InsertCommand.Parameters.AddWithValue("@title", TextBox1.Text);
            adapter.InsertCommand.Parameters.AddWithValue("@wdate", TextBox2.Text);
            adapter.InsertCommand.Parameters.AddWithValue("@wtime", TextBox3.Text);
            adapter.InsertCommand.Parameters.AddWithValue("@venue", TextBox4.Text);
            adapter.InsertCommand.Parameters.AddWithValue("@wdescription", TextBox6.Text);
            adapter.InsertCommand.Parameters.AddWithValue("@organisedBy", TextBox5.Text);

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

             if(rowsAffected != 0)
             {
                 ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Added.')", true);
                 lblStatus.Text = "Successfully Added.";
                 TextBox1.Text = string.Empty;
                 TextBox2.Text = string.Empty;
                 TextBox3.Text = string.Empty;
                 TextBox4.Text = string.Empty;
                 TextBox5.Text = string.Empty;
                 TextBox6.Text = string.Empty;
             }

        }
         catch (Exception ex)
         {

             ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : " + ex.Message + "')", true);
             lblStatus.Text = "Error : " + ex.Message;
         }
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;
    }


}