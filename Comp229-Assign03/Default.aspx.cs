using Courses.DataAccess;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Home";
            LoadStudents();
        }
        
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if(AddStudent(SFame.Text, SLame.Text) > 0)
            {
                ErrorMessge.Text = "Student name added successfully";
                ErrorMessge.ForeColor = Color.Green;
                LoadStudents();
            }
            else
            {
                ErrorMessge.Text = "Student name already exists!";
                ErrorMessge.ForeColor = Color.Red;
            }
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            SFame.Text = "";
            SLame.Text = "";
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

        private int AddStudent(string firstname, string lastname)
        {
           SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@LastName", lastname),
               new SqlParameter("@FirstMidName", firstname),
           };
           return SQLDataAccess.ExecuteNonQuery("AddORUpdateStudent", parameters);
        }
    }
}