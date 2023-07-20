using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_Fuel : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddFuelType_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "AddFuelType";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@FuelType", txtFuelType.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Fuel Type Added Successfully...')</script>");
            txtFuelType.Text = "";
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Fuel Type Already Added!')</script>");
            txtFuelType.Text = "";
            cn.Close();
        }
    }
}