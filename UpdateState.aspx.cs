using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_UpdateState : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblStateID.Text = Request.QueryString["Sid"];
            txtStateName.Text = Request.QueryString["SName"];
        }
    }
    protected void btnUpdateState_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateState";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@StateID", lblStateID.Text);
            cmd.Parameters.AddWithValue("@StateName", txtStateName.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageState.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('State Name Already Added!')</script>");
            cn.Close();
        }
    }
}