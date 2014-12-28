using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AccountBalanceLable.Text = MJClass.GetUserAccountBalance(User.Identity.Name).ToString();
        List<Bids_Settle> bs = MJClass.GetUserSettlesByUserId(User.Identity.Name);
        UserSettlesGridView.DataSource = bs;
        UserSettlesGridView.DataBind();
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        UserSettlesGridView.PageIndex = e.NewPageIndex;
        UserSettlesGridView.DataBind();
    }
}