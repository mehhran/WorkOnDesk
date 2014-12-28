using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_MyBids : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            List<Projects_Bid> pbid = MJClass.GetBidsByUserId(User.Identity.Name);
            UserBidsGridView.DataSource = pbid;
            UserBidsGridView.DataBind();
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserBidsGridView.PageIndex = e.NewPageIndex;
        UserBidsGridView.DataBind();
    }
}