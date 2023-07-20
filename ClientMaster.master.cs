using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_ClientMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Timeout = 60;

        if (Session["Uname"] == null)
        {
            pnSignIn.Visible = true;
            pnUser.Visible = false;
            pnUserName.Visible = false;
        }
        else
        {
            pnSignIn.Visible = false;
            pnUser.Visible = true;
            pnUserName.Visible = true;
            lblUname.Text = "Welcome " + Session["UFName"];
        }
    }
}
