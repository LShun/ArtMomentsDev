using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtMoments.Sites.general
{
    public partial class OrderArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public string conString = "Data Source=(localdb)\\MSSQLLocalDB;Integrated Security=True";

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

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnwishlistOff_Click(object sender, EventArgs e)
        {
            btnwishlistOn.Visible = true;
            btnwishlistOff.Visible = false;
        }

        protected void btnwishlistOn_Click(object sender, EventArgs e)
        {
            btnwishlistOn.Visible = false;
            btnwishlistOff.Visible = true;

        }

        /*
         SqlConection con = new SqlConnection (conString);
        con.Open()
        if(con.State == System.Data.ConnectionState.Open)
        {
            string q = "insert into Test('"+txtID.Text.toString()+ "','" + txtName.Text.ToString()+"')"
            SqlCommand cmd = new SqlCommand(q,con);
            cmd.ExecuteNonQuery();
            MasageBox.Show("Connection made Successfully..!")
        }
         */
    }
}