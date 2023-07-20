using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_UpdateCarModel : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_DDLCarBrand();
            Bind_DDLCarCategory();
            lblModelID.Text = Request.QueryString["Mid"];
            DefaulValues();
        }
    }

    public void DefaulValues()
    {
        cn.Open();
        qry = "select * from tbl_Model where ModelID=" + lblModelID.Text;
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        dr.Read();
        DDLCarBrand.SelectedValue = dr["BrandID"].ToString();
        DDLCarCategory.SelectedValue = dr["CategoryID"].ToString();
        txtModelName.Text = dr["ModelName"].ToString();
        cn.Close();
    }

    public void Bind_DDLCarBrand()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLCarBrand";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLCarBrand.DataSource = dr;
        DDLCarBrand.DataTextField = "BrandName";
        DDLCarBrand.DataValueField = "BrandID";
        DDLCarBrand.DataBind();
        DDLCarBrand.Items.Insert(0, "-- Select Car Brand --");
        cn.Close();
    }

    public void Bind_DDLCarCategory()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLCarCategory";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLCarCategory.DataSource = dr;
        DDLCarCategory.DataTextField = "CategoryName";
        DDLCarCategory.DataValueField = "CategoryID";
        DDLCarCategory.DataBind();
        DDLCarCategory.Items.Insert(0, "-- Select Car Category --");
        cn.Close();
    }

    protected void btnUpdateModel_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateModel";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@ModelID", lblModelID.Text);
            cmd.Parameters.AddWithValue("@BrandID", DDLCarBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@CategoryID", DDLCarCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@ModelName", txtModelName.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageCarModel.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Model Name Already Added!')</script>");
            cn.Close();
        }
    }
}