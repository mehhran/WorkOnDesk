<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true"
    CodeFile="MyBids.aspx.cs" Inherits="user_MyBids" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <b dir="rtl" style="font-size: large;">پیشنهادهای من</b></div>
    <br />
    <br />
    <div align="center">
        <asp:GridView ID="UserBidsGridView" runat="server" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging"
            AutoGenerateColumns="False" BorderWidth="0px" CellPadding="12" CellSpacing="66"
            GridLines="Horizontal" Font-Names="B Mehr">
            <Columns>
                <asp:BoundField DataField="SupplierId" HeaderText="از طرف" />
                <asp:BoundField HeaderText="accepted" DataField="Accepted" />
                <asp:BoundField DataField="Price" HeaderText="قیمت پیشنهادی" />
                <asp:BoundField DataField="BidDate" HeaderText="تاریخ" />
                <asp:TemplateField HeaderText="پیام‌ها">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval ("BidId" , "~/user/Bid.aspx?BID={0}") %>'>دیدن پیام‌ها و ارسال پاسخ</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                تاکنون پیشنهادی نداده‌اید!
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#E15605" Font-Names="B Mehr" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <RowStyle BorderStyle="Groove" Wrap="True" />
        </asp:GridView>
    </div>
</asp:Content>
