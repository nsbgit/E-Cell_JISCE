using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SeminarWorkshop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblReview = (Label)e.Row.FindControl("Label1");
            string tooltip = lblReview.Text;
            e.Row.Cells[0].Attributes.Add("title", tooltip);


            Label lblReview2 = (Label)e.Row.FindControl("Label2");
            string tooltip2 = lblReview2.Text;
            e.Row.Cells[1].Attributes.Add("title", tooltip2);

            Label lblReview3 = (Label)e.Row.FindControl("Label3");
            string tooltip3 = lblReview3.Text;
            e.Row.Cells[2].Attributes.Add("title", tooltip3);

            Label lblReview4 = (Label)e.Row.FindControl("Label4");
            string tooltip4 = lblReview4.Text;
            e.Row.Cells[3].Attributes.Add("title", tooltip4);

            Label lblReview5 = (Label)e.Row.FindControl("Label5");
            string tooltip5 = lblReview5.Text;
            e.Row.Cells[4].Attributes.Add("title", tooltip5);

            Label lblReview6 = (Label)e.Row.FindControl("Label6");
            string tooltip6 = lblReview6.Text;
            e.Row.Cells[5].Attributes.Add("title", tooltip6);
        }
    }
}