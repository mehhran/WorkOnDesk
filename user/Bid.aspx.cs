using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_offer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String bidid = Request.QueryString["BID"].ToString();
            if (User.Identity.Name == MJClass.GetClientId(bidid) || User.Identity.Name == MJClass.GetSupplierId(bidid))
            {
                List<Projects_Message> m = MJClass.GetMessageTableByBidId(bidid);
                MessagesGridView.DataSource = m;
                MessagesGridView.DataBind();
                SupplierIdLable.Text = MJClass.GetSupplierId(bidid);
                ClientIdLable.Text = MJClass.GetClientId(bidid);
                SupplierIdLable2.Text = MJClass.GetSupplierId(bidid);
                BidAmountLable.Text = MJClass.GetBidAmount(bidid);
                ProjectHyperLink.Text = MJClass.GetProjectTitle(bidid);
                ProjectHyperLink.NavigateUrl = "~/Projects/ProjectView.aspx?PID=" + MJClass.GetProjectId(bidid);
                if (User.Identity.Name == MJClass.GetClientId(bidid))
                {
                    if (MJClass.IsBidAccepted(bidid))
                    {
                        AcceptedLable.Visible = true;

                        if (MJClass.IsClientSatisfied(bidid))
                        {
                            SatisfiedLable.Visible = true;
                            AcceptedLable.Visible = false;
                        }
                        else
                        {
                            SatisfiedButton.Visible = true;
                        }
                    }
                    else
                    {
                        AcceptBidButton.Visible = true;
                    }
                }
                else if (User.Identity.Name == MJClass.GetSupplierId(bidid))
                {
                    if (MJClass.IsBidAccepted(bidid))
                    {
                        AcceptedLable.Visible = true;
                        if (MJClass.IsClientSatisfied(bidid))
                        {
                            AcceptedLable.Visible = false;
                            SatisfiedLable.Visible = true;
                        }
                    }

                }
            }
            else
            {
                Response.Redirect("~/Projects/AccessDenied.aspx?PID=" + MJClass.GetProjectId(bidid));
            }
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // وارد کردن پیام
        if (MessageTextBox.Text != "")
        {
            Projects_Message pm = new Projects_Message();
            pm.BidId = Request.QueryString["BID"].ToString();
            pm.ProjectId = MJClass.GetProjectId(Request.QueryString["BID"].ToString());
            pm.Message = MessageTextBox.Text;
            pm.Sender = User.Identity.Name;
            pm.Date = MJClass.GetFarsiDate(DateTime.Now, false);
            pm.Time = DateTime.Now.ToLongTimeString();
            //file
            if (MessagesFileUpload.HasFile)
            {
                if (MJClass.IsValidFileType(MessagesFileUpload.FileName))
                {
                    string fname = System.IO.Path.GetRandomFileName() + "_" + MessagesFileUpload.FileName;
                    MessagesFileUpload.SaveAs(Server.MapPath(@"\test2\files\") + fname);
                    pm.FileName = fname;
                }
            }
            MJClass.InsertIntoMessages(pm);
            Response.Redirect("~/user/Bid.aspx?BID=" + Request.QueryString["BID"].ToString());
        }
    }
    protected void AcceptBidButton_Click(object sender, EventArgs e)
    {
        string BidID = Request.QueryString["BID"].ToString();
        Response.Redirect("~/user/settle.aspx?BID=" + BidID);
    }
    protected void SatisfiedButton_Click(object sender, EventArgs e)
    {
        string bidid = Request.QueryString["BID"].ToString();
        //اضافه کردن مبلغ به حساب مجری
        Bids_Settle bs1 = new Bids_Settle();
        bs1.UserName = MJClass.GetSupplierId(bidid);
        bs1.BidId = bidid;
        bs1.SettleDate = MJClass.GetFarsiDate(DateTime.Now, false);
        bs1.Time = DateTime.Now.ToLongTimeString();
        bs1.Amount = Convert.ToInt32(MJClass.GetBidAmount(bidid));
        //کم کردن مبلغ از حساب خریدار
        Bids_Settle bs2 = new Bids_Settle();
        bs2.UserName = MJClass.GetClientId(bidid);
        bs2.BidId = bidid;
        bs2.SettleDate = MJClass.GetFarsiDate(DateTime.Now, false);
        bs2.Time = DateTime.Now.ToLongTimeString();
        bs2.Amount = -1 * Convert.ToInt32(MJClass.GetBidAmount(bidid));
        MJClass.SetSatisfiedTrue(bidid, bs1, bs2);
        Response.Redirect("~/user/Bid.aspx?BID=" + bidid);
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MessagesGridView.PageIndex = e.NewPageIndex;
        MessagesGridView.DataBind();
    }
}