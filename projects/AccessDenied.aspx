<%@ Page Title="" Language="C#" MasterPageFile="~/projects/MasterPage.master" AutoEventWireup="true"
    CodeFile="AccessDenied.aspx.cs" Inherits="user_Access_Denied" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div dir="rtl" align="center">
        <b>بخش پیام‌ها بین مجری و خریدار به صورت محرمانه می‌باشد. </b>
        <br />
       <asp:HyperLink ID="ReturnLink" runat="server"><b>بازگشت</b></asp:HyperLink>
    </div> 
</asp:Content>
