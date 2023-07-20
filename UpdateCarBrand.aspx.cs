using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_UpdateCarBrand : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblBrandID.Text = Request.QueryString["Bid"];
            txtCarBrand.Text = Request.QueryString["Bname"];
        }
    }
    protected void btnUpdateBrand_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateCarBrand";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@BrandID", lblBrandID.Text);
            cmd.Parameters.AddWithValue("@BrandName", txtCarBrand.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageCarBrand.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Car Brand Already Added!')</script>");
            cn.Close();    
        }   
    }
}