using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_CarCategory : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "AddCategory";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@CategoryName", txtCategory.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Category Added Successfully...')</script>");
            txtCategory.Text = "";
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Category Already Added!')</script>");
            txtCategory.Text = "";
            cn.Close();
        }
    }
}