using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Collections.Specialized;

public partial class Client_Booking : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConStr"].ToString());
    SqlCommand cmd = new SqlCommand();
    SqlCommand cmd1 = new SqlCommand();
    SqlDataReader dr;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Uname"] == null)
        {
            Response.Redirect("SignIn.aspx");
        }

        if (!IsPostBack)
        {
            countDays();
            FillCarDetails();
            FillUserDetails();
        }

    }


    public void countDays()
    {
        DateTime dt1 = Convert.ToDateTime(Session["PickUpDate"]);
        DateTime dt2 = Convert.ToDateTime(Session["DropOffDate"]);

        TimeSpan diff = dt2 - dt1;
        int total = diff.Days;

        Session["Days"] = total;
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
            cmd.CommandText = "CarBooking";
            cmd.Parameters.AddWithValue("@MDetailsID", MDetailsID);
            cn.Open();
            dr = cmd.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            cn.Close();
        }
    }

    void FillUserDetails()
    {
        cmd1.Connection = cn;
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.CommandText = "UserDetails";
        cmd1.Parameters.AddWithValue("@UserName", Session["Uname"]);
        cn.Open();
        dr = cmd1.ExecuteReader();
        ListView2.DataSource = dr;
        ListView2.DataBind();
        cn.Close();
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label lblQty = e.Item.FindControl("lblQty") as Label;
        lblQty.Text = Session["Days"].ToString() + " Days";

        Label lblRate = e.Item.FindControl("lblRate") as Label;
        lblRate.Text = lblRate.Text;
        Session["Rate"] = lblRate.Text;

        Label lblAmount = e.Item.FindControl("lblAmount") as Label;
        lblAmount.Text = (Convert.ToInt32(Session["Days"].ToString()) * Convert.ToInt32(lblRate.Text)).ToString();
        Session["Amount"]= lblAmount.Text;

        Label lblPickUpDate = e.Item.FindControl("lblPickUpDate") as Label;
        lblPickUpDate.Text = Session["PickUpDate"].ToString();

        Label lblDropOffDate = e.Item.FindControl("lblDropOffDate") as Label;
        lblDropOffDate.Text = Session["DropOffDate"].ToString();

        Label lblCGSTPrice = e.Item.FindControl("lblCGSTPrice") as Label;
        lblCGSTPrice.Text = ((Convert.ToDouble(lblAmount.Text) * Convert.ToDouble(9)) / 100).ToString();
        Session["CGST"]= lblCGSTPrice.Text;

        Label lblSGSTPrice = e.Item.FindControl("lblSGSTPrice") as Label;
        lblSGSTPrice.Text = ((Convert.ToDouble(lblAmount.Text) * Convert.ToDouble(9)) / 100).ToString();
        Session["SGST"] = lblSGSTPrice.Text;

        Label lblTotal = e.Item.FindControl("lblTotal") as Label;
        Session["Total"] = (Convert.ToDouble(lblCGSTPrice.Text) + Convert.ToDouble(lblSGSTPrice.Text) + Convert.ToDouble(lblAmount.Text)).ToString();
        lblTotal.Text = "&#8377 " + Session["Total"];
    }

    protected void btnBookNow_Click(object sender, EventArgs e)
    {
        int MDetailsID = Convert.ToInt32(Request.QueryString.Get("MDetailsID"));

        ListViewDataItem item = (sender as Button).NamingContainer as ListViewDataItem;
        string RBLPayment = (item.FindControl("RBLPayment") as RadioButtonList).SelectedValue;
        string LicenseNum = (item.FindControl("txtLicense") as TextBox).Text;
        string Address = (item.FindControl("txtAddress") as TextBox).Text;
        Session["UEmail"]  = (item.FindControl("txtEmail") as TextBox).Text;

        cn.Open();
        qry = "AddBooking";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@UserID", Session["Uid"]);
        cmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@MDetailsID", MDetailsID);
        cmd.Parameters.AddWithValue("@PickUpDate", Convert.ToDateTime(Session["PickUpDate"]));
        cmd.Parameters.AddWithValue("@DropOffDate", Convert.ToDateTime(Session["DropOffDate"]));
        cmd.Parameters.AddWithValue("@LicenseNum", LicenseNum);
        cmd.Parameters.AddWithValue("@Address", Address);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
        cn.Close();

        cn.Open();
        qry = "GetBookingID";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@UserID", Session["Uid"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        Session["BookingID"] = Convert.ToInt32(cmd.ExecuteScalar());
        cn.Close();

        cn.Open();
        qry = "AddPayment";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@BookingID", Session["BookingID"]);
        cmd.Parameters.AddWithValue("@Rate", Session["Rate"]);
        cmd.Parameters.AddWithValue("@Qty", Session["Days"]);
        cmd.Parameters.AddWithValue("@Amount", Session["Amount"]);
        cmd.Parameters.AddWithValue("@Discount", 0);
        cmd.Parameters.AddWithValue("@CGST", Session["CGST"]);
        cmd.Parameters.AddWithValue("@SGST", Session["SGST"]);
        cmd.Parameters.AddWithValue("@Total", Session["Total"]);
        cmd.Parameters.AddWithValue("@PMethod", RBLPayment);
        cmd.Parameters.AddWithValue("@PStatus", "Success");
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
        cn.Close();

        cn.Open();
        qry = "GetModelName";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@MDetailsID", MDetailsID);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Session["ModelName"] = dr["ModelName"].ToString();
            Session["BrandName"] = dr["BrandName"].ToString();
        }
        cn.Close();

        cn.Open();
        qry = "GetCityName";
        cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@CityID", Session["City"]);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Session["CityName"] = dr["CityName"].ToString();
        }
        cn.Close();

        sendInvoice();
        sendSMS(sender);

        Response.Write("<script> alert('Booking Done!') </script>");
        Response.Redirect("BookingDone.aspx");
    }

    void sendInvoice()
    {
        if (DateTime.Now.Month >= 4)
        {
            Session["InvoiceNo"] = DateTime.Now.Year + "-" + DateTime.Now.AddYears(1).Year.ToString().Substring(2, 2) + "/" + Session["BookingID"];
        }
        else
        {
            Session["InvoiceNo"] = DateTime.Now.AddYears(-1).Year + "-" + DateTime.Now.Year.ToString().Substring(2, 2) + "/" + Session["BookingID"];
        }
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("<img src='" + Server.MapPath("~/Client/assests/images/logo/LogoBlack.png") + "' height='30%' width='50%' align='center' /> <br>");
                sb.Append("<table width='100%' border='1' cellspacing='0' cellpadding='7'>");
                sb.Append("<tr><td align='center' style='background-color: #4f5dec; color: #ffffff;' colspan = '4'><b>INVOICE</b></td></tr>");
                sb.Append("<tr><td colspan='2'><b> Invoice No: </b></td><td colspan='2'>" + Session["InvoiceNo"] + "</td></tr>");
                sb.Append("<tr><td colspan='2'><b> Invoice Date: </b></td><td colspan='2'>" + DateTime.Now.ToShortDateString() + "</td></tr>");
                sb.Append("<tr align='center' style='font-weight: bold'><td> Description </td><td> Duration </td><td style='width: 10%'> Rate </td><td> Amount </td></tr>");
                sb.Append("<tr style='vertical-align:top; height: 200px'>");
                sb.Append("<td>" + Session["BrandName"] + " " + Session["ModelName"] + "<br><br>Pick Up Date: <br>" + Convert.ToDateTime(Session["PickUpDate"]).ToShortDateString() + "<br><br>Drop Off Date: <br>" + Convert.ToDateTime(Session["DropOffDate"]).ToShortDateString() + "<br><br>City:<br>" + Session["CityName"] + "<br><br><br><br></td>");
                sb.Append("<td>" + Session["Days"] + " Days <br><br><br><br><br><br><br><br><br><br><br><br> </td>");
                sb.Append("<td align='right'> " + Session["Rate"] + " <br><br><br><br><br><br><br><br><br><br><br><br> </td>");
                sb.Append("<td align='right'> " + Session["Amount"] + " <br><br><br><br><br><br><br><br><br><br><br><br> </td>");
                sb.Append("</tr>");
                //sb.Append("<tr><td colspan='3' align='right'> <b> Discount </b> </td> <td align='right'> (-) 0 </td></tr>");
                sb.Append("<tr><td colspan='3' rowspan='2' align='right'> <b> CGST 9%<br> SGST 9%</b> </td> <td align='right'> " + Session["CGST"] + " <br> " + Session["SGST"] + " </td></tr>");
                sb.Append("<tr></tr>");
                sb.Append("<tr><td colspan='3' align='right'> <b> Total </b> </td> <td align='right'> " + Session["Total"] + " </td></tr>");
                sb.Append("</table>");

                StringReader sr = new StringReader(sb.ToString());
                Document pdfDoc = new Document(PageSize.A4, 20f, 20f, 20f, 20f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    byte[] bytes = memoryStream.ToArray();
                    memoryStream.Close();


                    MailMessage mail = new MailMessage();
                    string mailid = Session["UEmail"].ToString();
                    mail.To.Add(mailid);
                    mail.From = new MailAddress("cartravel2501@gmail.com", "Car Travel");
                    mail.Subject = "Invoice";
                    string Body = "<h2>Congratulations "+ Session["UFName"]  +"!</h2><br>Your car has been booked and payment has been completed. <br>The car will be delivered on the specified date. <br>Here is the invoice of your booking.";
                    mail.Attachments.Add(new Attachment(new MemoryStream(bytes), "UserInvoice.pdf"));
                    mail.Body = Body;
                    mail.IsBodyHtml = true;

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPwd"]);
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }

                //Code Of Download PDF in Device. Replace it after sb.Appand

                    //StringReader sr = new StringReader(sb.ToString());
                    //Document pdfDoc = new Document(PageSize.A4, 20f, 20f, 30f, 20f);
                    //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    //pdfDoc.Open();
                    //htmlparser.Parse(sr);
                    //pdfDoc.Close();

                    //Response.ContentType = "application/pdf";
                    //Response.AddHeader("content-disposition", "attachment;filename=invoice.pdf");
                    //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    //Response.Write(pdfDoc);
            }
        }
    }

    void sendSMS(object sender)
    {
        ListViewDataItem item = (sender as Button).NamingContainer as ListViewDataItem;
        string MobileNo = (item.FindControl("txtMobile") as TextBox).Text;
        string FName = (item.FindControl("txtFName") as TextBox).Text;

        String message = HttpUtility.UrlEncode("Dear " + FName + ", \nYour booking has been confirmed. \nCheck your E-mail for invoice. \n\nThank You, \nTeam Car Travel");
        using (var wb = new WebClient())
        {
            byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "bfoflzqeslI-BCJrcgnPrZdWu0e7yartFYZYkwMqmd"},
                {"numbers" , MobileNo},
                {"message" , message},
                {"sender" , "TXTLCL"}
                });
            string result = System.Text.Encoding.UTF8.GetString(response);
        }
    }
}