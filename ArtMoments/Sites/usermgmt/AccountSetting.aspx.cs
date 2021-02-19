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
        //check is user is artist or buyer (buyer = 1, artist = 2)

        protected void Page_PreInit(object sender, EventArgs e)
        {
            //check if there is any user log in when load this page
            if (Session["UserName"] == null)
            {
                Response.Redirect("PreLogin.aspx");
            }

            if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist1.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client1.Master";
            }
        }

        //check if there is any user log in when load this page
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblSuccessMsg.Text = "";
        }

        //direct user to Setting when click on "Setting" to edit the personal info
        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSetting.aspx");
        }

        //direct user to Account when click on "My Account"
        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        //direct user to presentation page when click on the "Presentation"  to edit bibliography and profile pic
        protected void lbPresentation_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountPresentation.aspx");
        }

        //allow user to log out and clear the session, then dircet to home page
        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../general/HomePage.aspx");
        }

        //display success message when successfully updated wehn user press update button
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            lblSuccessMsg.Text = "Your personal information has been successfully updated!";
        }

        //display no update when user press cancel button
        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            lblSuccessMsg.Text = "No updates on personal information!";
        }
    }
}