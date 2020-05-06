<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignInStudent.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Student Sign In
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #0066FF;
        }
        .auto-style2 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <th colspan="3">
                <h1>Student Sign In</h1>
            </th>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                <label>Email</label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="226px" ValidationGroup="SignIn"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please provide a valid email" ControlToValidate="txtEmail" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="SignIn">?</asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                <label>Password</label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Width="223px" TextMode="Password" ValidationGroup="SignIn"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
            </td>
        </tr>

         <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" Width="230px" ValidationGroup="SignIn" />
            </td>
            <td></td>
        </tr>

         <tr>
            <td colspan="3"></td>
        </tr>

         <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" Width="227px" />
            </td>
            <td></td>
        </tr>
          <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="vsSignIn" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn" />
              </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/StudentRegistration.aspx">New User? Sign Up</asp:HyperLink>
            </td>
        </tr>


        <tr>
            <td></td>
            <td colspan="3">
                <asp:HyperLink ID="hlForgotPassword" runat="server" NavigateUrl="~/StudentForgotPassword.aspx">Forgot Password</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

