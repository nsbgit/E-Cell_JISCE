using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// This contains the information of admin like as
/// 1. Admin Email Address
/// 2. Admin Email Password.
/// </summary>
public class DtoAdminDetails
{
    public static string conString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
    SqlConnection con = new SqlConnection(conString);
    SqlDataAdapter adapter;
    DataSet dataSet;


    public DtoAdminDetails()
    {
        //
        // TODO: Add constructor logic here
        //
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }

    private string _adminEmail;
    private string _adminPassword;



    /// <summary>
    /// Returns Admin Email ID
    /// </summary>
    public string AdminEmail
    {
        get
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
                string sql = "select email FROM tblAdminDetails where id = 1";

                // Create command
                adapter.SelectCommand = new SqlCommand(sql, con);

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

                adapter.Fill(dataSet, "tblAdminDetails");

                DataTable table = dataSet.Tables[0];
                DataRow row = table.Rows[0];

                this._adminEmail = row[0].ToString();
            }
            catch (Exception ex)
            {
                
                this._adminEmail = "Not Found";
            }

            return this._adminEmail; 
        }
    }



    /// <summary>
    /// Returns Admin Email Password
    /// </summary>
    public string AdminPassword
    {
        get
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
                string sql = "select emailPass FROM tblAdminDetails where id = 1";

                // Create command
                adapter.SelectCommand = new SqlCommand(sql, con);

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

                adapter.Fill(dataSet, "tblAdminDetails");

                DataTable table = dataSet.Tables[0];
                DataRow row = table.Rows[0];

                this._adminPassword = row[0].ToString();
            }
            catch (Exception ex)
            {

                this._adminPassword = "Not Found";
            }

            return this._adminPassword;
        }
    }


}

    