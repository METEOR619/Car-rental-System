using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_UpdateCity : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_DDLState();
            lblCityID.Text = Request.QueryString["Cid"];
            DefaultState();
        }
    }

    public void DefaultState()
    {
        cn.Open();
        qry = "select * from tbl_City where CityID=" + lblCityID.Text;
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        dr.Read();
        DDLState.SelectedValue = dr["StateID"].ToString();
        txtCityName.Text = dr["CityName"].ToString();
        cn.Close();
    }

    public void Bind_DDLState()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLState";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLState.DataSource = dr;
        DDLState.DataTextField = "StateName";
        DDLState.DataValueField = "StateID";
        DDLState.DataBind();
        DDLState.Items.Insert(0, "-- Select State --");
        cn.Close();
    }

    protected void btnUpdateCity_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "UpdateCity";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@CityID", lblCityID.Text);
            cmd.Parameters.AddWithValue("@StateID", DDLState.SelectedValue);
            cmd.Parameters.AddWithValue("@CityName", txtCityName.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Redirect("ManageCity.aspx");
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('City Name Already Added!')</script>");
            cn.Close();
        }
    }
}