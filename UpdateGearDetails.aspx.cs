using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_UpdateGearDetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblGearID.Text = Request.QueryString["Gid"];
            txtGearType.Text = Request.QueryString["Gtype"];
        }
    }
    protected void btnUpdateGtype_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateGearType";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@GearID", lblGearID.Text);
            cmd.Parameters.AddWithValue("@GearType", txtGearType.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageGearDetails.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Gear Type Already Added!')</script>");
            cn.Close();
        }
    }
}