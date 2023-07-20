using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Client_ContactUs : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSendMsg_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "AddContactUs";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@FName", txtFname.Text);
        cmd.Parameters.AddWithValue("@LName", txtLname.Text);
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Message", txtMsg.Text);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
        Response.Write("<script> alert('Thank You For Your Message!') </script>");
        txtFname.Text = "";
        txtLname.Text = "";
        txtEmail.Text = "";
        txtMobile.Text = "";
        txtMsg.Text = "";
        cn.Close();
    }
}