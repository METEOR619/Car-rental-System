using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_UpdateCarCategory : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblCategoryID.Text = Request.QueryString["Cid"];
            txtCategory.Text = Request.QueryString["Cname"];
        }
    }

    protected void btnUpdateCategory_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateCarCategory";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@CategoryID", lblCategoryID.Text);
            cmd.Parameters.AddWithValue("@CategoryName", txtCategory.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageCarCategory.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Car Category Already Added!')</script>");
            cn.Close();
        }
    }
}