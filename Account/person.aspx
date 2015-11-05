<%@ Page Language="C#" AutoEventWireup="true" CodeFile="person.aspx.cs" Inherits="Account_person" enableEventValidation="true" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人中心</title>
    <link rel="stylesheet" href="../Content/person.css" type="text/css" media="all"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id ="all">
        <div id="left">
            <div id="person" style="font-family:微软雅黑"><br /><br /><br /><br />    
                用户名：<br /> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="userName" runat="server" Text=""></asp:Label>     <%--显示用户名--%>
                <br /><br /><br />
                <asp:ImageButton ID="Button1" runat="server" OnClick="Button1_Click"  src="../Images/fabu.jpg" style="margin-left: 32px" Width="92px"/>
                <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Default.aspx" style="color:#fff;">返回首页</a>
            </div>
        </div>
        <div id="right">
            <asp:DataList ID="MarketDetailDl" runat="server" RepeatColumns ="1" ShowHeader="false" DataKeyField="goodsid"  OnItemCommand="DataList1_ItemCommand" >
            <ItemStyle/>
            <ItemTemplate>
                <div id="right-mess" style="font-family:微软雅黑">&nbsp; 
                商品编号:<asp:Label ID="Label1" runat="server" Text='<%# DataBinder .Eval (Container.DataItem ,"goodsid") %>'></asp:Label><br />&nbsp;
                商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %><br />&nbsp;
                价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %><br />&nbsp;
                姓名:<%# DataBinder .Eval (Container.DataItem ,"connectpeople") %><br />&nbsp;
                联系电话:<%# DataBinder .Eval (Container.DataItem ,"phone") %><br />&nbsp;
                发布时间：<%# DataBinder .Eval (Container.DataItem ,"datetime") %><br />&nbsp;<br />&nbsp;
                    <asp:LinkButton ID="LinkButton1" commandname = "DRdel" runat="server">删除</asp:LinkButton>
                   <asp:LinkButton ID="LinkButton2" commandname = "DRdel1" runat="server">修改</asp:LinkButton>
                </div> 
                <div id="right-picture">
                    <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString () %>"><asp:Image ID="Image1" runat="server" ImageAlign="Right" width="300px" height="200px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                </div>
            </ItemTemplate>
            </asp:DataList>
            <div>
                <table id="page" width="100%">
                    <tr align="center">
					    <td>
						   <asp:label id="lblCurPage" Runat="server"></asp:label>&nbsp;&nbsp;&nbsp;
						    <asp:Label id="lblEachPage" Runat="server"></asp:Label>
						    <asp:Label id="lblTnum" Runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
						    <asp:hyperlink id="lnkFirst" Runat="server">&nbsp;第一页&nbsp;</asp:hyperlink>
						    <asp:hyperlink id="lnkPrev" Runat="server">&nbsp;上一页&nbsp;</asp:hyperlink>
						    <asp:hyperlink id="lnkNext" Runat="server">&nbsp;下一页&nbsp;</asp:hyperlink>
						    <asp:hyperlink id="lnkLast" Runat="server">&nbsp;最后页&nbsp;&nbsp;&nbsp;</asp:hyperlink>
						    到:<asp:TextBox id="txtPage" Runat="server" Width="32px"></asp:TextBox>
						    页<asp:Button id="btnPage" Runat="server" Width="32px" Text="Go"></asp:Button>
					    </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
