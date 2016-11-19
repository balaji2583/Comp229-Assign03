using Courses.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Student";

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = 0;
                    int.TryParse(Request.QueryString["id"], out id);
                    LoadStudentDetails(id);
                    panelEditStudent.Visible = false;
                }
                else
                {
                    Response.Redirect("/default.aspx");
                }
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            panelEditStudent.Visible = true;
            panelViewStudent.Visible = false;
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            DeleteStudent(Convert.ToInt32(hdnStudentId.Value));
            Response.Redirect("/default.aspx");
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            UpdateStudent(Convert.ToInt32(hdnStudentId.Value), SEditFame.Text, SEditLame.Text);
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

        private void LoadStudentDetails(int id)
        {
            DataTable table = GetStudentDetails(id);
            if (table.Rows.Count > 0)
            {
                hdnStudentId.Value = Convert.ToString(table.Rows[0]["StudentID"]);
                SFame.Text = "Firstname : " + table.Rows[0]["FirstMidName"];
                SLame.Text = "Lastname : " + table.Rows[0]["LastName"];
                SEditFame.Text = Convert.ToString(table.Rows[0]["FirstMidName"]);
                SEditLame.Text = Convert.ToString(table.Rows[0]["LastName"]);
            }

            DataTable courses = GetEnrolledCourses(id);
            if (courses.Rows.Count > 1)
            {
                DrpEnrolledCourses.DataSource = courses;
                DrpEnrolledCourses.DataBind();
            }
            else
            {
                DrpEnrolledCourses.Items.Clear();
                DrpEnrolledCourses.Items.Add(new ListItem("N / A"));
            }
        }

        private DataTable GetEnrolledCourses(int id)
        {
            SqlParameter[] parameters = new SqlParameter[]{
                new SqlParameter("@StudentID", id)
            };
            return SQLDataAccess.GetDataTable("GetCourseANDStudents", parameters);
        }

        private int UpdateStudent(int id, string firstname, string lastname)
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@Id", id),
               new SqlParameter("@LastName", lastname),
               new SqlParameter("@FirstMidName", firstname),
           };
            return SQLDataAccess.ExecuteNonQuery("AddORUpdateStudent", parameters);
        }

        private DataTable GetStudentDetails(int id)
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@Id", id)
           };
            return SQLDataAccess.GetDataTable("GetStudents", parameters);
        }

        private int DeleteStudent(int id)
        {
            SqlParameter[] parameters = new SqlParameter[] {
                new SqlParameter("@Id", id)
            };
            return SQLDataAccess.ExecuteNonQuery("DeleteStudent", parameters);
        }

    }
}