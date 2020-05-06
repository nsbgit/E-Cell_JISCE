<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ENoticeCreation.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Notice Creation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <th colspan="3">
                <h1 style="color: #3366FF">Create Notice</h1>
            </th>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td style="width:30%" class="auto-style1">
                To
            </td>
            <td>
                <asp:DropDownList ID="ddlTo" runat="server" Height="16px" Width="228px" ValidationGroup="Publish">
                    <asp:ListItem>-- Select --</asp:ListItem>
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Faculty &amp; Staff</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvTo" runat="server" ControlToValidate="ddlTo" ErrorMessage="To field is required" Font-Bold="True" ForeColor="Red" InitialValue="-- Select --" ValidationGroup="Publish">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td style="width:30%" class="auto-style1">
                Subject
            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" Width="222px" ValidationGroup="Publish"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject is required" Font-Bold="True" ForeColor="Red" ValidationGroup="Publish">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td style="width:30%" class="auto-style1">
                Add Attachment
            </td>
            <td>
                <asp:FileUpload ID="fuAttachment" runat="server" Width="222px" />
            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td style="width:30%" class="auto-style1">
                Notice Body
            </td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" Width="222px" TextMode="MultiLine" ValidationGroup="Publish"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvNoticeBody" runat="server" ControlToValidate="txtMessage" ErrorMessage="Notice body is required" Font-Bold="True" ForeColor="Red" ValidationGroup="Publish">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td style="width:30%">&nbsp;</td>
            <td>
                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnPublish" runat="server" Text="Publish" ValidationGroup="Publish" OnClick="btnPublish_Click" />
            </td>
            <td></td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Publish" />
            </td>
        </tr>
    </table>
</asp:Content>

