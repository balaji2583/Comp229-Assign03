using Courses.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Courses
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "Course";
            if (!Page.IsPostBack)
            {
                LoadEnrolledStudents();
                LoadDepartment();
                LoadStudents();
            }
        }

        protected void GvCourses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvCourses.PageIndex = e.NewPageIndex;
            LoadEnrolledStudents();
        }

        protected void GvCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DEL")
            {
                DeleteEnrollment(Convert.ToInt32(e.CommandArgument.ToString()));
                LoadEnrolledStudents();
            }
        }

        protected void drpDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCourses(Convert.ToInt32(drpDepartment.SelectedValue));
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            if (AddEnrollment(Convert.ToInt32(DrpCourses.SelectedValue), Convert.ToInt32(DrpStudents.SelectedValue), Convert.ToInt32(txtGrade.Text)) > 0)
            {
                ErrorMessge.Text = "Registered successfully";
                ErrorMessge.ForeColor = Color.Green;
                LoadEnrolledStudents();
            }
            else
            {
                ErrorMessge.Text = "Already registered!";
                ErrorMessge.ForeColor = Color.Red;
            }
        }

        private int AddEnrollment(int courseId, int studentId, int grade)
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@CourseID", courseId),
               new SqlParameter("@StudentID", studentId),
               new SqlParameter("@Grade", grade)
            };
            return SQLDataAccess.ExecuteNonQuery("AddEnrollment", parameters);
        }

        private void LoadStudents()
        {
            DrpStudents.DataSource = GetStudents();
            DrpStudents.DataBind();
        }

        private DataTable GetStudents()
        {
            return SQLDataAccess.GetDataTable("GetStudents");
        }

        private void LoadDepartment()
        {
            drpDepartment.DataSource = GetDepartments();
            drpDepartment.DataBind();
        }

        private DataTable GetDepartments()
        {
            return SQLDataAccess.GetDataTable("GetDepartments");
        }

        private void LoadEnrolledStudents()
        {
            GvCourses.DataSource = GetEnrolledStudents();
            GvCourses.DataBind();
        }

        private DataTable GetEnrolledStudents()
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@CourseID", -1),
               new SqlParameter("@StudentID", -1),
           };
            return SQLDataAccess.GetDataTable("GetCourseANDStudents", parameters);
        }

        private DataTable DeleteEnrollment(int id)
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@EnrollmentId", id),
           };
            return SQLDataAccess.GetDataTable("DeleteEnrollment", parameters);
        }

        private void LoadCourses(int id)
        {
            DrpCourses.DataSource = GetCourses(id);
            DrpCourses.DataBind();
        }

        private DataTable GetCourses(int id)
        {
            SqlParameter[] parameters = new SqlParameter[] {
               new SqlParameter("@DepartmentID", id),
           };
            return SQLDataAccess.GetDataTable("GetCourses", parameters);
        }

        protected void GvCourses_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable table = GetEnrolledStudents();
            table.DefaultView.Sort = e.SortExpression;
            GvCourses.DataSource = table;
            GvCourses.DataBind();
        }
    }
}