using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for SomeFunctionalities
/// </summary>
public class SomeFunctionalities
{
    public SomeFunctionalities()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    public void SendEmail(string to, string subject, string message)
    {
        try
        {
            string sendersEmailAddress = new DtoAdminDetails().AdminEmail;
            string sendersEmailPassword = new DtoAdminDetails().AdminPassword;

            




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
            //MessageBox.Show(ex.Message);
        }
    }



    public string SendEmailWithOptionalAttachment(string to, string subject, string message, FileUpload fuAttachment)
    {
        try
        {

            string sendersEmailAddress = new DtoAdminDetails().AdminEmail;
            string sendersEmailPassword = new DtoAdminDetails().AdminPassword;

            




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


            if (fuAttachment.HasFile)
            {
                msg.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, fuAttachment.FileName));
            }


            client.Send(msg);

            return "Published successfully.";

        }
        catch (Exception ex)
        {
            //MessageBox.Show(ex.Message);
            string temp = "Error : " + ex.Message;
            return temp;
        }
    }


    public string CreateStrongPassword()
    {
        int lengthLowerCase = 4;
        int lengthUpperCase = 4;
        int lengthSpecialSymbol = 2;
        int lengthNumber = 2;


        /******* upper case *******/

        string validUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string validLowerCase = "abcdefghijklmnopqrstuvwxyz";
        string validSpecialSymbol = "!@#$%^&*()_+=-`~|]}[{;:'?.<>,";
        string validNumber = "0123456789";


        string generatedUpperCase = "";
        Random rndUpperCase = new Random();
        while (0 < lengthUpperCase--)
        {
            generatedUpperCase += validUpperCase[rndUpperCase.Next(validUpperCase.Length)];
        }


        /****************************/


        /******* lower case *******/

        string generatedLowerCase = "";
        Random rndLowerCase = new Random();
        while (0 < lengthLowerCase--)
        {
            generatedLowerCase += validLowerCase[rndLowerCase.Next(validLowerCase.Length)];
        }


        /****************************/

        /******* special symbol *******/

        string generatedSpecialSymbol = "";
        Random rndSpecialSymbol = new Random();
        while (0 < lengthSpecialSymbol--)
        {
            generatedSpecialSymbol += validSpecialSymbol[rndSpecialSymbol.Next(validSpecialSymbol.Length)];
        }


        /****************************/

        /******* numbers *******/

        string generatedNumber = "";
        Random rndNumber = new Random();
        while (0 < lengthNumber--)
        {
            generatedNumber += validNumber[rndNumber.Next(validNumber.Length)];
        }


        /****************************/




        //string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        //string res = "";
        //Random rnd = new Random();
        //while (0 < length--)
        //    res += valid[rnd.Next(valid.Length)];
        //return res;

        return (generatedUpperCase + generatedLowerCase + generatedNumber + generatedSpecialSymbol);
    }
}