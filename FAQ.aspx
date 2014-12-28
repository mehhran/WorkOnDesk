<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <div style="float:right; width : 300px">
            <h1>
                آیا نیاز به نرم افزار دارید؟</h1>
            انجام انواع پروژه های کوچک، متوسط و بزرگ.<br />
            <ul>
                <li>طراحی وب سایت</li>
                <li>ساخت نرم‌افزار سفارشی</li>
                <li>رفع اشکالات نرم افزار و وب سایت های موجود</li>
                <li>طراحی</li>
                <li>ترجمه متون</li>
                <li>ویراستاری</li>
                <li>صفحه آرایی</li>
                <li>نویسندگی</li>
                <li>ورود اطلاعات</li>
                <li>طراحی مدارات الکترونیکی</li>
                <li>طراحی PCB</li>
                <li>پروژه های میکروکنترولری</li>
                <li>...</li>
            </ul>
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/user/PostProject.aspx">درخواست خود را وارد کنید!</asp:HyperLink>
        </div>
        <div style="width:180px; height:100% ; float:right">
        <img alt="" src="pics/5413867.cms.jpg" 
          style="width: 100px; height: 100px" />
        </div>
        <div style="float:left; width : 300px; float:right">
            <h1>
                آیا توانایی انجام پروژه را دارید؟</h1>
            در هر یک از زمینه های زیر که تخصص دارید،ثبت نام کنید و از امروز از تخصص خود کسب
            درآمد نمایید.
            <ul>
                <li>برنامه نویسی به هر زبانی</li>
                <li>طراحی گرافیکی</li>
                <li>ترجمه متون</li>
                <li>نویسندگی</li>
                <li>ویراستاری</li>
                <li>تایپ و ورود اطلاعات</li>
                <li>طراحی مدارات الکترونیکی</li>
                <li>طراحی PCB</li>
                <li>کار با میکروکنترولر ها</li>
                <li>کار با نرم افزار های مهندسی</li>
                <li>...</li>
            </ul>
            همین حالا &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Account/Register.aspx">ثبت نام</asp:HyperLink>
            &nbsp;کنید و قیمت خود را برای انجام
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/projects/Projects.aspx">پروژه‌های موجود</asp:HyperLink>
            &nbsp;اعلام نمایید.
        </div>
    </div>
</asp:Content>

