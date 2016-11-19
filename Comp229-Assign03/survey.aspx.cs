using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class Survey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Survey";
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            Response.Redirect("/thankyou.aspx");
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            UName.Text = "";
            UGender.SelectedIndex = -1;
            UAge.Text = "";
            UEmail.Text = "";
            UCountry.SelectedIndex = 0;
            UComments.Text = "";
        }
    }
}