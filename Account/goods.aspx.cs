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

public partial class Account_goods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            Response.Redirect("Default.aspx");
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        DataAccess data = new DataAccess();
        data.Connection();
        string sqlcom = "SELECT goodsname,goodsprice,phone,images,details FROM [Goods] where goodsid=" + id;
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        gName.Text = ds.Tables[0].Rows[0][0].ToString();
        money.Text = ds.Tables[0].Rows[0][1].ToString();
        tel.Text = ds.Tables[0].Rows[0][2].ToString();
        Image1.ImageUrl = ds.Tables[0].Rows[0][3].ToString();
        Mes.Text = ds.Tables[0].Rows[0][4].ToString();
        string sqlcom1 = "select mescontent, Username, mestime  from [message] where goodsid=" + id;
        DataFill ds1 = new DataFill();
        ds1.DataPage(sqlcom1, DataList1, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
        {
            Response.Write("<script language='javascript'>alert('没有登录不能评论')</script>");
            return;
        }
        string time = DateTime.Now.ToLongDateString();
        DataAccess data = new DataAccess();
        data.Connection();
        string Username = Session["Username"].ToString();
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        string sqlcom = "insert into [message] (mescontent,Username,goodsid,mestime) values ('" + Message.Text.Trim() + "','" + Username + "','" + id + "','" + time + "')";
        SqlCommand cmd = data.excute(sqlcom);
        Message.Text = "";
        load();

    }
    public void load()
    {
        DataAccess data = new DataAccess();
        data.Connection();
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        string sqlcom = "select mescontent, Username, mestime from [message] where goodsid=" + id;
        DataFill ds = new DataFill();
        ds.DataPage(sqlcom, DataList1, lblCurPage, lblTnum, lblEachPage, lnkFirst, lnkLast, lnkPrev, lnkNext, Request);
    }
}