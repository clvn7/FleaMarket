<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="Account_book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>书籍</title>
    <link rel="stylesheet" href="../Content/book.css" type="text/css" media="all"/>

</head>
<body>
    <form id="form1" runat="server">
    <div id="all">
        <div id="head" >
             <img src="../Images/head.png" usemap="#planetmap"/>
             <map name="planetmap" id="planetmap">
                <area shape="rect" coords="60, 60, 180, 100" href="Default.aspx"  alt=""/>
                <area shape="rect" coords="180, 60, 300, 100" href="person.aspx"   alt=""/>
                <area shape="rect" coords="690, 60, 810, 100" href="Login.aspx"   alt=""/>
                <area shape="rect" coords="810, 60, 930, 100" href="Register.aspx"  alt=""/>
            </map>
        </div><%--导航--%>
        <div id ="center">
            <div id ="show">
                <asp:DataList ID="MarketDetailDl" runat="server" RepeatColumns ="3" ShowHeader="false" >
                <ItemStyle/>
                <ItemTemplate>
                    <div class="showout" onmouseover="this.className='showover'"onmouseout="this.className='showout'">
                            <div class="picture">
                                <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString () %>"><asp:Image ID="Image1" runat="server" ImageAlign="Top" width="274px" height="207px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                            </div><%--照片--%>
                            <div class="mess" style="font-family:微软雅黑">
                                <br />&nbsp;商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %>
                                <br />&nbsp;价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %></div> <%--信息--%>
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
                    </div><%--下一页按钮--%>
                    <div id="foot" style="text-align:center;">
                        <br /><br />
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Admin.aspx">管理员请登陆</asp:HyperLink>
                        <pre>校园二手交易平台        版权所有 B组</pre>
                    </div><%--脚部--%>
            </div>
        </div>
    </div>
    </form>
</body>
</html>