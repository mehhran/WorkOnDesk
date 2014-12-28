using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            string prid = Request.QueryString["PID"].ToString();
            if (User.Identity.Name == MJClass.GetUserIdByProjectId(prid))
            {
                EditProjectHyperLink.Visible = true;
                EditProjectHyperLink.NavigateUrl = "~/user/EditProject.aspx?PID=" + prid;
            }
            //وارد کردن اطلاعات formview 
            List<Projects_Project> prtbl = MJClass.GetProjectTableById(prid, false);
            ProjectOverviewFormView.DataSource = prtbl;
            ProjectOverviewFormView.DataBind();
            //gridview وارد کردن اطلاعات
            List<Projects_Bid> prbid = MJClass.GetBidsByProjectId(prid);
            BidsGridView.DataSource = prbid;
            BidsGridView.DataBind();
    }
    protected void SendMessageButton_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            if (BidAmountTextBox.Text != "")
            {
                // وارد کردن پیشنهاد
                Projects_Bid pbid = new Projects_Bid();
                pbid.SupplierId = User.Identity.Name;
                pbid.ProjectId = Request.QueryString["PID"];
                pbid.Price = BidAmountTextBox.Text;
                pbid.BidDate = MJClass.GetFarsiDate(DateTime.Now, false);
                MJClass.InsertIntoBids(pbid);
                //وارد کردن پیغام همراه پیشنهاد
                Projects_Message bidmsg = new Projects_Message();
                bidmsg.ProjectId = Request.QueryString["PID"];
                bidmsg.BidId = pbid.BidId.ToString();
                bidmsg.Message = MessageTextBox.Text;
                bidmsg.Sender = User.Identity.Name;
                bidmsg.Date = MJClass.GetFarsiDate(DateTime.Now, false);
                bidmsg.Time = DateTime.Now.ToLongTimeString();
                if (MessageFileUpload.HasFile)
                {
                    if (MJClass.IsValidFileType(MessageFileUpload.FileName))
                    {
                        string fname = System.IO.Path.GetRandomFileName() + "_" + MessageFileUpload.FileName;
                        MessageFileUpload.SaveAs(Server.MapPath(@"\test2\files\") + fname);
                        bidmsg.FileName = fname;
                    }
                }
                MJClass.InsertIntoMessages(bidmsg);
                Response.Redirect("~/Projects/ProjectView.aspx?PID=" + pbid.ProjectId);
            }
            else
            {
                Response.Redirect("~/Projects/ProjectView.aspx?PID=" + Request.QueryString["PID"]);
            }
        }
        else
        {
            Response.Redirect("~/Account/Login.aspx");
        }
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BidsGridView.PageIndex = e.NewPageIndex;
        BidsGridView.DataBind();
    }
}