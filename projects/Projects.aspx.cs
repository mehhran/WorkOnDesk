﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Projects_Project> prtbl = MJClass.GetProjectsTable();        
        ProjectsGridView.DataSource = prtbl;
        ProjectsGridView.DataBind();
    }
    protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ProjectsGridView.PageIndex = e.NewPageIndex;
        ProjectsGridView.DataBind();
    }
}