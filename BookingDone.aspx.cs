using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_BookingDone : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblBookingNo.Text = "#" + Session["BookingID"].ToString();
        lblPickUpDate.Text = Session["PickUpDate"].ToString();
        lblDropOffDate.Text = Session["DropOffDate"].ToString();
        lblBrandName.Text = Session["BrandName"].ToString();
        lblModelName.Text = Session["ModelName"].ToString();
        lblCityName.Text = Session["CityName"].ToString();
        lblTotal.Text = "&#8377 " + Session["Total"].ToString();
        BookingDetails();
    }

    void BookingDetails()
    {
        cn.Open();
        qry = "GetBookingDetails";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@BookingID", Session["BookingID"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        { 
            lblFName.Text = dr["FName"].ToString();
            lblLName.Text = dr["LName"].ToString();
            lblMobile.Text = dr["Mobile"].ToString();
            lblEmail.Text = dr["Email"].ToString();
            lblLicense.Text = dr["LicenseNum"].ToString();
            lblAddress.Text = dr["Address"].ToString();
        }
        cn.Close();
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnBookingHistory_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookingHistory.aspx");
    }
}