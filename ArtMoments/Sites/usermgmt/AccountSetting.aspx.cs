using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.usermgmt
{
    public partial class BuyerSettingNew : System.Web.UI.Page
    {

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist1.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client1.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {          

        }

        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSetting.aspx");
        }

        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        protected void lbPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountPresentation.aspx");
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../general/HomePage.aspx");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            lblSuccessMsg.Text = "Your personal information has been successfully updated!";
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            lblSuccessMsg.Text = "No updates on personal information!";
        }
    }
}