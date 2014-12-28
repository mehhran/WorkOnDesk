using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_settle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BidAmountLable.Text = MJClass.GetBidAmount(Request.QueryString["BID"].ToString());
        }
    }
    protected void SubmitSettle_Click(object sender, EventArgs e)
    {
        String bidid = Request.QueryString["BID"].ToString();
        //اضافه کردن مبلغ به حساب خریدار
        Bids_Settle bs = new Bids_Settle();
        bs.UserName = User.Identity.Name;
        bs.BidId = bidid;
        bs.SettleDate = MJClass.GetFarsiDate(DateTime.Now, false);
        bs.Time = DateTime.Now.ToLongTimeString();
        bs.Amount = Convert.ToInt32(MJClass.GetBidAmount(bidid));
        MJClass.SetAcceptedTrue(bidid, bs);
        Response.Redirect("~/user/Bid.aspx?BID=" + bidid);
    }
}