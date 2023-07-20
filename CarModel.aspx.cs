using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_CarModel : System.Web.UI.Page
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
            Bind_DDLCarCategory();
        }
    }

    public void Bind_DDLCarBrand()
    {
        cmd.Connection = cn;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = "DDLCarBrand";

        cn.Open();
        dr = cmd.ExecuteReader();
        DDLCarBrand.DataSource = dr;
        DDLCarBrand.DataTextField  = "BrandName";
        DDLCarBrand.DataValueField = "BrandID";
        DDLCarBrand.DataBind();
        DDLCarBrand.Items.Insert(0, "-- Select Car Brand --");
        cn.Close();
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

    protected void btnAddCarModel_Click(object sender, EventArgs e)
    {
        if (FUCarModel.HasFile)
        {
            if (FUCarModel.PostedFile.ContentType == "image/jpeg" || FUCarModel.PostedFile.ContentType == "image/png")
            {
                try
                {
                    string date = DateTime.Now.ToShortDateString();
                    string hour = DateTime.Now.Hour.ToString();
                    string min = DateTime.Now.Minute.ToString();
                    string sec = DateTime.Now.Second.ToString();

                    cn.Open();
                    string filename = date + "_" + hour + min + sec + "_" + FUCarModel.FileName;

                    qry = "AddCarModel";
                    cmd = new SqlCommand(qry, cn);
                    cmd.Parameters.AddWithValue("@BrandID", DDLCarBrand.SelectedValue);
                    cmd.Parameters.AddWithValue("@CategoryID", DDLCarCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@ModelName", txtCarModel.Text);
                    cmd.Parameters.AddWithValue("@ModelImage", filename);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    FUCarModel.SaveAs(Server.MapPath("~/Admin/assets/images/carmodel/" + filename));
                    DDLCarBrand.ClearSelection();
                    DDLCarCategory.ClearSelection();
                    txtCarModel.Text = "";
                    cn.Close();
                    Response.Redirect("CarModel.aspx");
                    //Response.Write("<script>alert('Car Model Added Successfully...')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Car Model Already Added...')</script>");
                    DDLCarBrand.ClearSelection();
                    DDLCarCategory.ClearSelection();
                    txtCarModel.Text = "";
                    cn.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid File Format!')</script>");
            }
        }
    }
}