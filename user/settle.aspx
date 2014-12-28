<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="settle.aspx.cs" Inherits="user_settle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <b style="font-size: large">صفحه واریز وجه جهت گروگذاری در سایت</b> 
        <br />
        مبلغ
&nbsp;<asp:Label ID="BidAmountLable" runat="server"></asp:Label>
&nbsp;ریال<br />
        <asp:Button ID="SubmitSettle" runat="server" Text="تایید" 
            onclick="SubmitSettle_Click" />
        <br />
    
    </div>
</asp:Content>

