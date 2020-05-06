<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyRegistration.aspx.cs" Inherits="FacultyRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
    Faculty Registration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #0000FF;
        }
        .auto-style4 {
        width: 30%;
        height: 26px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <table align="center">
        <tr>
            <th colspan="3">
                <h1>Faculty Registration Details</h1>
            </th>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td colspan="3" style="text-align: center; font-size: x-large; color: #FF0000; font-style: italic; font-weight: 700"><label>*All fields are mandatory</label></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>



        <tr>
            <td style="text-align: right; width:30%">
                <label>First Name</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxFirstName" runat="server" Width="240px"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="First Name is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxFirstName" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>

        
        <tr>
            <td style="text-align: right; width:30%">
                <label>Last Name</label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxLastName" runat="server" Width="240px"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Last Name is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxLastName" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>

        <tr>
            <td style="text-align: right; width:30%">
                <label>Email</label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxEmail" runat="server" Width="240px" AutoPostBack="True" OnTextChanged="TextBoxEmail_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Email is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxEmail" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Please enter valid email address" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Submit">?</asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblDuplicateEmail" runat="server"></asp:Label>
            </td>
            <td></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Mobile Number</label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxMobile" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobileNumber" runat="server" ErrorMessage="Mobile number is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxMobile" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="TextBoxMobile" ErrorMessage="Please enter valid mobile number" Font-Bold="True" ForeColor="Red" ValidationExpression="^[0-9]{1,10}$" ValidationGroup="Submit">?</asp:RegularExpressionValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>


        <tr>
             <td style="text-align: right; " class="auto-style4">
                <label>Joining Year</label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownListYear" runat="server" Width="245px">
                    <asp:ListItem>-- Select Year --</asp:ListItem>
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    
                    
                </asp:DropDownList>
             </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorYear" runat="server" ErrorMessage="Year is required" Font-Bold="True" ForeColor="Red" ControlToValidate="DropDownListYear" InitialValue="-- Select Year --" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Department</label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxDepartment" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepartment" runat="server" ErrorMessage="Department is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxDepartment" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Mailing Address :-</label>
            </td>
            <td ></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Door No. &amp; Street</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxDoorNStreet" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDoorNStreet" runat="server" ErrorMessage="Door No. &amp; Street is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxDoorNStreet" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Nearest Rly Station</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxRlyStation" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNearestRly" runat="server" ErrorMessage="Nearest Rly Station is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxRlyStation" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>P. O<em style="color:red"> </em></label>
&nbsp;</td>
            <td >
                <asp:TextBox ID="TextBoxPO" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPO" runat="server" ErrorMessage="P. O.  is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxPO" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>Postal Code</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxPostalCode" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostalCode" runat="server" ErrorMessage="Postal Code is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxPostalCode" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>District</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxDistrict" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDistrict" runat="server" ErrorMessage="District is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxDistrict" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td></td>
            <td ></td>
            <td ></td>
        </tr>


        <tr>
             <td style="text-align: right; width:30%">
                <label>State</label>
            </td>
            <td >
                <asp:TextBox ID="TextBoxState" runat="server" Width="240px"></asp:TextBox>
             </td>
            <td >
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ErrorMessage="State is required" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBoxState" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
             </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
             <td style="text-align: right; width:30%"></td>
             <td style="text-align:left;">
                 
                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="Submit" Width="247px" OnClick="btnSubmit_Click" />
             </td>
             <td style="text-align: right; "></td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

         <tr>
             <td style="text-align: right; width:30%"></td>
             <td style="text-align:left;">
             
                 <asp:Button ID="btnReset" runat="server" Text="Reset" Width="247px" OnClick="btnReset_Click" />
             </td>
             <td style="text-align: right; "></td>
        </tr>

        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="vsSubmit" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationGroup="Submit" />
            </td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="lblStatus" runat="server"></asp:Label></td>
            <td></td>
        </tr>

        <tr>
            <td></td>
            <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
            <td></td>
        </tr>

        </table>
</asp:Content>

