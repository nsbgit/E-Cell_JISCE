using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_logOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoggedInUserId"] != null)
        {
            Session["LoggedInUserId"] = null;
            Response.Redirect("~/SignInStudent.aspx");
        }
    }
}