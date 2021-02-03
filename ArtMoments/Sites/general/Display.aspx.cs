using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ArtMoments.Sites.general
{
    public partial class Display : System.Web.UI.Page
    {
        public string conString = "Data Source=DESKTOP-T1B999F\\SQLEXPRESS;Initial Catalog=ArtMomentsDb;User ID=sa;Password=***********";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtMin_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);

        }

        protected void txtMax_TextChanged(object sender, EventArgs e)
        {
            //rangeMax.Value = txtMax.Text;
        }
    }
}