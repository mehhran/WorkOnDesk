<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true"
    CodeFile="Bid.aspx.cs" Inherits="user_offer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center" dir="rtl" style="font-size: large; font-weight: bold;">
        پیام‌های خصوصی بین مجری (<asp:Label ID="SupplierIdLable" runat="server"></asp:Label>
        ) و خریدار (<asp:Label ID="ClientIdLable" runat="server"></asp:Label>
        )
        <br />
        عنوان پروژه :
        <asp:HyperLink ID="ProjectHyperLink" runat="server">[ProjectHyperLink]</asp:HyperLink>
        <br />
    
    <br />
    <hr />
    <br />
    <b>پیشنهاد به مبلغ&nbsp;<asp:Label ID="BidAmountLable" runat="server"></asp:Label>
        &nbsp;(ریال) از طرف&nbsp;<asp:Label ID="SupplierIdLable2" runat="server"></asp:Label>
        &nbsp;می‌باشد.</b>
    <br />
    <asp:Button ID="AcceptBidButton" runat="server" BackColor="White" Font-Bold="True"
        Font-Size="Large" ForeColor="#E15605" Text="قبول پیشنهاد" Visible="False" OnClick="AcceptBidButton_Click"
        Width="280px" />
    <asp:Button ID="SatisfiedButton" runat="server" BackColor="White" Font-Bold="True"
        Font-Size="Large" ForeColor="#E15605" 
        Text="اعلام رضایت و دادن وجه به مجری" Visible="False"
        OnClick="SatisfiedButton_Click" Style="margin-right: 0px" />
    <br />
    <asp:Label ID="AcceptedLable" runat="server" Text="پیشنهاد از طرف خریدار قبول شده و مبلغ پیشنهاد نزد سایت گرو می‌باشد."
        Visible="False" Font-Bold="True"></asp:Label>
    &nbsp;<asp:Label ID="SatisfiedLable" runat="server" Text="خریدار رضایت خود را اعلام کرده و پول به حساب مجری واریز شده است."
        Visible="False" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />
    &nbsp;<br />
    <br />
    <asp:GridView ID="MessagesGridView" runat="server" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging"
        AutoGenerateColumns="False" BorderWidth="0px" CellPadding="12" CellSpacing="66"
        GridLines="Horizontal" Font-Names="B Mehr">
        <Columns>
            <asp:TemplateField HeaderText="پیغام">
                <ItemTemplate>
                    <div dir="rtl">
                        <asp:Label ID="SenderLable" runat="server" Text='<%# Eval("Sender") %>'></asp:Label>&nbsp;:&nbsp;
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Message") %>' TextMode="MultiLine"
                            ReadOnly="True" Width="300px" Height="100px"></asp:TextBox>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Date" HeaderText="در تاریخ" />
            <asp:BoundField DataField="Time" HeaderText="ساعت" />
            
            <asp:TemplateField HeaderText="ضمیمه">
                <ItemTemplate>
                    <div align="center">
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("FileName","~/files/{0}") %>' Target="_blank">ذخیره</asp:HyperLink>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
        <HeaderStyle BackColor="#E15605" Font-Names="B Mehr" ForeColor="White" />
        <PagerSettings Position="TopAndBottom" />
        <RowStyle BorderStyle="Groove" Wrap="True" />
    </asp:GridView>
    <br />
    <br />
    <p align="right" dir="rtl">
        <b>ارسال پاسخ</b></p>
    <p align="right" dir="rtl">
        <asp:TextBox ID="MessageTextBox" runat="server" Height="122px" TextMode="MultiLine"
            Width="325px"></asp:TextBox>
    </p>
    <p align="right" dir="rtl">
        <asp:FileUpload ID="MessagesFileUpload" runat="server" />
        &nbsp;&nbsp; <b style="font-weight: normal; font-size: small">(فقط فایل zip. مورد قبول
            است)</b><br />
        <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="ارسال" />
    </p>


    </div>
</asp:Content>
