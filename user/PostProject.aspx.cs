using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;



public partial class Projects_PostProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Projects_Project ProjectTable = new Projects_Project();
        ProjectTable.ClientUName = User.Identity.Name;
        ProjectTable.Title = TitleTexbox.Text;
        ProjectTable.Type = ProjectTypeRadioButton.Text;
        ProjectTable.CreateDate = MJClass.GetFarsiDate(DateTime.Now, false);
        ProjectTable.ExpDate = DeadlineTextBox.Text;
        ProjectTable.Description = DescriptionTextBox.Text;
        ProjectTable.Delivarables = DeliverablesTextBox.Text;
        ProjectTable.Platform = PlatformTextBox.Text;
        ProjectTable.MaxBid = MaxbidTextBox.Text;
        if (ProjectFileUpload.HasFile)
        {
            if (MJClass.IsValidFileType(ProjectFileUpload.FileName))
            {
                string fname = System.IO.Path.GetRandomFileName() + "_" + ProjectFileUpload.FileName;
                ProjectFileUpload.SaveAs(Server.MapPath(@"\test2\files\") + fname);
                ProjectTable.FileName = fname;
            }
        }
        else
        {
            ProjectTable.FileName = "nofile";
        }
        MJClass.InsertIntoProjects(ProjectTable);
        Response.Redirect("~/Projects/Projects.aspx");
    }
}
