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

public partial class Account_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String[] str = new String[] { "str1", "str2", "str3", "str4" };
        DataList[] list = new DataList[] { DataEle, DataBook, DataLife, DataOther };//创建datalist控件数组
        DataAccess data = new DataAccess();
        data.Connection();//链接数据库
        str[0] = "SELECT  goodsid,goodsname,goodsprice,images FROM [Goods] where goodssort='电子产品' order by goodsid desc";
        str[1] = "SELECT  goodsid,goodsname,goodsprice,images FROM [Goods] where goodssort='书籍' order by goodsid desc";
        str[2] = "SELECT  goodsid,goodsname,goodsprice,images FROM [Goods] where goodssort='生活用品' order by goodsid desc";
        str[3] = "SELECT  goodsid,goodsname,goodsprice,images FROM [Goods] where goodssort='其它' order by goodsid desc";
        for (int i = 0; i < 4; i++)
        {
            SqlCommand cmd = data.excute(str[i]);//执行sql语句;
            DataSet ds = data.Fill(cmd);
            list[i].DataSource = ds.Tables[0].DefaultView;
            list[i].DataBind();//数据绑定显示;
        }
    }
}