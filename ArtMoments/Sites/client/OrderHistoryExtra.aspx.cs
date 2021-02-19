using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.client
{
    public partial class OrderHistoryExtra : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ArtMomentsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        
        // go to the order art page of particular item when usr click on the img
        protected void viewProdImg(object sender, EventArgs e)
        {
            ImageButton clickImgItem = sender as ImageButton;
            string prodId = (clickImgItem.FindControl("lblProdId") as Label).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

        // go to the order art page of particular item when usr click on the buy again button
        protected void viewProdBtn(object sender, EventArgs e)
        {
            Button clickBtnItem = sender as Button;
            string prodId = (clickBtnItem.FindControl("lblProdId") as Label).Text;
            Response.Redirect("~/Sites/general/OrderArt.aspx?id=" + prodId);
        }

    }


}