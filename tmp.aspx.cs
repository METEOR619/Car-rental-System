using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class tmp : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlDataReader dr;
    string qry;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //string date = DateTime.Now.ToShortDateString().Replace('/','_');
        //Response.Write(date);

        //string date1 = DateTime.UtcNow.ToString("s", System.Globalization.CultureInfo.InvariantCulture);
        
        //DateTime dt = DateTime.UtcNow + TimeSpan.Parse("02:00");
        //Response.Write(dt);

        byte[] en = System.Text.ASCIIEncoding.ASCII.GetBytes(TextBox1.Text);
        string encrypted = Convert.ToBase64String(en);
        Label1.Text = encrypted;

        byte[] dc = Convert.FromBase64String(TextBox2.Text); 
        string decrypted = System.Text.ASCIIEncoding.ASCII.GetString(dc);
        Label2.Text = decrypted;
    }
}