<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Account_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆</title>
    <link rel="stylesheet" href="../Content/Manage.css" type="text/css" media="all"/>

</head>
<body>
    <form id="Form1" runat="server">
        <div id="out">
            <div id="center">
                <div id="top">
                    <div id="link">
                        <a href="Default.aspx" >首&nbsp;&nbsp;&nbsp;页</a>
                    </div>
                </div><%--返回首页--%>
                <div id="loginBox">
                    <div id="textname">
                        <asp:TextBox ID="Adminname" runat="server" Height="38px" style="margin-left: 48px" Width="324px" BackColor="#ebebeb"></asp:TextBox>
                    </div><%--管理员名--%>
                    <div id="textpsw">
                        <asp:TextBox ID="Adminpwd" runat="server" Height="39px" style="margin-left: 48px; margin-top: 0px;" Width="324px" BackColor="#ebebeb" TextMode="Password"></asp:TextBox>
                    </div><%--管理员密码--%>
                    <div id ="foot">
                        <div id="buttonlogin">
                            <asp:Button ID="Button1" runat="server" Text="登 陆" Height="33px" Width="88px"  OnClick="Button1_Click" style="margin-left: 48px" />
                        </div><%--登陆按钮--%>
                        <br /><br /><br /><br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label><%--错误信息提示--%>
                    </div>
                 </div><%--登陆框--%>
            </div>
        </div>
        
        </form>
</body>
</html>