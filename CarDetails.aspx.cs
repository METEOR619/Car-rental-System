using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_CarDetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCarDetails();
        }
    }

    void FillCarDetails()
    {
        int MDetailsID = Convert.ToInt32(Request.QueryString.Get("MDetailsID"));

        if (MDetailsID == 0)
        {
            Response.Redirect("CarList.aspx");
        }
        else
        {
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CarDetails";
            cmd.Parameters.AddWithValue("@MDetailsID", MDetailsID);
            cn.Open();
            dr = cmd.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            cn.Close();
        }
    }
}