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

public partial class Account_life : System.Web.UI.Page
{
    public static int TotalPage;//定义变量来保存总页数
    public int CurPage;//定义变量来保存当前页索引
    public int Tnum;//总条数;
    public int EachPage;//每页总条数
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcom = "select goodsid,images,goodsname,goodsprice from [Goods] where goodssort='生活用品' order by goodsid desc ";
        DataFill data = new DataFill();//创建分页填充类对象;
        data.DataPage(sqlcom, MarketDetailDl, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);//调用分页方法;
    }

}