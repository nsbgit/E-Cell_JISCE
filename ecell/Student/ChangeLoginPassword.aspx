<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeLoginPassword.aspx.cs" Inherits="Admin_ChangeLoginPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Change Login Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center">
        <tr>
            <th colspan="3">
                <h1>
                    Change Login Password
                </h1>
            </th>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <th>Old Password :</th>
            <th>
                <asp:TextBox ID="txtOldPassword" runat="server" ValidationGroup="ChangePassword" TextMode="Password"></asp:TextBox>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Old Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
            </th>
        </tr>
        
        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <th>New Password</th>
            <th>
                <asp:TextBox ID="txtNewPassword" runat="server" ValidationGroup="ChangePassword" TextMode="Password"></asp:TextBox>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="New Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
            </th>
        </tr>
        
        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <th>Re-type New Password</th>
            <th>
                <asp:TextBox ID="txtRetypeNewPassword" runat="server" ValidationGroup="ChangePassword" TextMode="Password"></asp:TextBox>
            </th>
            <th>
                <asp:RequiredFieldValidator ID="rfvRetypeNewPassword" runat="server" ControlToValidate="txtRetypeNewPassword" ErrorMessage="Re - type Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPass" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtRetypeNewPassword" ErrorMessage="Password mismatch" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">?</asp:CompareValidator>
            </th>
        </tr>
        
        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <th>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
            </th>
            <th></th>
            <th>
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="btnChangePassword_Click" />
            </th>
        </tr>
        
        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
             <td colspan="3">
                 <asp:ValidationSummary ID="vsChangePassword" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword" />
             </td>
        </tr>

    </table>
</asp:Content>

