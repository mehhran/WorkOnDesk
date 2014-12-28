<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">

        <br />
        <p style="font-family: 'B Helal'; font-size: xx-large; color: #666666;">
            مناسبترین پیمانکار را بیابید.کار شما تمام است.</p>
        
        <img style="width: 350px; height: 220px" src="pics/shutterstock_51265576.jpg" />
        <br />
        <asp:Button ID="ProjectsButton" runat="server" Font-Bold="True" Font-Names="B Helal"
            ForeColor="#999999" Text="دنبال کار هستید؟" PostBackUrl="~/projects/Projects.aspx" />
        <asp:Button ID="PostProjectButton" runat="server" BackColor="#E15605" Font-Bold="True"
            Font-Names="B Helal" ForeColor="#FFFFCC" Text="ارسال مجانی درخواست" PostBackUrl="~/user/PostProject.aspx" />
        <br />
    </div>
</asp:Content>
