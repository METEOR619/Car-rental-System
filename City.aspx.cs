using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_City : System.Web.UI.Page
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
        }
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

    protected void btnAddCity_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            qry = "AddCity";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@StateID", DDLState.SelectedValue);
            cmd.Parameters.AddWithValue("@CityName", txtCity.Text);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('City Added Successfully...')</script>");
            txtCity.Text = "";
            DDLState.ClearSelection();
            cn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('City Already Added...')</script>");
            txtCity.Text = "";
            cn.Close();
        }
    }
}