<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="Courses.Survey" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row-body">
        <div class="container">
            <h2>Survey</h2>
            <hr />
            <div class="row-left">
                <div class="left">
                    <p>
                        Please feel free to take this survey as this would help us very much to improve your user experience.
                    </p>
                </div>
            </div>
        </div>
        <div class="container">
            <strong>User Details</strong>
            <hr />
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="UName">Name</asp:Label>
                <asp:TextBox runat="server" ID="UName" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UName" ValidationGroup="UInputs"
                    CssClass="field-validation-error" ErrorMessage="enter your name!" />
            </div>
            <div class="center">
                <div>
                    <asp:Label runat="server" AssociatedControlID="UGender">Gender</asp:Label>
                    <asp:RadioButtonList runat="server" ID="UGender" RepeatDirection="Vertical" TextAlign="Right" CssClass="inputradio">
                        <asp:ListItem Value="Male"> Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UGender" ValidationGroup="UInputs"
                        CssClass="field-validation-error" ErrorMessage="select your gender." />
                </div>
                <div>
                    <asp:Label runat="server" AssociatedControlID="UAge">Age</asp:Label>
                    <asp:TextBox runat="server" ID="UAge" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UAge" ValidationGroup="UInputs"
                        CssClass="field-validation-error" ErrorMessage="enter your age!" />
                    <asp:RangeValidator runat="server" ControlToValidate="UAge" ValidationGroup="UInputs"
                        CssClass="field-validation-error" ErrorMessage="enter your actual age!" MinimumValue="12" MaximumValue="80">
                    </asp:RangeValidator>

                </div>
            </div>
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="UEmail">Email address</asp:Label>
                <asp:TextBox runat="server" ID="UEmail" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UEmail" ValidationGroup="UInputs"
                    CssClass="field-validation-error" ErrorMessage="enter your email address!" />
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Enter your valid email address!" ValidationGroup="UInputs"
                    ControlToValidate="UEmail" CssClass="field-validation-error" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </div>
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="UCountry">Country</asp:Label>
                <asp:DropDownList ID="UCountry" runat="server" CssClass="inputdropdown">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>Canada</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UCountry" ValidationGroup="UInputs"
                    CssClass="field-validation-error" InitialValue="Select One" ErrorMessage="select your country." />
            </div>
            <div class="center">
                <asp:Label runat="server" AssociatedControlID="UComments">Comments</asp:Label>
                <asp:TextBox runat="server" ID="UComments" TextMode="MultiLine" Rows="5" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UComments" ValidationGroup="UInputs"
                    CssClass="field-validation-error" ErrorMessage="please provide your comments." />
            </div>

            <div class="center">
                <asp:Button ID="BtnSave" Text="Submit" runat="server" OnClick="BtnSave_Click" ValidationGroup="UInputs" />
                <asp:Button ID="BtnReset" Text="Reset" runat="server" OnClick="BtnReset_Click" />
            </div>
        </div>
    </div>
</asp:Content>
