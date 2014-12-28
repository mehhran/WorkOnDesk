<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 254px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">

    <table style="width:100%;">
        <tr>
            <td class="style1" style="font-weight: bold" align="left">
                &nbsp;نام و نام خانوادگی:&nbsp;</td>
            <td align="right">
                <asp:TextBox ID="NameTextBox" runat="server" Width="275px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1" style="font-weight: bold" align="left">
                آدرس پست الکترونیکی:</td>
            <td align="right">
                ‍<asp:TextBox 
                    ID="EmailTextBox" runat="server" Width="275px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="EmailTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" style="font-weight: bold" align="left">
                شماره تماس:</td>
            <td align="right">
                <asp:TextBox ID="TellNoTextBox" runat="server" Width="275px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1" style="font-weight: bold" align="left">
                پیغام:</td>
            <td align="right">
                <asp:TextBox ID="MessageTextBox" runat="server" Height="126px" 
                    TextMode="MultiLine" Width="361px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="SubmittButton" runat="server" Text="ارسال" Font-Bold="True" 
        Font-Size="Large" Width="163px" onclick="SubmittButton_Click" />

</div>
</asp:Content>

