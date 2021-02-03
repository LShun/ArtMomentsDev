using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.general
{
    public partial class OrderArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private int qtyValue;
        protected void btnMinus_Click(object sender, EventArgs e)
        {
            qtyValue = Convert.ToInt32(qtyTxtBox.Text);
            if(qtyValue > 1)
            {
                qtyValue--;
                qtyTxtBox.Text = qtyValue.ToString();
            }

        }

        protected void btnPlus_Click1(object sender, EventArgs e)
        {
            qtyValue = Convert.ToInt32(qtyTxtBox.Text);
            qtyValue++;
            qtyTxtBox.Text = qtyValue.ToString();
        }
    }
}