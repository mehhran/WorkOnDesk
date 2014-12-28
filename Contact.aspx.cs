using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmittButton_Click(object sender, EventArgs e)
    {
        string username;
        if (User.Identity.IsAuthenticated)
        {
            username = User.Identity.Name;
        }
        else
        {
            username = "Anonymous";
        }
        Contact_Admin contact = new Contact_Admin();
        contact.FullName = NameTextBox.Text;
        contact.Email = EmailTextBox.Text;
        contact.Message = MessageTextBox.Text;
        contact.PhoneNumber = TellNoTextBox.Text;
        contact.UserName = username;
        contact.Date = MJClass.GetFarsiDate(DateTime.Now, false);
        contact.Time = DateTime.Now.ToLongTimeString();
    }
}