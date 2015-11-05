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

public partial class Account_electric : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {string sqlcom="select goodsid,images,goodsname,goodsprice from [Goods] where goodssort='电子产品' order by goodsid desc ";
        DataFill data = new DataFill();
        data.DataPage(sqlcom, MarketDetailDl, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);
    }
  

}