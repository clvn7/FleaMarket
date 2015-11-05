<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户登陆</title>
    <link rel="stylesheet" href="../Content/Site.css" type="text/css" media="all"/>

</head>
<body>
    <form id="Form1" runat="server">

    <div id="out">
        <div id="center">
            <div id="top">
                <div id="link">
                    <a href="Default.aspx">首&nbsp;&nbsp;&nbsp;页</a>
                </div>
            </div><%--返回首页--%>
            <div id="box">
                <div id="tishicuowu">
                    <br /><asp:Label ID="Label1" runat="server" Text=""  style="margin-left: 293px" Width="324px" Height="32px"></asp:Label>
                </div><%--错误提示--%>
                <div id="loginBox">
                <div id="textname">
                    <asp:TextBox ID="Username" runat="server" Height="38px" style="margin-left: 48px" Width="324px" BackColor="#ebebeb"></asp:TextBox>
                </div><%--用户名--%>
                <div id="textpsw">
                    <asp:TextBox ID="userpassword" runat="server" Height="38px" style="margin-left: 48px" Width="324px" BackColor="#ebebeb" TextMode="Password"></asp:TextBox>
                </div><%--密码--%>
                <div id ="foot">
                    <div id ="back">
                        <br /> <br /><br /> <br />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Register.aspx" ForeColor="#006699">返回注册</asp:HyperLink>
                    </div><%--返回注册--%>
                    <div id="buttonlogin">
                        <asp:ImageButton ID="Button1" runat="server" src="../Images/sure.jpg" Height="35px" Width="80px" style="margin-top: 10px;" OnClick="Button1_Click" float="left" />
                    </div><%--按钮--%>
                </div>
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>