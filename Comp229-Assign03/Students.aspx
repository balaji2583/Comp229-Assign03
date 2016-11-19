<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Students.aspx.cs" Inherits="Courses.Students" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Students</h2>
    <asp:GridView ID="GvStudents" runat="server" ShowHeader="true" AutoGenerateColumns="false" BorderWidth="1px" BackColor="SkyBlue"
        CellPadding="20" CellSpacing="20" BorderStyle="None" RowStyle-HorizontalAlign="Left" AllowSorting="true" AllowPaging="true" PageSize="5"
        OnPageIndexChanging="GvStudents_PageIndexChanging" OnSorting="GvStudents_Sorting">
        <Columns>
            <asp:BoundField ReadOnly="True" HeaderText="Last Name" DataField="LastName" SortExpression="LastName">
            </asp:BoundField>
            <asp:BoundField ReadOnly="True" HeaderText="First Name" DataField="FirstMidName" SortExpression="FirstMidName">
            </asp:BoundField>
            <asp:BoundField ReadOnly="True" HeaderText="Enrolled On" DataField="EnrollmentDate" SortExpression="EnrollmentDate">
            </asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
