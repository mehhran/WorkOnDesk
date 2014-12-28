<%@ Page Title="" Language="C#"  MasterPageFile="~/Projects/MasterPage.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 83px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <asp:GridView ID="ProjectsGridView" runat="server" AllowPaging="True" OnPageIndexChanging="gridView_PageIndexChanging"
        AutoGenerateColumns="False" BorderWidth="0px" CellPadding="2" CellSpacing="22" 
        DataKeyNames="ProjectId"  GridLines="Horizontal" 
        Width="85%" Font-Names="B Mehr">
        <Columns>
            <asp:TemplateField HeaderText="عنوان">
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td class="style1" valign="top">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval ("Title") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval ("ProjectId" , "~/Projects/ProjectView.aspx?PID={0}") %>'>مشاهده جزئیات ...</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle Wrap="True" Font-Bold="True" Font-Size="Large" Height="100px" 
                    VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نوع پروژه">
                <ItemTemplate>
                    <div align="center">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Justify" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="حداکثر قیمت">
            <ItemTemplate>
                <div align="center">
                    
                    <asp:Label ID="MaxBidLable" runat="server" Text='<%# Eval("MaxBid") %>'></asp:Label>
                    
                </div>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Justify" VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاریخ شروع">
                <ItemTemplate>
                    <div align="center">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("CreateDate") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="توسط">
                <ItemTemplate>
                    <div align="center">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ClientUName") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#E15605" Font-Names="B Mehr" ForeColor="White" />
        <PagerSettings Position="TopAndBottom" />
        <RowStyle BorderStyle="Groove" Wrap="True" />
    </asp:GridView>
    </div>

    </asp:Content>

