using Courses.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadStudents();
        }

        private void LoadStudents()
        {
            GvStudents.DataSource = GetStudents();
            GvStudents.DataBind();
        }

        private DataTable GetStudents()
        {
            return SQLDataAccess.GetDataTable("GetStudents");
        }

        protected void GvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvStudents.PageIndex = e.NewPageIndex;
            LoadStudents();
        }

        protected void GvStudents_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable table = GetStudents();
            table.DefaultView.Sort = e.SortExpression;
            GvStudents.DataSource = table;
            GvStudents.DataBind();
        }
    }
}