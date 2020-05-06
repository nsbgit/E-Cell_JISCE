<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ApproveStudent.aspx.cs" Inherits="Admin_ApproveStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Approve Student
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <h1>Approve Students Registration</h1>
        
    <hr />
    <div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="yr" HeaderText="Year" SortExpression="yr" />
            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
            <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" />
            <asp:BoundField DataField="university" HeaderText="University" SortExpression="university" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
           <asp:TemplateField>
               <ItemTemplate>
                    <asp:Button ID="approve" runat="server"  CommandArgument='<%#Eval("id") %>' CommandName="Artist" Text="Activate/Deactivate" />
               </ItemTemplate>
            </asp:TemplateField>

        </Columns>


        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
     </asp:GridView>

        </div>
  </center>


    <asp:SqlDataSource ID="SqlDataSourceStudnet" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT [id], [firstName], [lastName], [yr], [department], [section], [university], [status] FROM [tblStudentRegistration] ORDER BY [status]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tblStudentRegistration] WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [yr] = @original_yr AND [department] = @original_department AND [section] = @original_section AND [university] = @original_university AND [status] = @original_status" InsertCommand="INSERT INTO [tblStudentRegistration] ([firstName], [lastName], [yr], [department], [section], [university], [status]) VALUES (@firstName, @lastName, @yr, @department, @section, @university, @status)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblStudentRegistration] SET [firstName] = @firstName, [lastName] = @lastName, [yr] = @yr, [department] = @department, [section] = @section, [university] = @university, [status] = @status WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [yr] = @original_yr AND [department] = @original_department AND [section] = @original_section AND [university] = @original_university AND [status] = @original_status">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_yr" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_section" Type="String" />
            <asp:Parameter Name="original_university" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="yr" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="university" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="yr" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="university" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_yr" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_section" Type="String" />
            <asp:Parameter Name="original_university" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

