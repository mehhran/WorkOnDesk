using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_EditProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string prid = Request.QueryString["PID"].ToString();
            if (User.Identity.Name == MJClass.GetUserIdByProjectId(prid))
            {
                Projects_Project ProjectTable = MJClass.GetProjectTableById(prid);
                TitleTexbox.Text = ProjectTable.Title;
                ProjectTypeRadioButton.Text = ProjectTable.Type;
                DeadlineTextBox.Text = ProjectTable.ExpDate;
                DescriptionTextBox.Text = ProjectTable.Description;
                DeliverablesTextBox.Text = ProjectTable.Delivarables;
                PlatformTextBox.Text = ProjectTable.Platform;
                MaxbidTextBox.Text = ProjectTable.MaxBid;

            }
            else
            {
                Response.Redirect("~/Projects/ProjectView.aspx?PID=" + prid);
            }
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Projects_Project ProjectTable = new Projects_Project();
        ProjectTable.Title = TitleTexbox.Text;
        ProjectTable.Type = ProjectTypeRadioButton.Text;
        ProjectTable.ExpDate = DeadlineTextBox.Text;
        ProjectTable.Description = DescriptionTextBox.Text;
        ProjectTable.Delivarables = DeliverablesTextBox.Text;
        ProjectTable.Platform = PlatformTextBox.Text;
        ProjectTable.MaxBid = MaxbidTextBox.Text;
        if (ProjectFileUpload.HasFile)
        {
            if (MJClass.GetProjectTableById(Request.QueryString["PID"]).FileName != "nofile")
            {
                try
                {
                    System.IO.File.Delete(Server.MapPath(@"\test2\files\") + MJClass.GetProjectTableById(Request.QueryString["PID"]).FileName);
                }
                catch { }
            }
            if (MJClass.IsValidFileType(ProjectFileUpload.FileName))
            {
                string fname = System.IO.Path.GetRandomFileName() + "_" + ProjectFileUpload.FileName;
                ProjectFileUpload.SaveAs(Server.MapPath(@"\test2\files\") + fname);
                ProjectTable.FileName = fname;
            }
            else
            {
                ProjectTable.FileName = "nofile";
            }
        }
        MJClass.InsertIntoProjects(ProjectTable, true, Request.QueryString["PID"]);
        Response.Redirect("~/Projects/ProjectView.aspx?PID=" + Request.QueryString["PID"]);
    }
}