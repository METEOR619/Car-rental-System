using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_PasswordEncryption : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Encryption
        byte[] en = System.Text.ASCIIEncoding.ASCII.GetBytes(TextBox1.Text);
        string encrypted = Convert.ToBase64String(en);
        Label1.Text = encrypted;

        //Decryption
        byte[] dc = Convert.FromBase64String(TextBox2.Text);
        string decrypted = System.Text.ASCIIEncoding.ASCII.GetString(dc);
        Label2.Text = decrypted;
    }
}