using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditProfile : System.Web.UI.Page
{

    public static string conString = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
    SqlConnection con = new SqlConnection(conString);
    SqlDataAdapter adapter;
    DataSet dataSet;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDetails();
        }

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
    }

    private void GetDetails()
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

            string sql = "select id, userId, email FROM tblAdminDetails";

            adapter.SelectCommand = new SqlCommand(sql, con);

            dataSet = new DataSet();
            adapter.Fill(dataSet, "tblAdminDetails");

            DataTable table = dataSet.Tables["tblAdminDetails"];

            DataRow row = table.Rows[0];

            txtUserId.Text = row[1].ToString();
            txtEmail.Text = row[2].ToString();
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        GetDetails();
    }


    protected void btnSave_Click(object sender, EventArgs e)
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

            string sql = "update tblAdminDetails SET userId = @userId,email = @email WHERE id = 1";

            adapter.UpdateCommand = new SqlCommand(sql, con);

            adapter.UpdateCommand.Parameters.AddWithValue("@userId", txtUserId.Text);
            adapter.UpdateCommand.Parameters.AddWithValue("@email", txtEmail.Text);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            int rowsAffected = adapter.UpdateCommand.ExecuteNonQuery();

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            if (rowsAffected != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Profile updated successfully')", true);
                GetDetails();
            }
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);
        }

    }
}