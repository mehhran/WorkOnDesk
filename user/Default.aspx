<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="user_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 255px;
        }
        .style2
        {
            width: 255px;
            height: 100px;
        }
        .style3
        {
            height: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <b style="font-size: large; font-weight: bold">خوش آمدید</b>
        <table>
            <tr>
                <td>
                    مانده حساب شما در سایت:
                </td>
                <td>
                    <asp:Label ID="AccountBalanceLable" runat="server"></asp:Label>
                    &nbsp;(ریال)
                </td>
            </tr>
        </table>
        <br />
        <br />
        <b style="font-size: large; font-weight: bold">آخرین تراکنش‌ها</b>
        <br />
        <br />
        <div>
            <asp:GridView ID="UserSettlesGridView" runat="server" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging"
                AutoGenerateColumns="False" BorderWidth="0px" CellPadding="12" CellSpacing="66"
                GridLines="Horizontal" Font-Names="B Mehr">
                <Columns>
                    <asp:BoundField DataField="SettleId" HeaderText="شماره تراکنش" />
                    <asp:BoundField DataField="Amount" HeaderText="مبلغ" />
                    <asp:BoundField DataField="SettleDate" HeaderText="تاریخ" />
                    <asp:BoundField DataField="Time" HeaderText="زمان" />
                </Columns>
                <HeaderStyle BackColor="#E15605" Font-Names="B Mehr" ForeColor="White" />
                <PagerSettings Position="TopAndBottom" />
                <RowStyle BorderStyle="Groove" Wrap="True" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
