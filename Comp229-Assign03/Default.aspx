<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Courses._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container">
        <h2>Courses</h2>
        <div>
            <%--Landing Page Banner Image--%>
            <img class="auto-style1" src="Images/1.jpg"/>

        </div><br />
        <strong>Add Student</strong>
        <hr />
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="SFame">Firstname</asp:Label>
            <asp:TextBox runat="server" ID="SFame" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="SFame" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="enter first name!" />
        </div>
        <div class="center">
            <asp:Label runat="server" AssociatedControlID="SLame">Lastname</asp:Label>
            <asp:TextBox runat="server" ID="SLame" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="SLame" ValidationGroup="UInputs"
                CssClass="field-validation-error" ErrorMessage="enter last name!" />
        </div>
        <div class="center">
            <asp:Button ID="BtnSave" Text="Add" runat="server" OnClick="BtnSave_Click" ValidationGroup="UInputs" />
            <asp:Button ID="BtnReset" Text="Reset" runat="server" OnClick="BtnReset_Click" />
            <asp:Label ID="ErrorMessge" runat="server" />
        </div>
        <h3>Our Students</h3>
        <asp:GridView ID="GvStudents" runat="server" ShowHeader="false" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="StudentLink" runat="server" Text='<%# Eval("LastName") + " " + Eval("FirstMidName") %>'
                            NavigateUrl='<%# "/student.aspx?id=" + Eval("StudentID")%>' ></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <h3>We suggest the following:</h3>
        <p>
            Take a <strong><a href="/survey.aspx">survey</a></strong>. That would help us to improve.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 840px;
            height: 292px;
        }
    </style>
</asp:Content>

