<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Courses.Course" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h2>Enroll a Student</h2>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="drpDepartment">Department</asp:Label>
            <asp:DropDownList ID="drpDepartment" runat="server" DataTextField="Name" DataValueField="DepartmentID" AutoPostBack="true"
                OnSelectedIndexChanged="drpDepartment_SelectedIndexChanged" CssClass="inputdropdown" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="drpDepartment" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="select Department!" />
        </div>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="DrpCourses">Courses</asp:Label>
            <asp:DropDownList ID="DrpCourses" runat="server" DataTextField="Title" DataValueField="CourseId" CssClass="inputdropdown" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DrpCourses" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="select Course!" />
        </div>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="DrpStudents">Students</asp:Label>
            <asp:DropDownList ID="DrpStudents" runat="server" DataTextField="FirstMidName" DataValueField="StudentID" CssClass="inputdropdown" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="DrpStudents" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="select Student!" />
        </div>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="txtGrade">Grade</asp:Label>
            <asp:TextBox ID="txtGrade" runat="server" TextMode="Range" />
         </div>
        <div class="center">
            <asp:Button ID="BtnRegister" Text="Register" runat="server" OnClick="BtnRegister_Click" ValidationGroup="UInputs" />
            <asp:Label ID="ErrorMessge" runat="server" />
        </div>
        <h2>Courses</h2>
        <asp:GridView ID="GvCourses" runat="server" AutoGenerateColumns="false" CellPadding="20" AllowPaging="true" PageSize="10" 
            OnPageIndexChanging="GvCourses_PageIndexChanging" OnRowCommand="GvCourses_RowCommand" AllowSorting="true" OnSorting="GvCourses_Sorting">
            <Columns>
                <asp:BoundField HeaderText="Last Name" ReadOnly="true" DataField="LastName" SortExpression="LastName" />
                <asp:BoundField HeaderText="First Name" ReadOnly="true" DataField="FirstMidName" SortExpression="FirstMidName" />
                <asp:BoundField HeaderText="Course" ReadOnly="true" DataField="Title" SortExpression="Title" />
                <asp:BoundField HeaderText="Department" ReadOnly="true" DataField="Name" SortExpression="Name" />
                <asp:BoundField HeaderText="Credits" ReadOnly="true" DataField="Credits" SortExpression="Credits" />
                <asp:BoundField HeaderText="Grade" ReadOnly="true" DataField="Grade" SortExpression="Grade"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="BtnDelete" runat="server" CommandArgument='<%# Eval("EnrollmentID") %>' CommandName="DEL">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

