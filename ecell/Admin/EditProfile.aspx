<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="Admin_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Edit Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #0000FF;
        }
        .auto-style4 {
        width: 30%;
        height: 26px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center><h1>Edit Profile</h1></center>
    <table align="center">
        
       
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>
                User ID :
            </td>
            <td>
                <asp:TextBox ID="txtUserId" runat="server" ValidationGroup="Save" Width="164px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvUserId" runat="server" ErrorMessage="User ID is required" ControlToValidate="txtUserId" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Save">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>
                Publishing Email Id :
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="Save" Width="164px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Publishing Email is required" ControlToValidate="txtEmail" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Save">*</asp:RequiredFieldValidator>
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
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="Save" Width="170px" />
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
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" Width="170px" />
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
                <asp:ValidationSummary ID="vsSave" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Save" />
            </td>
            <td></td>
        </tr>
    </table>

</asp:Content>

