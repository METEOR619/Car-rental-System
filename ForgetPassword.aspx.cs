using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;

public partial class Client_ForgetPassword : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "select * from tbl_User where UserName='" + txtUname.Text + "' and Email='"+ txtEmail.Text + "'";
        cmd = new SqlCommand(qry, cn);
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Random r = new Random();
            Session["OTP"] = r.Next(1000, 9999).ToString();

            MailMessage mail = new MailMessage();
            string mailID = txtEmail.Text;
            mail.To.Add(mailID);
            mail.From = new MailAddress("cartravel2501@gmail.com", "Car Travel");
            mail.Subject = "WELCOME";
            string body = "Your One Time Password is: <b>" + Session["OTP"];
            mail.Body = body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPwd"]);
            //smtp.Credentials = new System.Net.NetworkCredential("mailid","pwd");
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(mail);

            btnNext.Visible = false;
            Panel2.Visible = true;

            Response.Write("<script>alert('Please Check Your Email For OTP...')</script>");
        }
        else
        {
            Response.Write("<script>alert('Invalid Username or Email!')</script>");
        }
        cn.Close();
        
    }
    protected void btnNext1_Click(object sender, EventArgs e)
    {
        if (txtOTP.Text == Session["OTP"].ToString())
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;
            heading.InnerText = "Change Password";
        }
        else
        {
            Response.Write("<script>alert('Invalid OTP!')</script>");
            txtOTP.Text = "";
        }
    }
    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        cn.Open();
        qry = "ForgetPassword";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@UserName", txtUname.Text);
        cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtNewPwd.Text));
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
        Response.Redirect("SignIn.aspx");
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