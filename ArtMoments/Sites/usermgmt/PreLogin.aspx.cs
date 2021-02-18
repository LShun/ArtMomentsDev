using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.usermgmt
{
    public partial class PreLogin : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                MasterPageFile = "~/Masters/General.Master";

            }
            else if (Session["UserType"].ToString().Equals("2"))
            {
                MasterPageFile = "~/Masters/Artist.Master";
            }
            else if (Session["UserType"].ToString().Equals("1"))
            {
                MasterPageFile = "~/Masters/Client.Master";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}