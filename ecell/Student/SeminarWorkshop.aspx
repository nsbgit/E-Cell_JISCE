<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="SeminarWorkshop.aspx.cs" Inherits="SeminarWorkshop" %>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" Runat="Server">
    Seminar & Workshop
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Seminar & Workshop</h1>
    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="893px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>


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
    </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="select title, wdate, wtime, venue, wdescription, organisedBy FROM tblSeminarNWorkshop"></asp:SqlDataSource>

</asp:Content>

