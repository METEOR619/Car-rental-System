using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_ModelDetails : System.Web.UI.Page
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
            Bind_DDLGear();
            Bind_DDLFuel();
            Bind_DDLState();
        }
    }

    protected void DDLCarBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_DDLCarModel();
    }

    protected void DDLSelectState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_DDLCity();
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

    public void Bind_DDLGear()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLGear";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLSelectGear.DataSource = dr;
        DDLSelectGear.DataTextField = "GearType";
        DDLSelectGear.DataValueField = "GearID";
        DDLSelectGear.DataBind();
        DDLSelectGear.Items.Insert(0, "-- Select Gear Type --");
        cn.Close();
    }

    public void Bind_DDLFuel()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLFuel";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLSelectFuel.DataSource = dr;
        DDLSelectFuel.DataTextField = "FuelType";
        DDLSelectFuel.DataValueField = "FuelID";
        DDLSelectFuel.DataBind();
        DDLSelectFuel.Items.Insert(0, "-- Select Fuel Type --");
        cn.Close();
    }

    public void Bind_DDLState()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLState";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLSelectState.DataSource = dr;
        DDLSelectState.DataTextField = "StateName";
        DDLSelectState.DataValueField = "StateID";
        DDLSelectState.DataBind();
        DDLSelectState.Items.Insert(0, "-- Select State --");
        cn.Close();
    }

    public void Bind_DDLCity()
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

    protected void btnAddModelDetails_Click(object sender, EventArgs e)
    {
        try 
        {
            cn.Open();
            qry = "AddModelDetails";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@ModelID",DDLCarModel.SelectedValue);
            cmd.Parameters.AddWithValue("@Seats",DDLSelectSeats.SelectedValue);
            cmd.Parameters.AddWithValue("@BagSpace",DDLSelectBagSpace.SelectedValue);
            cmd.Parameters.AddWithValue("@GearID",DDLSelectGear.SelectedValue);
            cmd.Parameters.AddWithValue("@FuelID",DDLSelectFuel.SelectedValue);
            cmd.Parameters.AddWithValue("@AirCondition",DDLSelectAC.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Airbag",DDLSelectAirBag.SelectedValue);
            cmd.Parameters.AddWithValue("@StateID",DDLSelectState.SelectedValue);
            cmd.Parameters.AddWithValue("@CityID",DDLSelectCity.SelectedValue);
            cmd.Parameters.AddWithValue("@Price",txtPrice.Text);
            cmd.Parameters.AddWithValue("@IsActive", DDLIsActive.SelectedValue);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Model Deatils Added Successfully...')</script>");
            DDLCarBrand.ClearSelection();
            DDLCarModel.Items.Clear();
            DDLSelectSeats.ClearSelection();
            DDLSelectBagSpace.ClearSelection();
            DDLSelectGear.ClearSelection();
            DDLSelectFuel.ClearSelection();
            DDLSelectAC.ClearSelection();
            DDLSelectAirBag.ClearSelection();
            DDLSelectState.ClearSelection();
            DDLSelectCity.Items.Clear();
            DDLIsActive.Items.Clear();
            txtPrice.Text = "";
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something Went Wrong!')</script>");
            DDLCarBrand.ClearSelection();
            DDLCarModel.Items.Clear();
            DDLSelectSeats.ClearSelection();
            DDLSelectBagSpace.ClearSelection();
            DDLSelectGear.ClearSelection();
            DDLSelectFuel.ClearSelection();
            DDLSelectAC.ClearSelection();
            DDLSelectAirBag.ClearSelection();
            DDLSelectState.ClearSelection();
            DDLSelectCity.Items.Clear();
            DDLIsActive.Items.Clear();
            txtPrice.Text = "";
            cn.Close();
        }
    }

}