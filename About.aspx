<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div dir="rtl" align="center">
<%Response.Write(MJClass.GetFarsiDate(DateTime.Now, false)); %>
<br />

<%Response.Write(DateTime.Now.ToLongTimeString()); %>
<br />

</div>
</asp:Content>

