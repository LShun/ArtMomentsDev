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
        //check is user is artist or buyer (buyer = 1, artist = 2)
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("LoginUser.aspx");
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

        protected void Page_Load(object sender, EventArgs e)
        {
            //check if there is any user log in when load this page


            //if is buyer then display first two box
            if (Session["UserType"].ToString().Equals("1"))
            {
                lblText3.Text = "My favourite";
                lbWishList.Text = "View Collected Art";
                lblText5.Text = "Grab an artwork!";
                lbUpload.Visible = false;
                lbUpload.Enabled = false;
            }
            else
            {
                lblText3.Text = "Every art work is unique";
                lbWishList.Text = "";
                lbWishList.Visible = false;
                lbWishList.Enabled = false;
            }
        }

        //direct user to Account when click on "My Account"
        protected void lbMyAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("Account.aspx");
        }

        //direct user to Setting when click on "Setting" to edit the personal info
        protected void lbSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSetting.aspx");
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

        //direct artist to add product when click on the link
        protected void lbUpload_Click(object sender, EventArgs e)
        {
            Response.Redirect("../artist/AddProduct.aspx");
        }

        protected void lbWishList_Click(object sender, EventArgs e)
        {
            Response.Redirect("../client/Wishlist.aspx");
        }
    }
}