<%@ Page Title="" Language="C#" MasterPageFile="~/Projects/MasterPage.master" AutoEventWireup="true"
    CodeFile="ProjectView.aspx.cs" Inherits="ProjectView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 319px;
        }
        .style2
        {
            width: 346px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="ProjectOverviewFormView" runat="server" Width="778px">
        <ItemTemplate>
            <div align="center" dir="rtl" style="color: #FFFFFF; background-color: #E15605">
                <asp:Label ID="TitleLable" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True"
                    Font-Names="B Mehr" Font-Size="X-Large"></asp:Label>
            </div>
            <hr />
            &nbsp;
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        <b>ارسال‌کننده:</b>
                        <asp:Label ID="ClientUserNameLable" runat="server" Text='<%# Eval("ClientUName") %>'></asp:Label>
                    </td>
                    <td>
                        <b>حداکثر قیمت:</b>&nbsp;
                        <asp:Label ID="MaxBidLable" runat="server" Text='<%# Eval("MaxBid") %>'></asp:Label>
                        &nbsp;(ریال)
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <b>زمان ارسال:</b>&nbsp;
                        <asp:Label ID="CreateDateLable" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
                    </td>
                    <td>
                        <b>نوع پروژه:</b>&nbsp;<asp:Label ID="ProjectTypeLable" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <b>مهلت انجام پروژه:</b>&nbsp;
                        <asp:Label ID="ExpDateLable" runat="server" Text='<%# Eval("ExpDate") %>'></asp:Label>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <b>توضیحات:</b>&nbsp;
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Description") %>'></asp:Literal>
            <br />
            <br />
            <b>زیر‌ساخت پروژه:</b>&nbsp;
            <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("Platform") %>'></asp:Literal>
            <br />
            <br />
            <b>قابل تحویل:</b>&nbsp;
            <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("Delivarables") %>'></asp:Literal>
            <br />
            <br />
            <b>فایل ضمیمه:</b>&nbsp;<asp:HyperLink ID="ProjectFileHyperLink" runat="server" NavigateUrl='<%# Eval("FileName","~/files/{0}") %>'
                Target="_blank">دانلود</asp:HyperLink>
            <br />
            <br />
            <hr />
        </ItemTemplate>
    </asp:FormView>
    <div id="editdiv" align="right">
        <asp:HyperLink ID="EditProjectHyperLink" runat="server" Font-Bold="True" Font-Size="Large"
            Visible="False">ویرایش</asp:HyperLink>
        <hr style="width: 775px" />
    </div>
    <p align="center" dir="rtl">
        <b style="font-family: 'B Mitra'; font-size: large">پیشنهاد‌ها برای این پروژه</b></p>
    <br />
    <br />
    <div align="center">
        <asp:GridView ID="BidsGridView" runat="server" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging"
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
                تاکنون پیشنهادی برای این پروژه ثبت نشده است.
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#E15605" Font-Names="B Mehr" ForeColor="White" />
            <PagerSettings Position="TopAndBottom" />
            <RowStyle BorderStyle="Groove" Wrap="True" />
        </asp:GridView>
    </div>
    <br />
    <br />
    <br />
    <br />
    <hr align="right" dir="rtl" style="width: 775px; margin-right: 0px" />
    <p align="center" dir="rtl">
        <b style="font-family: 'B Mitra'; font-size: large">پیشنهاد و قیمت خود را برای این پروژه
            وارد کنید</b></p>
    <table style="width: 100%;">
        <tr>
            <td align="left" class="style2" dir="rtl">
                <asp:RequiredFieldValidator ID="BidAmountRequiredFieldValidator" runat="server" 
                    ControlToValidate="BidAmountTextBox" ErrorMessage="*" Font-Bold="False" 
                    Font-Size="Large" ForeColor="#E15605"></asp:RequiredFieldValidator>
                &nbsp;مبلغ پیشنهاد:&nbsp;
            </td>
            <td align="right" dir="rtl">
                &nbsp;
                <asp:TextBox ID="BidAmountTextBox" runat="server" Width="98px"></asp:TextBox>
                &nbsp;(ریال)
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:TextBox ID="MessageTextBox" runat="server" TextMode="MultiLine" Height="149px"
            Width="232px"></asp:TextBox>
        <br />
        <table cellspacing="20">
            <tr>
                <td>
                    <asp:FileUpload ID="MessageFileUpload" runat="server" />
                </td>
                <td>
                    <b style="font-weight: normal; font-size: small">(فقط فایل zip. مورد قبول است)</b>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="SendMessageButton" runat="server" Text="ارسال" OnClick="SendMessageButton_Click" />
    </div>
</asp:Content>
