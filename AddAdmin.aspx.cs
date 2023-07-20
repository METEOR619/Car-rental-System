using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_AddAdmin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddAdmin_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text == txtCPassword.Text)
        {
            if (FUAdmin.HasFile)
            {
                if (FUAdmin.PostedFile.ContentType == "image/jpeg" || FUAdmin.PostedFile.ContentType == "image/png")
                {
                    try
                    {
                        string date = DateTime.Now.ToShortDateString();
                        string hour = DateTime.Now.Hour.ToString();
                        string min = DateTime.Now.Minute.ToString();
                        string sec = DateTime.Now.Second.ToString();

                        string filename = date + "_" + hour + min + sec + "_" + FUAdmin.FileName;

                        cn.Open();
                        qry = "AddAdmin";
                        cmd = new SqlCommand(qry, cn);
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtPassword.Text));
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@Image", filename);
                        cmd.Parameters.AddWithValue("@IsSuper", DDLAdminType.SelectedValue);
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                        FUAdmin.SaveAs(Server.MapPath("~/Admin/assets/images/AdminAvatar/" + filename));
                        Response.Write("<script>alert('Admin Added Successfully...')</script>");
                        txtUsername.Text = "";
                        txtPassword.Text = "";
                        txtCPassword.Text = "";
                        txtEmail.Text = "";
                        txtMobile.Text = "";
                        DDLAdminType.ClearSelection();

                        //Response.Redirect("Dashboard.aspx");
                        cn.Close();
                    }
                    catch
                    {
                        Response.Write("<script>alert('Username already Added!')</script>");
                        txtUsername.Text = "";
                        cn.Close();
                    }     
                }
                else
                {
                    Response.Write("<script>alert('Invalid File Format!')</script>");
                }
            }
        }
        else
        {
            Response.Write("<script>alert('Password Not Match!')</script>");
        }
    }

    // Password Encryption
    public string EncryptPassword(string strEncrypted)
    {
        byte[] encrypt = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encryptedPwd = Convert.ToBase64String(encrypt);
        return encryptedPwd;
    }
}