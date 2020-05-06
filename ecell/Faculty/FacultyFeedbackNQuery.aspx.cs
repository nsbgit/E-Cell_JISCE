using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
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

        txtSubject.Text = string.Empty;
        txtMessage.Text = string.Empty;
    }


    protected void btnPublish_Click(object sender, EventArgs e)
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


            /******** FETCH USERS EMAIL ID    ***********/
            string userEmail = string.Empty;
            string sessionLoggedInUserId = Session["LoggedInFUserId"].ToString();
            string sqlUserEmail = "select email FROM tblFacultyRegistration where id = " + sessionLoggedInUserId;

            dataSet = new DataSet();

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            adapter.SelectCommand = new SqlCommand(sqlUserEmail, con);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            adapter.Fill(dataSet, "tblFacultyRegistration");

            DataTable tbl2 = dataSet.Tables["tblFacultyRegistration"];

            DataRow rw2 = tbl2.Rows[0];

            userEmail = rw2[0].ToString();

            /***********************************************/


            string subject = "Feedback/Query (Urgent) - " + txtSubject.Text;
            string message = txtMessage.Text + "\n\n***********\nFrom - " + userEmail + "\n*********** ";


            string sqlToFecthLoginDetails = "select email, emailPass FROM tblAdminDetails where id = 1";

            SqlDataAdapter adapter2 = new SqlDataAdapter();
            adapter2.MissingSchemaAction = MissingSchemaAction.AddWithKey;
            DataSet dataSet2 = new DataSet();

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            adapter2.SelectCommand = new SqlCommand(sqlToFecthLoginDetails, con);
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            adapter2.Fill(dataSet2, "tblAdminDetails");

            DataTable tbl = dataSet2.Tables["tblAdminDetails"];

            DataRow rw = tbl.Rows[0];




            try
            {
                string to = rw[0].ToString();

                string sendersEmailAddress = rw[0].ToString();
                string sendersEmailPassword = rw[1].ToString();


                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Timeout = 10000000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(sendersEmailAddress, sendersEmailPassword);
                MailMessage msg = new MailMessage();

                msg.To.Add(to);
                msg.From = new MailAddress(sendersEmailAddress);
                msg.Subject = subject;
                msg.Body = message;


                client.Send(msg);

            }
            catch (Exception ex)
            {

                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : " + ex.Message + "')", true);
                lblStatus.Text = "Error : " + ex.Message;
            }

        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : " + ex.Message + "')", true);
            lblStatus.Text = "Error : " + ex.Message;
        }

        txtSubject.Text = string.Empty;
        txtMessage.Text = string.Empty;

        lblStatus.Text = "Successfully Sent";
    }
}