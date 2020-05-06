<%@ Page Title="Student Feedback & Query" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentFeedbackNQuery.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table>
        <tr>
            <th> </th>
            <th><h1>Send Feedback/ Query</h1> </th>
            <th> </th>
        </tr>

         <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>Subject</td>
            <td><asp:TextBox ID="txtSubject" runat="server" Width="330px" ValidationGroup="Publish"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject is required" Font-Bold="True" ForeColor="Red" ValidationGroup="Publish">*</asp:RequiredFieldValidator></td>
        </tr>

         <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    
        <tr>
            <td>Notice Body</td>
            <td><asp:TextBox ID="txtMessage" runat="server" Width="331px" TextMode="MultiLine" ValidationGroup="Publish" Height="177px"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="rfvNoticeBody" runat="server" ControlToValidate="txtMessage" ErrorMessage="Notice body is required" Font-Bold="True" ForeColor="Red" ValidationGroup="Publish">*</asp:RequiredFieldValidator></td>
        </tr>

         <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

          <tr>
            <td></td>
            <td><asp:Button ID="btnPublish" runat="server" Text="Send" ValidationGroup="Publish" OnClick="btnPublish_Click" Width="339px" /></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" Width="337px" /></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Publish" /></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
            <td></td>
        </tr>
    </table>
        </center>
</asp:Content>

