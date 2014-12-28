<%@ Page Title="" Language="C#" MasterPageFile="~/Projects/MasterPage.master" AutoEventWireup="true"
    CodeFile="PostProject.aspx.cs" Inherits="Projects_PostProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 178px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table dir="rtl" style="width: 100%;">
            <tr>
                <td class="style1">
                    &nbsp;<b>عنوان درخواست:</b>
                    <br />
                    &nbsp; <font size="-1">عنوانی کوتاه برای پروژه</font>
                </td>
                <td>
                    <asp:TextBox ID="TitleTexbox" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="TitleTexboxValidator" runat="server" ControlToValidate="TitleTexbox"
                        ErrorMessage="عنوان باید وارد شود" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;<b>نوع پروژه:</b>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProjectTypeRadioButton"
                        ErrorMessage="لطفا نوع درخواست را تعیین کنید" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;
                    <asp:RadioButtonList ID="ProjectTypeRadioButton" runat="server">
                        <asp:ListItem>پروژه شخصی </asp:ListItem>
                        <asp:ListItem>غیر آگاه در مورد قیمت پروژه </asp:ListItem>
                        <asp:ListItem> پروژه تجاری خیلی کوچک: کمتر از 1،000،000 ریال</asp:ListItem>
                        <asp:ListItem> پروژه تجاری کوچک: 1،000،000 ریال و بیشتر</asp:ListItem>
                        <asp:ListItem> پروژه تجاری متوسط: 5،000،000 ریال و بیشتر</asp:ListItem>
                        <asp:ListItem> پروژه تجاری بزرگ: 50،000،000 ریال و بیشتر</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp; <b>توضیحات:</b>
                    <br />
                    <asp:RequiredFieldValidator ID="ProjectDescriptionValidator" runat="server" ControlToValidate="DescriptionTextBox"
                        ErrorMessage="لطفا شرح پروژه را وارد کنید" Font-Bold="True" ForeColor="#CC3300"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Height="150px" TextMode="MultiLine"
                        Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp; <b>قابل تحویل:</b>
                    <br />
                    &nbsp; <font size="-1">لیست کامل و توضیح چیزهایی که شما قبل از پرداخت به مجری از وی
                        می‌خواهید</font>
                </td>
                <td>
                    <asp:TextBox ID="DeliverablesTextBox" runat="server" Height="150px" TextMode="MultiLine"
                        Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;<b>زیر‌ساخت‌های پروژه:</b>
                    <br />
                    &nbsp; <font size="-1">سیستم‌عامل و محیطی که پروژه باید در آن کار کنند، مثلا : Windows
                        XP، تمام نگارش های بعد از اینترنت اکسپلورر 6.0، لینوکس، ...</font>
                </td>
                <td>
                    <asp:TextBox ID="PlatformTextBox" runat="server" Height="100px" TextMode="MultiLine"
                        Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    &nbsp;<b>فایل:</b>
                    <br />
                    &nbsp; <font size="-1">درصورت تمایل می توانید فایل برای اطلاعات اضافه ضمیمه کنید</font>
                </td>
                <td>
                    <asp:FileUpload ID="ProjectFileUpload" runat="server" />
                    &nbsp;&nbsp; <b style="font-weight: normal; font-size: small">(فقط فایل zip. مورد قبول
                        است)</b>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    &nbsp;<b>تحویلدر:</b>
                    <br />
                    &nbsp; <font size="-1">صرف نظر کردن از این مورد برای سلامت پروژه بسیار خطرناک است</font>
                </td>
                <td>
                    <asp:TextBox ID="DeadlineTextBox" runat="server" MaxLength="3" Width="49px"></asp:TextBox>
                    &nbsp;روز
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <br />
                    &nbsp; <b>حداکثر قیمت:</b>
                    <br />
                    &nbsp; <font size="-1">این حد اکثر مبلغی است که شما برای انجام پروژه خود پرداخت می کنید،
                        مجریان مینوانند قیمتی پایین تر از این را برای گرفتن کار پیشنهاد دهند</font>
                </td>
                <td>
                    <asp:TextBox ID="MaxbidTextBox" runat="server" Width="106px"></asp:TextBox>
                    &nbsp;ریال
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="SubmitButton" runat="server" Text="تایید و ارسال" OnClick="SubmitButton_Click" />
        <br />
    </div>
</asp:Content>
