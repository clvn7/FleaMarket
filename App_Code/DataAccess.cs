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

/// <summary>
/// DataAccess 的摘要说明
/// </summary>
public class DataAccess
{
    SqlConnection con;
    public DataAccess()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public void Connection()//数据库链接方法;
    {
        String sqlstring = "server='.';database='dbFM';Integrated Security=True";
        con = new SqlConnection(sqlstring);
        con.Open();
    }
    public SqlCommand excute(String sqlcom)//执行sql语句方法;
    {
        SqlCommand cmd = new SqlCommand(sqlcom, con);
        cmd.CommandText = sqlcom;
        cmd.ExecuteNonQuery();
        return cmd;
    }
    public void close()//关闭数据库连接;
    {
        con.Close();
    }
    public DataSet Fill(SqlCommand cmd)//数据进行填充方法;
    {
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(ds);
        return ds;
    }

}