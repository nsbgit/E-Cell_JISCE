<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentForgotPassword.aspx.cs" Inherits="StudentForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="Server">
    Forgot Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <th colspan="3">
                <h1>Forgot Password</h1>
            </th>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>Email ID</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please provide a valid Email ID" ControlToValidate="txtEmail" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">?</asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSendPass" runat="server" Text="Request Password" OnClick="btnSendPass_Click" />
            </td>
            <td></td>
        </tr>

         <tr>
            <td colspan="3"></td>
        </tr>

         <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" />
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
        </tr>

        </table>
</asp:Content>

