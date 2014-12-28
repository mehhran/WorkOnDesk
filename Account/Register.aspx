<%@ Page Title="" Language="C#" MasterPageFile="~/Account/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<script runat="server">
    public void assignrole(object sender, EventArgs e)
    {
        Roles.AddUserToRole(User.Identity.Name, "user");
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div dir="rtl" align="center"> 
    
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            CompleteSuccessText="حساب کاربری با موفقیت ساخته شد." 
            CreateUserButtonText="تایید" 
            DuplicateEmailErrorMessage="پست الکترونیکی وارد شده تکراری است.لطفا مجددا با دقت بیشتر وارد کنید." 
            DuplicateUserNameErrorMessage="این نام در دسترس نیست.لطفا نام کاربری دیگری انتخاب کنید." 
            FinishCompleteButtonText="پایان" FinishPreviousButtonText="قبلی" 
            InvalidAnswerErrorMessage="لطفا یک جواب دیگر برای سوال امنیتی بدهید." 
            InvalidEmailErrorMessage="آدرس پست الکترونیکی نامعتبر است." 
            InvalidPasswordErrorMessage="حداقل طول کلمه عبور d: {0}. Non-alphanumeric characters required: {1}." 
            InvalidQuestionErrorMessage="سوال امنیتی قابل قبول نیست." 
            StartNextButtonText="بعدی" StepNextButtonText="بعدی" 
            StepPreviousButtonText="قبلی" 
            oncreateduser="CreateUserWizard1_CreatedUser">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="  برای باز کردن حساب جدید ثبت نام کنید."  >
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2" style="color:White;background-color:#E15605;font-size:0.9em;font-weight:bold;">
                                برای باز کردن حساب جدید ثبت نام کنید</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">نام کاربری :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="نام کاربری لازم می‌باشد." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">کلمه عبور :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="کلمه عبور لازم می‌باشد." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">تکرار کلمه عبور :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="تکرار رمز عبور لازم می‌باشد." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">پست الکترونیکی :</asp:Label>
                            </td>
                            <td class="style1">
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="فیلد آدرس ایمیل نمی‌تواند خالی باشد." 
                                    ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">سوال امنیتی :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                    ControlToValidate="Question" ErrorMessage="فیلد سوال امنیتی نمی‌تواند خالی باشد." 
                                    ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">پاسخ سوال امنیتی :</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                    ControlToValidate="Answer" ErrorMessage="پاسخ سوال امنیتی نمی‌تواند خالی باشد." 
                                    ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" ErrorMessage="کلمه عبور و تکرار آن با هم مطابقت ندارند!" 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>

            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="پایان" >
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center">
                                پایان</td>
                        </tr>
                        <tr>
                            <td>
                                حساب کاربری با موفقیت ساخته شد.</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" 
                                    PostBackUrl="~/Default.aspx" Text="ادامه" 
                                    ValidationGroup="CreateUserWizard1"  />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
</asp:Content>

