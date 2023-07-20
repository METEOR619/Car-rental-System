using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_Home : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_DDLState();
        }
    }

    protected void DDLSelectState_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind_DDLCity();
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
    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DateTime dt1 = Convert.ToDateTime(txtPickUpDate.Text);
        DateTime dt2 = Convert.ToDateTime(txtDropOffDate.Text);

        TimeSpan diff = dt2 - dt1;
        int total = diff.Days;

        Session["PickUpDate"] = txtPickUpDate.Text;
        Session["DropOffDate"] = txtDropOffDate.Text;
        Session["State"] = DDLSelectState.SelectedValue;
        Session["City"] = DDLSelectCity.SelectedValue;
        Session["Days"] = total;

        Response.Redirect("CarList.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.ToString() == "-- Select State --")
        {
            args.IsValid = false;
        }
    }
}