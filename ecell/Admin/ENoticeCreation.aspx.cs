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

public partial class Admin_Default : System.Web.UI.Page
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
        ddlTo.SelectedIndex = 0;
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


            string sql = string.Empty;
            if (ddlTo.SelectedIndex == 1)
            {
                sql = "select email FROM tblStudentRegistration where status = 'Activated'";
            }
            else
            {
                sql = "select email FROM tblFacultyRegistration where status = 'Activated'";
            }

            // Create command
            adapter.SelectCommand = new SqlCommand(sql, con);


            if (dataSet == null)
            {
                dataSet = new DataSet();
            }
            adapter.Fill(dataSet, "tblStudentRegistration");
            if (dataSet.Tables["tblStudentRegistration"].Rows.Count > 0 && dataSet.Tables.Count > 0)
            {
                string subject = txtSubject.Text;
                string message = txtMessage.Text;

                //int count = 0;

                //adapter.Fill(dataSet, "tblStudentRegistration");
                foreach (DataRow row in dataSet.Tables["tblStudentRegistration"].Rows)
                {
                    //string to = row["email"].ToString();
                    ////new SomeFunctionalities().SendEmail(to, subject, message);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + count++ + " " + to + "')", true);

                    try
                    {
                        string tempEmail = row[0].ToString();

                        string sendersEmailAddress = new DtoAdminDetails().AdminEmail;
                        string sendersEmailPassword = new DtoAdminDetails().AdminPassword;


                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.EnableSsl = true;
                        client.Timeout = 10000000;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential(sendersEmailAddress, sendersEmailPassword);
                        MailMessage msg = new MailMessage();

                        msg.To.Add(tempEmail);
                        msg.From = new MailAddress(sendersEmailAddress);
                        msg.Subject = subject;
                        msg.Body = message;

                        if (fuAttachment.HasFile)
                        {
                            msg.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, fuAttachment.FileName));
                        }

                        client.Send(msg);
                        //MessageBox.Show("Email sent sucssefully");
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Successfully Sent')", true);
                        
                    }
                    catch (Exception ex)
                    {
                        //MessageBox.Show(ex.Message);
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : " + ex.Message + "')", true);
                    }


                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Notice published sucssefully')", true);
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No person available to publish the notice.')", true);
                ddlTo.SelectedIndex = 0;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }

            

            
 
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : " + ex.Message + "')", true);
        }
    }
}