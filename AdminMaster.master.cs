using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUname"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        lblAdminName.Text = Session["AdminUname"].ToString();
        lblAdminEmail.Text = Session["AdminEmail"].ToString();
        AdminImage1.ImageUrl = "~/Admin/assets/images/AdminAvatar/" + Session["AdminImage"].ToString();
        AdminImage2.ImageUrl = "~/Admin/assets/images/AdminAvatar/" + Session["AdminImage"].ToString();

        if ( Convert.ToInt32(Session["IsSuper"]) == 0 )
        {
            admin.Visible = false;
        }
    }
}
