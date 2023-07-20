using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_CarList : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["City"] == null) 
        {
            Response.Redirect("Home.aspx");
        }
        if (!IsPostBack)
        {
            Bind_DDLCarBrand();
            Bind_DDLCarCategory();
            FillCarList();
        }
    }

    protected void DDLCarBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_DDLCarModel();
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

    public void Bind_DDLCarModel()
    {
        if (DDLCarBrand.SelectedItem.Value != "-- Select Car Brand --")
        {
            DDLCarModel.Items.Clear();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DDLCarModel";
            cmd.Parameters.AddWithValue("@BrandID", DDLCarBrand.SelectedValue);
            cn.Open();
            dr = cmd.ExecuteReader();
            DDLCarModel.DataSource = dr;
            DDLCarModel.DataTextField = "ModelName";
            DDLCarModel.DataValueField = "ModelID";
            DDLCarModel.DataBind();
            DDLCarModel.Items.Insert(0, "-- Select Car Model --");
            cn.Close();
        }
        if (DDLCarBrand.SelectedItem.Value == "-- Select Car Brand --")
        {
            DDLCarModel.Items.Clear();
        }
    }

    public void FillCarList()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "CarList";
        cmd.Parameters.AddWithValue("@CityID", Session["City"]);
        cn.Open();
        dr = cmd.ExecuteReader();
        LVCarList1.DataSource = dr;
        LVCarList1.DataBind();
        dr.Close();
        dr = cmd.ExecuteReader();
        LVCarList2.DataSource = dr;
        LVCarList2.DataBind();
        cn.Close();
    }
}
