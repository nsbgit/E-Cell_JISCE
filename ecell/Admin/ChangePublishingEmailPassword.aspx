﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePublishingEmailPassword.aspx.cs" Inherits="Admin_ChangePublishingEmailPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Change Publishing Email Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center> <h1>Change Publishing Email Password</h1></center>

    <table align="center">
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
       
        <tr>
            <td>Old Password :</td>
            <td>
                <asp:TextBox ID="txtOldPassword" runat="server" ValidationGroup="ChangePassword" Width="153px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Old Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
       <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>New Password</td>
            <td>
                <asp:TextBox ID="txtNewPassword" runat="server" ValidationGroup="ChangePassword" Width="153px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="New Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
       <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>Re-type New Password</td>
            <td>
                <asp:TextBox ID="txtRetypeNewPassword" runat="server" ValidationGroup="ChangePassword" Width="153px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvRetypeNewPassword" runat="server" ControlToValidate="txtRetypeNewPassword" ErrorMessage="Re - type Password is required" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPass" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtRetypeNewPassword" ErrorMessage="Password mismatch" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword">?</asp:CompareValidator>
            </td>
        </tr>
        
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

       
           
        <tr>
        <td></td>
              <td>
                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" ValidationGroup="ChangePassword" OnClick="btnChangePassword_Click" />
            </td>
        <td></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
        <td></td>
              <td>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" Width="161px" />
            </td>
        <td></td>
        </tr>

        
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
             <td>
                 <asp:ValidationSummary ID="vsChangePassword" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="ChangePassword" />
             </td>
            <td></td>
        </tr>

    </table>
</asp:Content>

