using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMoments.Sites.general
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtMin_TextChanged(object sender, EventArgs e)
        {
            //rangeMin.Value = txtMin.Text;
            //LHSrange.Style.Remove("width");
            //LHSthumb.Style.Remove("left");
            //Pricerange.Style.Remove("left");
            //LHSrange.Style.Add("width", rangeMin.Value + "%");
            //LHSthumb.Style.Add("left", rangeMin.Value + "%");
            //Pricerange.Style.Add("left", rangeMin.Value + "%");

        }

        protected void txtMax_TextChanged(object sender, EventArgs e)
        {
            //rangeMax.Value = txtMax.Text;
        }
    }
}