<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="Admin_AdminProfile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="Server">
    Admin Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>
    <table>
        <tr>
            <th>
                <h1>Admin Details</h1>
            </th>
        </tr>
          <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="None" style="text-align: center" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="userId" HeaderText="User ID" SortExpression="userId" />
            <asp:BoundField DataField="email" HeaderText="Email (Notice)" SortExpression="email" />
        </Columns>

        <EditRowStyle BackColor="#999999" />

        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

            </td>
        </tr>
          <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnCountinue" runat="server" Text="Continue....." PostBackUrl="~/Admin/ApproveStudent.aspx" style="text-align: center" Width="249px" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:HyperLink ID="hlEditProfile" runat="server" NavigateUrl="~/Admin/EditProfile.aspx">Edit Profile</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hpChangeLoginPassword" runat="server" NavigateUrl="~/Admin/ChangeLoginPassword.aspx">Change Login Password</asp:HyperLink>
            </td>
        </tr>
          <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hpChangePublishingEmailPassword" runat="server" NavigateUrl="~/Admin/ChangePublishingEmailPassword.aspx">Change Publishing Email Password</asp:HyperLink>
            </td>
        </tr>
          <tr>
            <td>
            </td>
        </tr>
         <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [id], [userId], [email] FROM [tblAdminDetails]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </center>

</asp:Content>

