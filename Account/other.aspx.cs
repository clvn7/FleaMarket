using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_other : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string sqlcom = "select goodsid,images,goodsname,goodsprice from [Goods] where goodssort='其它' order by goodsid desc ";
        DataFill data = new DataFill();
        data.DataPage(sqlcom, MarketDetailDl, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);
    }


}