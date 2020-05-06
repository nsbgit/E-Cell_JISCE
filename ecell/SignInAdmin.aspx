<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignInAdmin.aspx.cs" Inherits="SignInFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Admin Sign In
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <th colspan="3">
                <h1>Admin Sign In</h1>
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
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
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
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
            </td>
        </tr>

         <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" Width="230px" OnClick="btnSignIn_Click" ValidationGroup="SignIn" />
                
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
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="227px" OnClick="btnReset_Click" />
               
            </td>
            <td></td>
        </tr>
          <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="vsFSignIn" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="SignIn" />
            </td>
        </tr>
    </table>
</asp:Content>

