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

/// <summary>
/// DataFill 的摘要说明
/// </summary>
public class DataFill
{
    public static int TotalPage;//定义变量来保存总页数
    public int CurPage;//定义变量来保存当前页索引
    public int Tnum;//总条数;
    public int EachPage;//每页总条数
	public DataFill()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public void DataPage(string sqlcom, DataList MarketDetailDl, Label lblCurPage, Label lblTnum, Label lblEachPage, HyperLink lnkFirst, HyperLink lnkLast, HyperLink lnkPrev, HyperLink lnkNext, HttpRequest Request)
    {
        DataAccess data = new DataAccess();
        data.Connection();
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        MarketDetailDl.DataSource = ds.Tables[0].DefaultView;
        MarketDetailDl.DataBind();
        PagedDataSource objPage = new PagedDataSource();//创建分页类
        objPage.DataSource = ds.Tables["Table"].DefaultView;//设置数据源

        objPage.AllowPaging = true;
        objPage.PageSize = 5;

        if (Request.QueryString["Page"] != null)
        {
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
            CurPage = Math.Min(CurPage, objPage.PageCount);
            CurPage = Math.Max(CurPage, 1);
        }
        else
            CurPage = 1;
        objPage.CurrentPageIndex = CurPage - 1;
        TotalPage = objPage.PageCount;
        Tnum = objPage.DataSourceCount;
        EachPage = objPage.Count;
        lblCurPage.Text = "第 " + CurPage.ToString() + " / " + TotalPage.ToString() + " 页";
        lblTnum.Text = "共: " + Tnum + " 条记录";
        lblEachPage.Text = "每页有: " + EachPage.ToString() + " 条记录";

        if (objPage.CurrentPageIndex != 0)
            lnkFirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage-CurPage +1);
        if (objPage.CurrentPageIndex != TotalPage - 1)
            lnkLast.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(TotalPage);

        if (!objPage.IsFirstPage)
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1);
        if (!objPage.IsLastPage)
            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1);

        MarketDetailDl.DataSource = objPage;
        MarketDetailDl.DataBind();
    }
}