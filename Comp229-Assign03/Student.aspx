<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Student.aspx.cs" Inherits="Courses.Student" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="panelViewStudent" runat="server">
        <div class="container">
            <h3>Student Details</h3>
            <hr />
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="SFame">Firstname</asp:Label>
                <asp:Label runat="server" ID="SFame" />
            </div>
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="SLame">Lastname</asp:Label>
                <asp:Label runat="server" ID="SLame" />
            </div>
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="DrpEnrolledCourses">Courses</asp:Label>
                <asp:DropDownList ID="DrpEnrolledCourses" runat="server" DataTextField="Title" DataValueField="EnrollmentID" />
            </div>
            <div class="center">
                <asp:Button ID="BtnEdit" Text="Edit" runat="server" OnClick="BtnEdit_Click" />
                <asp:Button ID="BtnDelete" Text="Delete" runat="server" OnClick="BtnDelete_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="panelEditStudent" runat="server">
        <h3>Edit Student Details</h3>
        <hr />
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="SEditFame">Firstname</asp:Label>
            <asp:TextBox runat="server" ID="SEditFame" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="SEditFame" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="enter first name!" />
        </div>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="SEditLame">Lastname</asp:Label>
            <asp:TextBox runat="server" ID="SEditLame" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="SEditLame" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="enter last name!" />
        </div>
        <div class="center">
            <asp:Button ID="BtnUpdate" Text="Update" runat="server" OnClick="BtnUpdate_Click" ValidationGroup="UInputs" />
            <asp:Button ID="BtnCancel" Text="Cancel" runat="server" OnClick="BtnCancel_Click" />
            <asp:Label ID="ErrorMessge" runat="server" />
        </div>
    </asp:Panel>
    <asp:HiddenField runat="server" ID="hdnStudentId" />
</asp:Content>
