<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditSeminarWorkshop.aspx.cs" Inherits="Admin_SeminarWorkshop" %>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" Runat="Server">
   Edit Seminar & Workshop
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <center><h1>Edit Seminar & Workshop</h1></center>

    <center>     
        <asp:GridView ID="GridView1" runat="server"  OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="884px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
       
         <Columns>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             <asp:TemplateField HeaderText="Topic" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                        </div>
                </ItemTemplate>
                 <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Date" SortExpression="date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("wdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("wdate") %>'></asp:Label>
                         </div>
                </ItemTemplate>
                 <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Time" SortExpression="time">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("wtime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("wtime") %>'></asp:Label>
                         </div>
                </ItemTemplate>
                 <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Venue" SortExpression="venue">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("venue") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("venue") %>'></asp:Label>
                         </div>
                </ItemTemplate>
                 <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("wdescription") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("wdescription") %>'></asp:Label>
                     </div>
                </ItemTemplate>
                <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Organised By" SortExpression="organisedBy">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("organisedBy") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <div style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;width:100px">
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("organisedBy") %>'></asp:Label>
                         </div>
                </ItemTemplate>
                <HeaderStyle Wrap="false" Width="100" HorizontalAlign="Left" />
                <ItemStyle Wrap="false" Width="100"></ItemStyle>
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



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [tblSeminarNWorkshop] WHERE [id] = @original_id AND [title] = @original_title AND [wdate] = @original_wdate AND [wtime] = @original_wtime AND [venue] = @original_venue AND [wdescription] = @original_wdescription AND (([organisedBy] = @original_organisedBy) OR ([organisedBy] IS NULL AND @original_organisedBy IS NULL))" InsertCommand="INSERT INTO [tblSeminarNWorkshop] ([title], [wdate], [wtime], [venue], [wdescription], [organisedBy]) VALUES (@title, @wdate, @wtime, @venue, @wdescription, @organisedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [title], [wdate], [wtime], [venue], [wdescription], [organisedBy], [id] FROM [tblSeminarNWorkshop]" UpdateCommand="UPDATE [tblSeminarNWorkshop] SET [title] = @title, [wdate] = @wdate, [wtime] = @wtime, [venue] = @venue, [wdescription] = @wdescription, [organisedBy] = @organisedBy WHERE [id] = @original_id AND [title] = @original_title AND [wdate] = @original_wdate AND [wtime] = @original_wtime AND [venue] = @original_venue AND [wdescription] = @original_wdescription AND (([organisedBy] = @original_organisedBy) OR ([organisedBy] IS NULL AND @original_organisedBy IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_title" Type="String" />
                <asp:Parameter Name="original_wdate" Type="String" />
                <asp:Parameter Name="original_wtime" Type="String" />
                <asp:Parameter Name="original_venue" Type="String" />
                <asp:Parameter Name="original_wdescription" Type="String" />
                <asp:Parameter Name="original_organisedBy" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="wdate" Type="String" />
                <asp:Parameter Name="wtime" Type="String" />
                <asp:Parameter Name="venue" Type="String" />
                <asp:Parameter Name="wdescription" Type="String" />
                <asp:Parameter Name="organisedBy" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="wdate" Type="String" />
                <asp:Parameter Name="wtime" Type="String" />
                <asp:Parameter Name="venue" Type="String" />
                <asp:Parameter Name="wdescription" Type="String" />
                <asp:Parameter Name="organisedBy" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_title" Type="String" />
                <asp:Parameter Name="original_wdate" Type="String" />
                <asp:Parameter Name="original_wtime" Type="String" />
                <asp:Parameter Name="original_venue" Type="String" />
                <asp:Parameter Name="original_wdescription" Type="String" />
                <asp:Parameter Name="original_organisedBy" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </center>
    </asp:Content>

