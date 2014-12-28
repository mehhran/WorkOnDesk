using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using farhaniPersianDate;
using System.Data.Sql;
using System.Data.SqlClient;


/// <summary>
/// Summary description for MJClass
/// </summary>
public class MJClass
{
    /// <summary>
    /// متدی برای تبدیل تاریخ میلادی به شمسی با ورودی تاریخ وخروجی رشته 
    /// </summary>
    /// <param name="date"></param>
    /// <param name="shortdate"></param>
    /// <returns></returns>
    public static string GetFarsiDate(DateTime date, Boolean shortdate)
    {
        if (shortdate == true)
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "YY;/;mm;/;dd";
            return Farsi.fulDate(Farsi.getPersianDate(date));
        }
        else
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "dn;dd;MM;سال;yy";
            return Farsi.getPersianDate(date);
        }
    }
    /// <summary>
    /// بررسی پسوند فایلهای در حال آپلود برای مجاز بودن آنها
    /// </summary>
    /// <param name="FileName"></param>
    /// <returns></returns>
    public static bool IsValidFileType(string FileName)
    {
        string AcceptedFileType = "zip";
        string ext = FileName.Substring(FileName.LastIndexOf(".") + 1, FileName.Length - FileName.LastIndexOf(".") - 1);
        if (ext == AcceptedFileType)
        {
            return true;
        }
        return false;
    }
    /// <summary>
    /// متدی برای برگرداندن جدول درخواست ها سورت شده بر اساس شماره پروژه
    /// </summary>
    public static List<Projects_Project> GetProjectsTable()
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Project>()
                orderby e.ProjectId descending
                select e).ToList<Projects_Project>();
    }
    /// <summary>
    /// متدی برای برگرداندن جدول درخواست های کاربر با ورودی نام کاربری
    /// </summary>
    /// <param name="ClientId"></param>
    /// <returns></returns>
    public static List<Projects_Project> GetProjectsTableByClientId(string ClientId)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Project>()
                where (e.ClientUName == ClientId)
                orderby e.ProjectId descending
                select e).ToList<Projects_Project>();
    }
    /// <summary>
    /// متدی برای برگرداندن جدول درخواست با گرفتن کد آن
    /// </summary>
    /// <param name="pid"></param>
    /// <returns></returns>
    public static Projects_Project GetProjectTableById(string pid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Project>()
                where (e.ProjectId == Convert.ToInt32(pid))
                select e).Single();
    }
    /// <summary>
    /// متدی برای برگرداندن درخواست با گرفتن کد آن
    /// </summary>
    /// <param name="PId"></param>
    /// <param name="m"></param>
    /// <returns></returns>
    public static List<Projects_Project> GetProjectTableById(string PId, bool m)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Project>()
                where (e.ProjectId == Convert.ToInt32(PId))
                select e).ToList<Projects_Project>();
    }
    /// <summary>
    /// متدی برای برگرداندن پیام‌های یک پیشنهاد با گرفتن کد پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static List<Projects_Message> GetMessageTableByBidId(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Message>()
                where (e.BidId == Bid)
                select e).ToList<Projects_Message>();
    }
    /// <summary>
    /// متدی برای اضافه کردن رکورد به درخواست‌ها
    /// </summary>
    /// <param name="prtbl"></param>
    public static void InsertIntoProjects(Projects_Project prtbl)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        db.Projects_Projects.InsertOnSubmit(prtbl);
        db.SubmitChanges();
    }
    /// <summary>
    /// متدی برای دادن مقادیر جدید به یک رکورد از جدول درخواست‌ها
    /// </summary>
    /// <param name="prtbl"></param>
    /// <param name="edit"></param>
    /// <param name="pid"></param>
    public static void InsertIntoProjects(Projects_Project prtbl, bool edit, string pid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        var ProjectTable = (from e in db.Projects_Projects
                            where (e.ProjectId == Convert.ToInt32(pid))
                            select e).First();
        ProjectTable.Title = prtbl.Title;
        ProjectTable.Type = prtbl.Type;
        ProjectTable.ExpDate = prtbl.ExpDate;
        ProjectTable.Description = prtbl.Description;
        ProjectTable.Delivarables = prtbl.Delivarables;
        ProjectTable.Platform = prtbl.Platform;
        ProjectTable.FileName = prtbl.FileName;
        ProjectTable.MaxBid = prtbl.MaxBid;
        db.SubmitChanges();
    }
    /// <summary>
    /// متدی برای وارد کردن رکورد جدید در جدول پیشنهاد‌ها
    /// </summary>
    /// <param name="pbid"></param>
    public static void InsertIntoBids(Projects_Bid pbid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        db.Projects_Bids.InsertOnSubmit(pbid);
        db.SubmitChanges();
    }
    /// <summary>
    /// متدی برای وارد کردن رکورد جدید در جدول پیام‌ها
    /// </summary>
    /// <param name="bidmsg"></param>
    public static void InsertIntoMessages(Projects_Message bidmsg)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        db.Projects_Messages.InsertOnSubmit(bidmsg);
        db.SubmitChanges();
    }
    /// <summary>
    /// متدی برای برگرداندن جدول پیشنهادهای یک درخواست(پروژه) با گرفتن کد درخواست
    /// </summary>
    /// <param name="prid"></param>
    /// <returns></returns>
    public static List<Projects_Bid> GetBidsByProjectId(string prid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Bid>()
                where (e.ProjectId == prid)
                select e).ToList<Projects_Bid>();
    }
    /// <summary>
    /// متدی برای برگرداندن نام کاربری که درخواست داده با گرفتن شماره درخواست
    /// </summary>
    /// <param name="prid"></param>
    /// <returns></returns>
    public static string GetUserIdByProjectId(string prid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Project>()
                where (e.ProjectId == Convert.ToInt32(prid))
                select e.ClientUName).Single();
    }
    /// <summary>
    /// متدی برای برگرداندن پیشنهادهایی که کاربر داده با گرفتن نام کاربر
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    public static List<Projects_Bid> GetBidsByUserId(string userid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Projects_Bid>()
                where (e.SupplierId == userid)
                select e).ToList<Projects_Bid>();
    }
    /// <summary>
    /// متدی برای برگرداندن واریزهای کاربر با گرفتن نام کاربر
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    public static List<Bids_Settle> GetUserSettlesByUserId(string userid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        return (from e in db.GetTable<Bids_Settle>()
                where (e.UserName == userid)
                orderby e.SettleId descending   
                select e).ToList<Bids_Settle>();
    }
    /// <summary>
    /// متدی برای برگرداندن مبلغ پیشنهاد با گرفتن شماره آن
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static string GetBidAmount(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt32(Bid));
        string Amount = pbid.Price;
        return Amount;
    }
    /// <summary>
    /// برای مشخص شدن وضعیت تایید پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static bool IsBidAccepted(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt64(Bid));
        return pbid.Accepted;
    }
    /// <summary>
    /// برای تایید پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    public static void SetAcceptedTrue(string Bid, Bids_Settle bs)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt32(Bid));
        pbid.Accepted = true;
        db.Bids_Settles.InsertOnSubmit(bs);
        db.SubmitChanges();
    }
    /// <summary>
    /// برای مشخص شدن وضعیت رضایت خریدار از مجری
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static bool IsClientSatisfied(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt64(Bid));
        return pbid.Satisfied;
    }
    /// <summary>
    /// اعلام رضایت خریدار 
    /// </summary>
    /// <param name="Bid"></param>
    public static void SetSatisfiedTrue(string Bid, Bids_Settle bs1, Bids_Settle bs2)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt32(Bid));
        pbid.Satisfied = true;
        //اضافه کردن مبلغ به حساب مجری
        db.Bids_Settles.InsertOnSubmit(bs1);
        //کم کردن مبلغ از حساب خریدار
        db.Bids_Settles.InsertOnSubmit(bs2);
        db.SubmitChanges();
    }
    /// <summary>
    /// متدی برای برگرداندن نام کاریری که پروژه را ارسال کرده با ورودی شماره پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static string GetClientId(string Bid)
    {
        string connectionString = MJConnectionString.ConnectionString;
        SqlConnection conObj = new SqlConnection(connectionString);
        string commandText = "SELECT Projects_Project.ClientUName FROM Projects_Project INNER JOIN Projects_Bid ON Projects_Project.ProjectId=Projects_Bid.ProjectId WHERE Projects_Bid.BidId=" + Bid;
        SqlCommand cmdObj = new SqlCommand(commandText, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        dr.Read();
        string ClientId = dr["ClientUName"].ToString();
        conObj.Close();
        return ClientId;
    }
    /// <summary>
    /// متدی برای برگرداندن نام کاریری که پیشنهاد داده با ورودی شماره پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static string GetSupplierId(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt64(Bid));
        string SupplierId = pbid.SupplierId;
        return SupplierId;
    }
    /// <summary>
    /// متذی برای برگرداندن عنوان درخواست با گرفتن شماره پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static string GetProjectTitle(string Bid)
    {
        string connectionString = MJConnectionString.ConnectionString;
        SqlConnection conObj = new SqlConnection(connectionString);
        string commandText = "SELECT Projects_Project.Title FROM Projects_Bid INNER JOIN Projects_Project ON Projects_Bid.ProjectId=Projects_Project.ProjectId WHERE Projects_Bid.BidId=" + Bid;
        SqlCommand cmdObj = new SqlCommand(commandText, conObj);
        conObj.Open();
        SqlDataReader dr = cmdObj.ExecuteReader();
        dr.Read();
        string Title = dr["Title"].ToString();
        conObj.Close();
        return Title;
    }
    /// <summary>
    /// متذی برای برگرداندن شماره درخواست با گرفتن شماره پیشنهاد
    /// </summary>
    /// <param name="Bid"></param>
    /// <returns></returns>
    public static string GetProjectId(string Bid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        Projects_Bid pbid = db.Projects_Bids.Single(b => b.BidId == Convert.ToInt64(Bid));
        string ProjectId = pbid.ProjectId;
        return ProjectId;
    }
    /// <summary>
    /// متدی برای برگرداندن مجموع تمام تراکنش‌های کاربر با گرفتن نام کاربر
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    public static int GetUserAccountBalance(string userid)
    {
        MJLINQ2SQLDataContext db = new MJLINQ2SQLDataContext();
        System.Nullable<Decimal> p = (from e in db.GetTable<Bids_Settle>()
                                      where (e.UserName == userid)
                                      select e.Amount).Sum();
        int q = Convert.ToInt32(p);
        return q;
    }
}
