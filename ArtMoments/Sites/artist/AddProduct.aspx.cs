using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtMoments.Sites.artist
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string conString = "Data Source=DESKTOP-RT2Q9PA\\SQLEXPRESS;Initial Catalog=ArtMomentsDb;User ID=sa;Password=***********";

        protected void saveProdBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void resetProdBtn_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
        }
        void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;
                ClearInputs(ctrl.Controls);
            }
        }
    }
}