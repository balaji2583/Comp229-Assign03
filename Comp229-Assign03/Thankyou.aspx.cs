using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class Thank : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Thank you";
            if(Request.UrlReferrer == null)
            {
                Response.Redirect("/");
            }
        }
    }
}