using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ApproveFaculty : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }

        if (Page.IsPostBack != true)
        {
            Getcustomers();
        }
    }

    private void Getcustomers()
    {
        da = new SqlDataAdapter("SELECT [id], [firstName], [lastName], [email], [department], [mobileNumber], [status] FROM [tblFacultyRegistration] ORDER BY [status] DESC, [dt] DESC", con);
        ds = new DataSet();
        da.Fill(ds, "tblFacultyRegistration");
        GridView1.DataSource = ds.Tables["tblFacultyRegistration"].DefaultView;
        GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Artist")
        {
            int sessionLoggedInUserId = Convert.ToInt32(e.CommandArgument.ToString());
            string sql1 = "select status FROM tblFacultyRegistration where id = " + sessionLoggedInUserId;

             da = new SqlDataAdapter(sql1, con);
            ds = new DataSet();
            da.Fill(ds, "tblFacultyRegistration");
            if (ds.Tables.Count > 0 && ds.Tables["tblFacultyRegistration"].Rows.Count > 0)
            {

                if (ds.Tables["tblFacultyRegistration"].Rows[0][0].ToString() == "Activated")
                {
                    da = new SqlDataAdapter("update tblFacultyRegistration set status='Deactivated' where  id = " + sessionLoggedInUserId, con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    int n = da.SelectCommand.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }

                    if (n == 1)
                    {
                        Getcustomers();
                    }
                }

                else if (ds.Tables["tblFacultyRegistration"].Rows[0][0].ToString() == "Deactivated")
                {

                    da = new SqlDataAdapter("update tblFacultyRegistration set status='Activated' where  id = " + sessionLoggedInUserId, con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    int n = da.SelectCommand.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }

                    da = null;
                    da = new SqlDataAdapter("select firstName, lastName, email, pass FROM tblFacultyRegistration where  id = " + sessionLoggedInUserId, con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    int m = da.SelectCommand.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    if (n == 1)
                    {

                        DataSet dataset = new DataSet();


                        da.Fill(dataset, "tblFacultyRegistration");

                        DataTable table = dataset.Tables["tblFacultyRegistration"];

                        DataRow row = table.Rows[0];

                        string firstName = row[0].ToString();
                        string lastName = row[1].ToString();
                        string email = row[2].ToString();
                        string pass = row[3].ToString();

                        /************   SEND USER ID AND PASSWORD TO THE PROVIDED MAIL ADDRESS *********/

                        if (m != 0)
                        {
                            string subject = "Account Confirmation Mail";

                            string message = "Dear Mr./Mrs. " + firstName + " " + lastName + "\n"
                                        + "\tYour User ID is : " + email + "\n"
                                        + "\tYour Password is : " + pass + "\n" +
                                        "Please use this information to login into your account.";

                            new SomeFunctionalities().SendEmail(email, subject, message);
                        }
                        Getcustomers();
                    }                
                }
            }
        }
    }

}