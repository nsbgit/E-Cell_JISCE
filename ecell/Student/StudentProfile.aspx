<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="StudentProfile.aspx.cs" Inherits="StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Profile</h1></center>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <EditItemTemplate>

            <table>
                <tr>
                    <td>&nbsp;</td><td><asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" /></td>
                </tr>
                <tr>
                    <td>First Name:</td><td><asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("firstName") %>' /></td>
                </tr>
                <tr>
                    <td>Last Name:</td><td> <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' /></td>
                </tr>
                <tr>
                    <td>Mobile:</td><td><asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' /></td>
                </tr>
                <tr>
                    <td>Year:</td><td> <asp:TextBox ID="yrTextBox" runat="server" Text='<%# Bind("yr") %>' /></td>
                </tr>
                <tr>
                    <td>Department:</td><td><asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' /></td>
                </tr>
                <tr>
                    <td>Section:</td><td> <asp:TextBox ID="sectionTextBox" runat="server" Text='<%# Bind("section") %>' /></td>
                </tr>
                <tr>
                    <td>University:</td><td><asp:TextBox ID="universityTextBox" runat="server" Text='<%# Bind("university") %>' /></td>
                </tr>
                <tr>
                    <td>Door and Street:</td><td> <asp:TextBox ID="doorNStreetTextBox" runat="server" Text='<%# Bind("doorNStreet") %>' /></td>
                </tr>
                <tr>
                    <td>Railway Station:</td><td><asp:TextBox ID="rlyStationTextBox" runat="server" Text='<%# Bind("rlyStation") %>' /></td>
                </tr>

                <tr>
                    <td>Post Office:</td><td><asp:TextBox ID="poTextBox" runat="server" Text='<%# Bind("po") %>' /></td>
                </tr>
                <tr>
                    <td>Postal Code:</td><td><asp:TextBox ID="postalCodeTextBox" runat="server" Text='<%# Bind("postalCode") %>' /></td>
                </tr>
                <tr>
                    <td>District:</td><td><asp:TextBox ID="districtTextBox" runat="server" Text='<%# Bind("district") %>' /></td>
                </tr>
                <tr>
                    <td>State:</td><td> <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' /></td>
                </tr>
                <tr>
                    <td> <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" /></td>
                    <td> <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
                </tr>
            </table>

        </EditItemTemplate>
        <InsertItemTemplate>
            firstName:
            <asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("firstName") %>' />
            <br />
            lastName:
            <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            pass:
            <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>' />
            <br />
            mobile:
            <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
            <br />
            yr:
            <asp:TextBox ID="yrTextBox" runat="server" Text='<%# Bind("yr") %>' />
            <br />
            department:
            <asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' />
            <br />
            section:
            <asp:TextBox ID="sectionTextBox" runat="server" Text='<%# Bind("section") %>' />
            <br />
            university:
            <asp:TextBox ID="universityTextBox" runat="server" Text='<%# Bind("university") %>' />
            <br />
            doorNStreet:
            <asp:TextBox ID="doorNStreetTextBox" runat="server" Text='<%# Bind("doorNStreet") %>' />
            <br />
            rlyStation:
            <asp:TextBox ID="rlyStationTextBox" runat="server" Text='<%# Bind("rlyStation") %>' />
            <br />
            po:
            <asp:TextBox ID="poTextBox" runat="server" Text='<%# Bind("po") %>' />
            <br />
            postalCode:
            <asp:TextBox ID="postalCodeTextBox" runat="server" Text='<%# Bind("postalCode") %>' />
            <br />
            district:
            <asp:TextBox ID="districtTextBox" runat="server" Text='<%# Bind("district") %>' />
            <br />
            state:
            <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
            <br />
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td>&nbsp;</td><td><asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="False" /></td>
                </tr>
                 <tr>
                    <td>First Name:</td><td><asp:Label ID="firstNameLabel" runat="server" Text='<%# Bind("firstName") %>' /></td>
                </tr>
                 <tr>
                    <td>Last Name:</td><td><asp:Label ID="lastNameLabel" runat="server" Text='<%# Bind("lastName") %>' /></td>
                </tr>
                 <tr>
                    <td>Email:</td><td><asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' /></td>
                </tr>
                 <tr>
                    <td>Mobile:</td><td><asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' /></td>
                </tr>
                 <tr>
                    <td>Year:</td><td><asp:Label ID="yrLabel" runat="server" Text='<%# Bind("yr") %>' /></td>
                </tr>
                 <tr>
                    <td>Department:</td><td><asp:Label ID="departmentLabel" runat="server" Text='<%# Bind("department") %>' /></td>
                </tr>
                 <tr>
                    <td>Section:</td><td><asp:Label ID="sectionLabel" runat="server" Text='<%# Bind("section") %>' /></td>
                </tr>
                 <tr>
                    <td>University:</td><td><asp:Label ID="universityLabel" runat="server" Text='<%# Bind("university") %>' /></td>
                </tr>
                <tr>
                    <td>Door and Street:</td><td> <asp:Label ID="doorNStreetLabel" runat="server" Text='<%# Bind("doorNStreet") %>' /></td>
                </tr>
                <tr>
                    <td>Railway Station:</td><td><asp:Label ID="rlyStationLabel" runat="server" Text='<%# Bind("rlyStation") %>' /></td>
                </tr>
                <tr>
                    <td>Post Office:</td><td><asp:Label ID="poLabel" runat="server" Text='<%# Bind("po") %>' /></td>
                </tr>
                <tr>
                    <td>Postal Code:</td><td> <asp:Label ID="postalCodeLabel" runat="server" Text='<%# Bind("postalCode") %>' /></td>
                </tr>
                <tr>
                    <td>District:</td><td><asp:Label ID="districtLabel" runat="server" Text='<%# Bind("district") %>' /></td>
                </tr>
                <tr>
                    <td>State:</td><td><asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' /></td>
                </tr>
                <tr>
                    <td>Status:</td><td> <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' /></td>
                </tr>
                  <tr>
                    <td></td><td> <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></td>
                </tr>
            </table>

        </ItemTemplate>
       
    </asp:FormView>
     <asp:HyperLink runat="server" NavigateUrl="~/Student/ChangeLoginPassword.aspx">Change Password</asp:HyperLink>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db %>"
         DeleteCommand="DELETE FROM [tblStudentRegistration] WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [email] = @original_email AND [pass] = @original_pass AND [mobile] = @original_mobile AND [yr] = @original_yr AND [department] = @original_department AND [status] = @original_status AND [state] = @original_state AND [district] = @original_district AND [postalCode] = @original_postalCode AND [po] = @original_po AND [rlyStation] = @original_rlyStation AND [doorNStreet] = @original_doorNStreet AND [university] = @original_university AND [section] = @original_section" 
        InsertCommand="INSERT INTO [tblStudentRegistration] ([firstName], [lastName], [email], [pass], [mobile], [yr], [department], [status], [state], [district], [postalCode], [po], [rlyStation], [doorNStreet], [university], [section]) VALUES (@firstName, @lastName, @email, @pass, @mobile, @yr, @department, @status, @state, @district, @postalCode, @po, @rlyStation, @doorNStreet, @university, @section)" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT  [id],[firstName], [lastName], [email], [mobile], [yr], [department], [status], [state], [district], [postalCode], [po], [rlyStation], [doorNStreet], [university], [section] FROM [tblStudentRegistration] WHERE ([id] = @id)"
         UpdateCommand="UPDATE [tblStudentRegistration] SET [firstName] = @firstName, [lastName] = @lastName, [mobile] = @mobile, [yr] = @yr, [department] = @department, [state] = @state, [district] = @district, [postalCode] = @postalCode, [po] = @po, [rlyStation] = @rlyStation, [doorNStreet] = @doorNStreet, [university] = @university, [section] = @section WHERE [id] = @original_id">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_pass" Type="String" />
            <asp:Parameter Name="original_mobile" Type="String" />
            <asp:Parameter Name="original_yr" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
            <asp:Parameter Name="original_state" Type="String" />
            <asp:Parameter Name="original_district" Type="String" />
            <asp:Parameter Name="original_postalCode" Type="String" />
            <asp:Parameter Name="original_po" Type="String" />
            <asp:Parameter Name="original_rlyStation" Type="String" />
            <asp:Parameter Name="original_doorNStreet" Type="String" />
            <asp:Parameter Name="original_university" Type="String" />
            <asp:Parameter Name="original_section" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="pass" Type="String" />
            <asp:Parameter Name="mobile" Type="String" />
            <asp:Parameter Name="yr" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="district" Type="String" />
            <asp:Parameter Name="postalCode" Type="String" />
            <asp:Parameter Name="po" Type="String" />
            <asp:Parameter Name="rlyStation" Type="String" />
            <asp:Parameter Name="doorNStreet" Type="String" />
            <asp:Parameter Name="university" Type="String" />
            <asp:Parameter Name="section" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="LoggedInUserId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="mobile" Type="String" />
            <asp:Parameter Name="yr" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="district" Type="String" />
            <asp:Parameter Name="postalCode" Type="String" />
            <asp:Parameter Name="po" Type="String" />
            <asp:Parameter Name="rlyStation" Type="String" />
            <asp:Parameter Name="doorNStreet" Type="String" />
            <asp:Parameter Name="university" Type="String" />
            <asp:Parameter Name="section" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

