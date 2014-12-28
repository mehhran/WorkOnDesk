using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_MyProjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Projects_Project> q = MJClass.GetProjectsTableByClientId(User.Identity.Name);
            MyProjectsGridView.DataSource = q;
            MyProjectsGridView.DataBind();
        }
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MyProjectsGridView.PageIndex = e.NewPageIndex;
        MyProjectsGridView.DataBind();
    }
}