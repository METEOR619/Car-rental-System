using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_UpdateFuelDetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblFuelID.Text = Request.QueryString["Fid"];
            txtFuelType.Text = Request.QueryString["Ftype"];
        }
    }
    protected void btnUpdateFtype_Click(object sender, EventArgs e)
    { 
        try
        {
            cn.Open();
            qry = "UpdateFuelType";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@FuelID", lblFuelID.Text);
            cmd.Parameters.AddWithValue("@FuelType", txtFuelType.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageFuel.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Fuel Type Already Added!')</script>");
            cn.Close();
        }
    }
}