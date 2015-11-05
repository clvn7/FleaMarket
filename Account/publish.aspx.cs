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

public partial class Account_publish : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string time = DateTime.Now.ToLongDateString();
        DataAccess data = new DataAccess();
        data.Connection();
        string a = DropDownList1.SelectedItem.Text;
        string name = Session["Username"].ToString();
        string filepath = HttpContext.Current.Server.MapPath("~/Images/");
        string filefullname = filepath + FileUpload1.FileName;
        string filelujing = "\\Images\\" + FileUpload1.FileName;
        FileUpload1.SaveAs(filefullname);//获取图片物理地址D:\My Documents\Visual Studio 2013\WebSites\WebSite1\Images
        if (gName.Text.Trim() == "" || cname.Text.Trim() == "")
        {
            Response.Write("<script language='javascript'>alert('商品名称或联系人不能为空')</script>");
            return;
        }
        String str = "INSERT INTO [Goods] (goodsname,images,goodsprice,goodssort,connectpeople,phone,Username,details,datetime) VALUES ('" + gName.Text.Trim() + "','" + filelujing + "','" + gMoney.Text.Trim() + "','" + a + "','" + cname.Text.Trim() + "','" + phone.Text.Trim() + "','" + name + "','" + details.Text.Trim() + "','" + time + "')";
        SqlCommand cmd = data.excute(str);
        Response.Redirect("person.aspx");



    }

}