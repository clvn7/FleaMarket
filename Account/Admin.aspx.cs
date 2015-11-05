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

public partial class Account_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public static string FunStr(string str)//过滤输入非法字符;
    {
        str = str.Replace("&", "&amp;");
        str = str.Replace("<", "&lt;");
        str = str.Replace(">", "&gt");
        str = str.Replace("'", "''");
        str = str.Replace("*", "");
        str = str.Replace("\n", "<br/>");
        str = str.Replace("\r\n", "<br/>");
        //str   =   str.Replace("?","");   
        str = str.Replace("select", "");
        str = str.Replace("insert", "");
        str = str.Replace("update", "");
        str = str.Replace("delete", "");
        str = str.Replace("create", "");
        str = str.Replace("drop", "");
        str = str.Replace("delcare", "");
        str = str.Replace("   ", "&nbsp;");

        str = str.Trim();
        if (str.Trim().ToString() == "")
            str = "无";
        return str;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataAccess data = new DataAccess();
        string sqlcom = "select * from [Admin] where Adminid='" + FunStr(Adminname.Text.Trim()) + "'and Apassword='" + FunStr(Adminpwd.Text.Trim()) + "'";
        data.Connection();
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Adminid"] = Adminname.Text.Trim();
            Response.Redirect("AdminDefault.aspx");
        }
        else
        {
            Label1.Text = "您的用户名或密码错误";
            Adminname.Text = "";
        }
    }
}