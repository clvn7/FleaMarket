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

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        DataAccess data = new DataAccess();
        data.Connection();
        string sqlcom = "select * from [User] where Username='" + Username.Text.Trim() + "'and Upassword='" + userpassword.Text.Trim() + "'";
        SqlCommand cmd = data.excute(sqlcom);
        DataSet ds = data.Fill(cmd);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["Username"] = Username.Text.Trim();
            Response.Redirect("person.aspx");
        }
        else
        {
            Label1.Text = "您的用户名或密码错误";
            Username.Text = "";
        }

    }
    protected void userpassword_TextChanged(object sender, EventArgs e)
    {

    }
}