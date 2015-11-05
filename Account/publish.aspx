<%@ Page Language="C#" AutoEventWireup="true" CodeFile="publish.aspx.cs" Inherits="Account_publish" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>发布商品</title>
        <link rel="stylesheet" href="../Content/publish.css" type="text/css" media="all"/>

</head>
<body>
    <form id="form2" runat="server">
    <div id="all">
        <div id="head" >
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="Black" NavigateUrl="~/Account/Default.aspx">首   页</asp:HyperLink>
        </div><%--返回首页--%>
        <div id="center">
            商品名称： <%--商品名称：--%>
            <asp:TextBox ID="gName" runat="server" Height="30px" Width="290px"></asp:TextBox><br /><br />
            照&nbsp;&nbsp;&nbsp;&nbsp;片：<%--图片上传--%>
            <asp:FileUpload ID="FileUpload1" runat="server" Height="30px" Width="290px"/><br /><br />
            售&nbsp;&nbsp;&nbsp;&nbsp;价（元）：<%--售价--%>
            <asp:TextBox ID="gMoney" runat="server" Height="30px" Width="290px"></asp:TextBox> <asp:RegularExpressionValidator id="RegularExpressionValidator4" runat="server" ErrorMessage="输入正确的价格" ControlToValidate="gMoney" ValidationExpression="^[0-9]{1,16}$"></asp:RegularExpressionValidator><br /><br />
            商品分类：<%--分类--%>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="43px" Width="142px">
                <asp:ListItem>书籍</asp:ListItem>
                <asp:ListItem>生活用品</asp:ListItem>
                <asp:ListItem>其它</asp:ListItem>
                <asp:ListItem>电子产品</asp:ListItem>
            </asp:DropDownList><br /><br />
            联系人：&nbsp;&nbsp;<%--联系人--%>
            <asp:TextBox ID="cname" runat="server" Height="30px" Width="130px" ></asp:TextBox><br /><br />
            联系电话： <%--联系电话--%>
            <asp:TextBox ID="phone" runat="server" Height="30px" Width="290px"></asp:TextBox><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ErrorMessage="输入正确的手机号码" ControlToValidate="phone" ValidationExpression="^\d{11}$"></asp:RegularExpressionValidator><br /><br />
            商品描述：&nbsp;&nbsp;<asp:TextBox ID="details" runat="server" Height="30px" Width="290px"></asp:TextBox><br /><br />
            <%--提交--%>
            <asp:Button ID="Button2" runat="server" Text="提  交" Height="35px" style="margin-left: 109px; margin-top: 32px" Width="239px" OnClick="Button1_Click" />

        </div>
    </div >
    </form>
</body>
</html>
