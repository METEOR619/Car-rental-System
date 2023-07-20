using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;

public partial class Client_SignUp : System.Web.UI.Page
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
        qry = "CheckUsername";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@UserName", txtUname.Text);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<script>alert('Username already taken...')</script>");
            txtUname.Text = "";
        }
        else
        {
            try
            {
                Random r = new Random();
                Session["OTP"] = r.Next(1000, 9999).ToString();

                MailMessage mail = new MailMessage();
                string mailID = txtEmail.Text;
                mail.To.Add(mailID);
                mail.From = new MailAddress("cartravel2501@gmail.com", "Car Travel");
                mail.Subject = "WELCOME";
                string body = "<h1>Welcome " + txtFname.Text + "</h1> <br> Your One Time Password is: <b>" + Session["OTP"];
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPwd"]);
                //smtp.Credentials = new System.Net.NetworkCredential("mailid","pwd");
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);

                pnOTP.Visible = true;
                btnNext.Visible = false;

                Response.Write("<script>alert('Please Check Your Email For OTP...')</script>");
            }
            catch
            {
                Response.Write("<script>alert('Something Went Wrong!')</script>");
            }
        }
        cn.Close();
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        if (txtOTP.Text == Session["OTP"].ToString())
        {
            cn.Open();
            qry = "UserSignUp";
            cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@UserName", txtUname.Text);
            cmd.Parameters.AddWithValue("@Password", EncryptPassword(txtPassword.Text));
            cmd.Parameters.AddWithValue("@FName", txtFname.Text);
            cmd.Parameters.AddWithValue("@LName", txtLname.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtMobNo.Text);
            cmd.Parameters.AddWithValue("@DOB", Convert.ToDateTime(txtDOB.Text));
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            Response.Write("<script>window.alert('Register Successfully.');window.location='SignIn.aspx';</script>");
            //Response.Redirect("SignIn.aspx");
            cn.Close();
        }
        else
        {
            Response.Write("<script>alert('Invalid OTP!')</script>");
            txtOTP.Text = "";
        }
    }

    // Password Encryption
    public string EncryptPassword(string strEncrypted)
    {
        byte[] encrypt = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrypted);
        string encryptedPwd = Convert.ToBase64String(encrypt);
        return encryptedPwd;
    }

    // Password Decryption (Not Used)
    public string DecryptPassword(string strDecrypted)
    {
        byte[] decrypt = Convert.FromBase64String(strDecrypted);
        string decryptedPwd = System.Text.ASCIIEncoding.ASCII.GetString(decrypt);
        return decryptedPwd;
    }
}