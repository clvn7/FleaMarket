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
public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, System.EventArgs e)
    {
        if (txtUser.Text.Trim() == "" || txtPwd.Text.Trim() == "")
        {
            lbInfo.Text = "请你务必填写必要的项!";
        }
        else if (txtPwd.Text.Trim() != txtPwdR.Text.Trim())
            lbInfo.Text = "两次密码不一致,请核实!";
        else
        {
            DataAccess data = new DataAccess();
            data.Connection();
            String str1 = "SELECT * FROM [User] where Username='" + txtUser.Text.Trim() + "'";
            SqlCommand comm = data.excute(str1);
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(comm);
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbInfo.Text = "你注册的用户名已经被别人注册,请改其它的名字注册";
            }
            else
            {

                try
                {
                    String str = "INSERT INTO [User] (Username,Uemail,Upassword) VALUES ('" + txtUser.Text.Trim() + "','" + txtMail.Text.Trim() + "','" + txtPwd.Text.Trim() + "')";
                    SqlCommand com = data.excute(str);
                }
                catch (Exception eb)
                {
                    eb.Message.Clone();
                }
                Response.Redirect("Default.aspx");

            }
        }
    }
    
}