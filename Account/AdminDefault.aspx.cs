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

public partial class Account_AdminDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Adminid"] == null)
            {
                Response.Redirect("Admin.aspx");
            }
            load();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int num = e.RowIndex;
        DataAccess data = new DataAccess();
        data.Connection();
        DataTable dt=new DataTable();
        string godid = GridView1.Rows[num].Cells[0].Text.ToString();
        string sqlcom = "delete from [Goods] where goodsid='" + godid + "'";
        SqlCommand cmd = data.excute(sqlcom);
        Response.Write("<script language='javascript'>alert('删除成功!')</script>");
        load();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DataAccess data = new DataAccess();
        data.Connection();
        string sqlcom = "select goodsid,goodsname,goodsprice,goodssort,connectpeople,phone from [Goods] ";
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    public void load()
    {
        DataAccess data = new DataAccess();
        data.Connection();
        string sqlcom = "select goodsid,goodsname,goodsprice,goodssort,connectpeople,phone from [Goods] ";
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        GridView1.DataSource = ds.Tables[0].DefaultView;
        GridView1.DataBind();
    }
   
}