<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ApproveFaculty.aspx.cs" Inherits="Admin_ApproveFaculty" %>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" Runat="Server">
    Approve Faculty
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Approve Faculty Registration</h1></center>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" CellPadding="4" DataKeyNames="id"  ForeColor="#333333" GridLines="None" Width="894px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
            <asp:BoundField DataField="mobileNumber" HeaderText="Mobile" SortExpression="mobileNumber" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />

            <asp:TemplateField>
               <ItemTemplate>
                    <asp:Button ID="approve" runat="server"  CommandArgument='<%#Eval("id") %>' CommandName="Artist" Text="Activate/Deactivate" />
               </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />


    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db %>" 
        DeleteCommand="DELETE FROM [tblFacultyRegistration] WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [email] = @original_email AND [department] = @original_department AND [mobileNumber] = @original_mobileNumber AND [status] = @original_status"
         InsertCommand="INSERT INTO [tblFacultyRegistration] ([firstName], [lastName], [email], [department], [mobileNumber], [status]) VALUES (@firstName, @lastName, @email, @department, @mobileNumber, @status)" OldValuesParameterFormatString="original_{0}"
         SelectCommand="SELECT [id], [firstName], [lastName], [email], [department], [mobileNumber], [status] FROM [tblFacultyRegistration] ORDER BY [status]"
         UpdateCommand="UPDATE [tblFacultyRegistration] SET [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [department] = @department, [mobileNumber] = @mobileNumber, [status] = @status WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [email] = @original_email AND [department] = @original_department AND [mobileNumber] = @original_mobileNumber AND [status] = @original_status">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_mobileNumber" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="mobileNumber" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="mobileNumber" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_mobileNumber" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

