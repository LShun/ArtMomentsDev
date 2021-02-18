using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.usermgmt
{
    public partial class BuyerAccount : System.Web.UI.Page
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
            if (Session["UserName"] == null)
            {
                Response.Redirect("PreLogin.aspx");
            }

            if (Session["UserType"].ToString().Equals("1"))
            {
                pblShowForBuyer1.Visible = true;
                pblShowForBuyer2.Visible = true;
                pnlShowForSeller.Visible = false;
                pnlShowForSeller.Enabled = false;
            }
            else
            {
                pblShowForBuyer1.Visible = false;
                pblShowForBuyer2.Visible = false;
                pnlShowForSeller.Visible = true;
                pnlShowForSeller.Enabled = true;
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerAccount.aspx");
        }

        protected void btnOnClickSetting(object sender, EventArgs e)
        {
            Response.Redirect("BuyerSettingExtra.aspx");
        }

        protected void btnPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuyerPresentation.aspx");
        }

        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSetting.aspx");
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

        protected void lbUpload_Click(object sender, EventArgs e)
        {
            Response.Redirect("../artist/AddProduct.aspx");
        }
    }
}