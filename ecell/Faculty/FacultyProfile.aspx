<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyProfile.aspx.cs" Inherits="FacultyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1>Faculty/Staff Profile</h1></center>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
           
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>
                        <asp:TextBox ID="firstNameTextBox" runat="server" Text='<%# Bind("firstName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>
                        <asp:TextBox ID="lastNameTextBox" runat="server" Text='<%# Bind("lastName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Mobile :</td>
                    <td>
                        <asp:TextBox ID="mobileNumberTextBox" runat="server" Text='<%# Bind("mobileNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Joining Year:</td>
                    <td>
                        <asp:TextBox ID="joiningYearTextBox" runat="server" Text='<%# Bind("joiningYear") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Department: </td>
                    <td>
                        <asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Door and Street:</td>
                    <td>
                        <asp:TextBox ID="doorNStreetTextBox" runat="server" Text='<%# Bind("doorNStreet") %>' />
                    </td>
                </tr>
                <tr>
                    <td>RailwayStation:</td>
                    <td>
                        <asp:TextBox ID="rlyStationTextBox" runat="server" Text='<%# Bind("rlyStation") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Post Office:</td>
                    <td>
                        <asp:TextBox ID="poTextBox" runat="server" Text='<%# Bind("po") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Postal Code:</td>
                    <td>
                        <asp:TextBox ID="postalCodeTextBox" runat="server" Text='<%# Bind("postalCode") %>' />
                    </td>
                </tr>
                <tr>
                    <td>District:</td>
                    <td>
                        <asp:TextBox ID="districtTextBox" runat="server" Text='<%# Bind("district") %>' />
                    </td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td>
                        <asp:TextBox ID="stateTextBox" runat="server" Height="22px" Text='<%# Bind("state") %>' />
                    </td>
                </tr>
                <tr>
                    <td> <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" /></td>
                    <td><asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
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
            mobileNumber:
            <asp:TextBox ID="mobileNumberTextBox" runat="server" Text='<%# Bind("mobileNumber") %>' />
            <br />
            joiningYear:
            <asp:TextBox ID="joiningYearTextBox" runat="server" Text='<%# Bind("joiningYear") %>' />
            <br />
            department:
            <asp:TextBox ID="departmentTextBox" runat="server" Text='<%# Bind("department") %>' />
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
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>
                        <asp:Label ID="firstNameLabel" runat="server" Text='<%# Bind("firstName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>
                        <asp:Label ID="lastNameLabel" runat="server" Text='<%# Bind("lastName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Mobile :</td>
                    <td>
                        <asp:Label ID="mobileNumberLabel" runat="server" Text='<%# Bind("mobileNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td>JoiningYear:</td>
                    <td>
                        <asp:Label ID="joiningYearLabel" runat="server" Text='<%# Bind("joiningYear") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td>
                        <asp:Label ID="departmentLabel" runat="server" Text='<%# Bind("department") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Door and Street:</td>
                    <td>
                        <asp:Label ID="doorNStreetLabel" runat="server" Text='<%# Bind("doorNStreet") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Railway Station:</td>
                    <td>
                        <asp:Label ID="rlyStationLabel" runat="server" Text='<%# Bind("rlyStation") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Post Office:</td>
                    <td>
                        <asp:Label ID="poLabel" runat="server" Text='<%# Bind("po") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Postal Code: </td>
                    <td>
                        <asp:Label ID="postalCodeLabel" runat="server" Text='<%# Bind("postalCode") %>' />
                    </td>
                </tr>
                <tr>
                    <td>District:</td>
                    <td>
                        <asp:Label ID="districtLabel" runat="server" Text='<%# Bind("district") %>' />
                    </td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td>
                        <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:HyperLink runat="server" NavigateUrl="~/Faculty/ChangeLoginPassword.aspx">Change Password</asp:HyperLink>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:db %>" 
        DeleteCommand="DELETE FROM [tblFacultyRegistration] WHERE [id] = @original_id AND [firstName] = @original_firstName AND [lastName] = @original_lastName AND [email] = @original_email AND [mobileNumber] = @original_mobileNumber AND [joiningYear] = @original_joiningYear AND [department] = @original_department AND [doorNStreet] = @original_doorNStreet AND [rlyStation] = @original_rlyStation AND [po] = @original_po AND [postalCode] = @original_postalCode AND [district] = @original_district AND [state] = @original_state AND [status] = @original_status" 
        InsertCommand="INSERT INTO [tblFacultyRegistration] ([firstName], [lastName], [email], [mobileNumber], [joiningYear], [department], [doorNStreet], [rlyStation], [po], [postalCode], [district], [state], [status]) VALUES (@firstName, @lastName, @email, @mobileNumber, @joiningYear, @department, @doorNStreet, @rlyStation, @po, @postalCode, @district, @state, @status)" OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [id], [firstName], [lastName], [email], [mobileNumber], [joiningYear], [department], [doorNStreet], [rlyStation], [po], [postalCode], [district], [state], [status] FROM [tblFacultyRegistration] WHERE ([id] = @id)"
        UpdateCommand="UPDATE [tblFacultyRegistration] SET [firstName] = @firstName, [lastName] = @lastName, [mobileNumber] = @mobileNumber, [joiningYear] = @joiningYear, [department] = @department, [doorNStreet] = @doorNStreet, [rlyStation] = @rlyStation, [po] = @po, [postalCode] = @postalCode, [district] = @district, [state] = @state WHERE [id] = @original_id">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_mobileNumber" Type="String" />
            <asp:Parameter Name="original_joiningYear" Type="String" />
            <asp:Parameter Name="original_department" Type="String" />
            <asp:Parameter Name="original_doorNStreet" Type="String" />
            <asp:Parameter Name="original_rlyStation" Type="String" />
            <asp:Parameter Name="original_po" Type="String" />
            <asp:Parameter Name="original_postalCode" Type="String" />
            <asp:Parameter Name="original_district" Type="String" />
            <asp:Parameter Name="original_state" Type="String" />
            <asp:Parameter Name="original_status" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobileNumber" Type="String" />
            <asp:Parameter Name="joiningYear" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="doorNStreet" Type="String" />
            <asp:Parameter Name="rlyStation" Type="String" />
            <asp:Parameter Name="po" Type="String" />
            <asp:Parameter Name="postalCode" Type="String" />
            <asp:Parameter Name="district" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="LoggedInFUserId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="mobileNumber" Type="String" />
            <asp:Parameter Name="joiningYear" Type="String" />
            <asp:Parameter Name="department" Type="String" />
            <asp:Parameter Name="doorNStreet" Type="String" />
            <asp:Parameter Name="rlyStation" Type="String" />
            <asp:Parameter Name="po" Type="String" />
            <asp:Parameter Name="postalCode" Type="String" />
            <asp:Parameter Name="district" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

