using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class MJConnectionString
{
    /// <summary>
    /// برگرداندن رشته کانکشن استرینگ سایت
    /// </summary>
    public static string ConnectionString
    {
        get { return ConfigurationManager.ConnectionStrings["ASPNETDBConnectionString"].ConnectionString; }
    }
}
