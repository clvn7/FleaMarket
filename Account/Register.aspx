<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" href="../Content/Register.css" type="text/css" media="all"/>
    <style type="text/css">
        #cuowu
        {
            height: 48px;
            width: 411px;
            margin-left: 251px;
        }
    </style>
</head>
<body>
<form id="Form1" runat="server" >

    <div id="out">
        <div id="center">
            <div id="top">
                <div id="link">
                    <a href="Default.aspx">首&nbsp;&nbsp;&nbsp;页</a>
                </div><%--返回首页--%>
                <div id ="cuowu">
                    <asp:Label ID="lbInfo" runat="server" Text=""></asp:Label>
                </div><%--错误提示--%>
            </div>
            <div id="regBox"><%--注册框--%>
                <div id="boxtop"></div>
                <div class="textinput">
                    <asp:TextBox  ID="txtUser"  runat="server" Height="25px" style="margin-left: 65px; margin-top: 30px;" Width="286px" BackColor="#ebebeb"></asp:TextBox><span id="t1"></span>
                </div><%--用户名--%>
                <div class="textinput">
                    <asp:TextBox ID="txtMail"   runat="server" Height="25px" style="margin-left: 65px; margin-top: 30px;" Width="286px" BackColor="#ebebeb"  ></asp:TextBox><asp:RegularExpressionValidator 
                ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail" 
                ErrorMessage="邮箱格式不正确" 
                ValidationExpression="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$"></asp:RegularExpressionValidator><span id="t2"></span>
                </div><%--邮箱--%>
                <div class="textinput">
                    <asp:TextBox ID="txtPwd"  runat="server" Height="25px" style="margin-left: 65px; margin-top: 30px;" Width="286px" BackColor="#ebebeb" TextMode="Password"></asp:TextBox>
<span id="t3"></span>
                </div><%--密码--%>
                <div class="textinput">
                    <asp:TextBox ID="txtPwdR" runat="server" Height="25px" style="margin-left: 65px; margin-top: 30px;" Width="286px" BackColor="#ebebeb" TextMode="Password"></asp:TextBox><span id="t4"></span>
                </div><%--重复密码--%>
                <div id="buttonlogin">
                    <asp:Button ID="Button1" runat="server" Text="注 册" Height="28px" Width="70px" style="margin-left: 293px" OnClick="Button1_Click1" />

                </div><%--按钮--%>
             </div>
        </div>
    </div>
</form>
</body>
</html>