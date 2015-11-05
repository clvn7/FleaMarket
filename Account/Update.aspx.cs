using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Account_Update : System.Web.UI.Page
{
    int goodsid;
    string sqlcom;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Request.QueryString["id"] == null)
            return;
    }
   
     protected void Button1_Click(object sender, EventArgs e)
    {
        goodsid = Convert.ToInt32(Request.QueryString["id"].ToString());
        DataAccess data = new DataAccess();
        data.Connection();
        string a = DropDownList1.SelectedItem.Text;
        string name = Session["Username"].ToString();
        string filepath = HttpContext.Current.Server.MapPath("~/Images/");
        string filefullname = filepath + FileUpload1.FileName;
        string filelujing = "\\Images\\" + FileUpload1.FileName;
        FileUpload1.SaveAs(filefullname);//获取图片物理地址D:\My Documents\Visual Studio 2013\WebSites\WebSite1\Images
        sqlcom = "update [Goods] set [goodsname]='" + gName.Text.Trim() + "',[images]='" + filelujing + "',[goodsprice]='" + gMoney.Text.Trim() + "',[goodssort]='" + a + "',[connectpeople]='" + cname.Text.Trim() + "',[phone]='" + phone.Text.Trim() + "',[Username]='" + name + "',[details]='" + details.Text.Trim() + "' where goodsid=" + goodsid;
        SqlCommand cmd = data.excute(sqlcom);
        Response.Redirect("person.aspx");
    }
}