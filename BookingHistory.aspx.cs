using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_BookingHistory : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        FillCarList();       
    }
    public void FillCarList()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "GetBookingHistory";
        cmd.Parameters.AddWithValue("@UserID", Session["Uid"]);
        cn.Open();
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            LVCarList1.DataSource = dr;
            LVCarList1.DataBind();
            Panel1.Visible = false;
        }
        else
        {
            Panel1.Visible = true;
        }
        
        cn.Close();
    }
    protected void LVCarList1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblPickUpDate = e.Item.FindControl("lblPickUpDate") as Label;
        lblPickUpDate.Text = Convert.ToDateTime(lblPickUpDate.Text).ToShortDateString();

        Label lblDropOffDate = e.Item.FindControl("lblDropOffDate") as Label;
        lblDropOffDate.Text = Convert.ToDateTime(lblDropOffDate.Text).ToShortDateString();

        Label lblDuration = e.Item.FindControl("lblDuration") as Label;
        lblDuration.Text = lblDuration.Text + " Days";

        Label lblTotal = e.Item.FindControl("lblTotal") as Label;
        lblTotal.Text = "&#8377;" + lblTotal.Text;
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}