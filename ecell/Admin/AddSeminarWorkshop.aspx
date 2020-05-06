<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddSeminarWorkshop.aspx.cs" Inherits="Admin_AddSeminarWorkshop" %>

<asp:Content ID="Content4" ContentPlaceHolderID="PageTitle" runat="Server">
    Add Seminar & Workshop
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #TextArea1 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <center><h1>Add Seminar & Workshop</h1></center>
    <br />
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style5">Topic</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox1" runat="server" Width="200px" ValidationGroup="Add" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Topic is required" ControlToValidate="TextBox1" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style5">Date</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox2" runat="server" Width="200px" ValidationGroup="Add" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Date is required" ControlToValidate="TextBox2" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style5">Time</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBox3" runat="server" Width="200px" ValidationGroup="Add" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Time is required" ControlToValidate="TextBox3" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style6">Venue</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox4" runat="server" Width="200px" ValidationGroup="Add" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Venue is required" ControlToValidate="TextBox4" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style6">Description</td>
            <td class="auto-style6">

                <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Width="200px" ValidationGroup="Add" MaxLength="500"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Description is required" ControlToValidate="TextBox6" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style6">Organised By</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox5" runat="server" Width="200px" ValidationGroup="Add" MaxLength="50"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Organised by is required" ControlToValidate="TextBox5" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="Button1" runat="server" Text="ADD" Width="207px" OnClick="Button1_Click" ValidationGroup="Add" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style6">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnReset" runat="server" Text="Reset" Width="207px" OnClick="btnReset_Click" />

            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td colspan="3">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Add" />
            </td>
        </tr>
    </table>
</asp:Content>

