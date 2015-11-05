using System;
using System.Collections.Generic;
using System.Linq;
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

public partial class Account_person : System.Web.UI.Page
{
    public static int TotalPage;//定义变量来保存总页数
    public int CurPage;//定义变量来保存当前页索引
    public int Tnum;//总条数;
    public int EachPage;//每页总条数
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        string sqlcom = "select goodsid,images,goodsname,goodsprice,connectpeople,phone ,datetime from [Goods] where Username='" + Session["Username"].ToString() + "' order by goodsid desc ";
        DataFill data = new DataFill();
        data.DataPage(sqlcom, MarketDetailDl, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);
        userName.Text = Session["Username"].ToString();
    }
    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("publish.aspx");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.Item.ItemIndex != -1 && e.CommandName == "DRdel")//判断索引和CommandName
        {
            int godid = Convert.ToInt32(MarketDetailDl.DataKeys[e.Item.ItemIndex].ToString());
            DataAccess data = new DataAccess();
            data.Connection();
            string sqlcom = "delete from [Goods] where goodsid='" + godid + "'";
            SqlCommand cmd = data.excute(sqlcom);
            Response.Write("<script language='javascript'>alert('删除成功!')</script>");
            load();
        }
        if (e.Item.ItemIndex != -1 && e.CommandName == "DRdel1")//判断索引和CommandName
        {
            int godid = Convert.ToInt32(MarketDetailDl.DataKeys[e.Item.ItemIndex].ToString());
            Response.Redirect("Update.aspx?id=" + godid + "");
        }
    }
    public void load()
    {
        DataAccess data = new DataAccess();
        data.Connection();
        string sqlcom = "select goodsid,images,goodsname,goodsprice,goodssort,connectpeople,phone,datetime from [Goods] ";
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        MarketDetailDl.DataSource = ds.Tables[0].DefaultView;
        MarketDetailDl.DataBind();
    }

}