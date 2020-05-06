using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoggedInAUserId"] != null)
        {
            Session["LoggedInAUserId"] = null;
            Response.Redirect("~/SignInAdmin.aspx");
        }
    }
}