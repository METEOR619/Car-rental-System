using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        CarBrand();
        CarCategory();
        CarModel();
        User();
        Booking();
        Payment();
        State();
        City();
        Admin();
    }

    void CarBrand()
    {
        cn.Open();
        qry = "TotalCarBrand";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblCarBrand.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void CarCategory()
    {
        cn.Open();
        qry = "TotalCarCategory";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblCarCategory.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void CarModel()
    {
        cn.Open();
        qry = "TotalCarModel";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblCarModel.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void User()
    {
        cn.Open();
        qry = "TotalUser";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblUser.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void Booking()
    {
        cn.Open();
        qry = "TotalBooking";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblBooking.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void Payment()
    {
        cn.Open();
        qry = "TotalPayment";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblPayment.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void State()
    {
        cn.Open();
        qry = "TotalState";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblState.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void City()
    {
        cn.Open();
        qry = "TotalCity";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblCity.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }

    void Admin()
    {
        cn.Open();
        qry = "TotalAdmin";
        cmd = new SqlCommand(qry, cn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        lblAdmin.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
        cn.Close();
    }
}