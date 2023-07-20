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
            DDLSelectState.SelectedValue = Session["State"].ToString();
            txtPickUpDate.Text = Session["PickUpDate"].ToString();
            txtDropOffDate.Text = Session["DropOffDate"].ToString();

            Bind_DDLState();
            Bind_DDLCarBrand();
            Bind_DDLCarCategory();
            Bind_DDLFuelType();
            Bind_DDLGearType();
            Bind_DDLCity();
            FillCarList();
        }
    }

    protected void DDLSelectState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["State"] = DDLSelectState.SelectedValue;
        Bind_DDLCity();
    }

    protected void DDLSelectCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["City"] = DDLSelectCity.SelectedValue;
        FillCarList();
    }

    protected void txtPickUpDate_TextChanged(object sender, EventArgs e)
    {
        Session["PickUpDate"] = txtPickUpDate.Text;
    }
    protected void txtDropOffDate_TextChanged(object sender, EventArgs e)
    {
        Session["DropOffDate"] = txtDropOffDate.Text;
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        filter();
    }

    protected void btnClearFilter_Click(object sender, EventArgs e)
    {
        btnClearFilter.Visible = false;
        DDLCarCategory.ClearSelection();
        DDLCarBrand.ClearSelection();
        DDLFuelType.ClearSelection();
        DDLGearType.ClearSelection();
        FillCarList();
    }

    public void Bind_DDLState()
    {
        cn.Open();
        qry = "DDLState";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        DDLSelectState.DataSource = dr;
        DDLSelectState.DataTextField = "StateName";
        DDLSelectState.DataValueField = "StateID";
        DDLSelectState.Items.Insert(0, "-- Select State --");
        DDLSelectState.DataBind();
        cn.Close();
    }

    public void Bind_DDLCity()
    {
        if (!IsPostBack)
        {
            cn.Open();
            qry = "DDLCity";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@StateID", Session["State"]);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            DDLSelectCity.DataSource = dr;
            DDLSelectCity.DataTextField = "CityName";
            DDLSelectCity.DataValueField = "CityID";
            DDLSelectCity.Items.Insert(0, "-- Select City --");
            DDLSelectCity.DataBind();
            DDLSelectCity.SelectedValue = Session["City"].ToString();
            cn.Close();
        }
        else
        {
            if (DDLSelectState.SelectedItem.Value != "-- Select State --")
            {
                DDLSelectCity.Items.Clear();
                cmd.Connection = cn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "DDLCity";
                cmd.Parameters.AddWithValue("@StateID", DDLSelectState.SelectedValue);

                cn.Open();
                dr = cmd.ExecuteReader();
                DDLSelectCity.DataSource = dr;
                DDLSelectCity.DataTextField = "CityName";
                DDLSelectCity.DataValueField = "CityID";
                DDLSelectCity.DataBind();
                DDLSelectCity.Items.Insert(0, "-- Select City --");
                cn.Close();
            }
            if (DDLSelectState.SelectedItem.Value == "-- Select State --")
            {
                DDLSelectCity.Items.Clear();
            }
        }
        
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

    public void Bind_DDLFuelType()
    {
        cn.Open();
        qry = "DDLFuel";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        DDLFuelType.DataSource = dr;
        DDLFuelType.DataTextField = "FuelType";
        DDLFuelType.DataValueField = "FuelID";
        DDLFuelType.Items.Insert(0, "-- Select Fuel --");
        DDLFuelType.DataBind();
        cn.Close();
    }

    public void Bind_DDLGearType()
    {
        cn.Open();
        qry = "DDLGear";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        DDLGearType.DataSource = dr;
        DDLGearType.DataTextField = "GearType";
        DDLGearType.DataValueField = "GearID";
        DDLGearType.Items.Insert(0, "-- Select Gear --");
        DDLGearType.DataBind();
        cn.Close();
    }
    
    public void FillCarList()
    {   
        cn.Open();
        qry = "CarList";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@CityID", Session["City"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        LVCarList1.DataSource = dr;
        LVCarList1.DataBind();
        dr.Close();
        dr = cmd.ExecuteReader();
        LVCarList2.DataSource = dr;
        LVCarList2.DataBind();
        cn.Close();
    }

    public void filter()
    {
        try
        {
            cn.Open();
            qry = "CarList1";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@CityID", Session["City"]);
            cmd.Parameters.AddWithValue("@CategoryID", DDLCarCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@BrandID", DDLCarBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@FuelID", DDLFuelType.SelectedValue);
            cmd.Parameters.AddWithValue("@GearID", DDLGearType.SelectedValue);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            dr = cmd.ExecuteReader();
            LVCarList1.DataSource = dr;
            LVCarList1.DataBind();
            dr.Close();
            dr = cmd.ExecuteReader();
            LVCarList2.DataSource = dr;
            LVCarList2.DataBind();
            cn.Close();
            btnClearFilter.Visible = true;
        }
        catch
        {
            Response.Write("<script> alert('Please Select All The Values!') </script>");
            cn.Close();
        }
    }
}
