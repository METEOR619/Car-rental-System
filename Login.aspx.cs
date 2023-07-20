using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "AdminSignIn";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@Username", txtUname.Text);
        cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtPass.Text));
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["AdminUname"] = txtUname.Text.ToString();
            Session["AdminEmail"] = ds.Tables[0].Rows[0]["Email"].ToString();
            Session["AdminImage"] = ds.Tables[0].Rows[0]["Image"].ToString();
            Session["IsSuper"] = ds.Tables[0].Rows[0]["IsSuper"];
            Session.Timeout = 60;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Username or Password...')</script>");
        }
        cn.Close();
    }

    // Password Encryption
    public string EncryptPassword(string strEncrypted)
    {
        byte[] encrypt = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encryptedPwd = Convert.ToBase64String(encrypt);
        return encryptedPwd;
    }
}