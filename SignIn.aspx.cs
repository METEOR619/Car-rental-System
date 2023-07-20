using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Client_SignIn : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataSet ds = new DataSet();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        //RequiredFieldValidator1.Attributes.Remove("css");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "UserSignIn";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@UserName", txtUname.Text);
        cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtPassword.Text));
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session.Timeout = 60;
            Session["Uid"] = ds.Tables[0].Rows[0].ItemArray[0];
            Session["UFName"] = ds.Tables[0].Rows[0].ItemArray[3];
            Session["Uname"] = txtUname.Text.ToString();
            Session["Password"] = txtPassword.Text.ToString();
            Response.Redirect("Home.aspx");
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