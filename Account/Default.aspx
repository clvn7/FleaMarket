<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Account_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>二手交易网站</title>
    <script src="../Scripts/jquery-ui-1.8.24.min.js" type="text/javascript">

    </script>
    <link rel="stylesheet" href="../Content/index.css" type="text/css" media="all"/>

</head>
<body>
    <form id="form1" runat="server">
        <div id="xixi" onmouseover="toBig()" onmouseout="toSmall()">
            <table style="FLOAT: left" border="0" cellspacing="0" cellpadding="0" width="157">
                <tr>
                    <td class="main_head" height="39" vAlign="top"></td>

                </tr>
                <tr>
                    <td class="info" vAlign="top">
                        <table class="qqtable" border="0" cellspacing="0" cellpadding="0" width="120" align="center">
                            <tr>
                                <td align="middle"><a title="点击添加到收藏夹" href="javascript:window.external.AddFavorite(document.location.href,document.title)"><img src="../Images/cang.png" alt="添加到收藏夹" border="0" height="16" width="16">添加收藏夹</a><br><a title="点击复制本贴地址" style="cursor:hand" onclick="copyToClipBoard()"><img src="http://www.zzsky.cn/effect/images/201002281045/copy.png" alt="点击复制本站给好友" border="0" height="16" width="16">复制给好友</a>
                                    <script language="javascript">
                                        function copyToClipBoard() {
                                            var clipBoardContent = this.document.title;
                                            clipBoardContent += this.location.href;
                                            window.clipboardData.setData("Text", clipBoardContent);
                                            alert("复制成功，请通过QQ/MSN推荐给你的好友");
                                        }
                                    </script>
                                </td>
                            </tr>
                            <tr>
                              <td height="5"></td>
                            </tr>
                            <tr>
                              <td height="30" align="middle"><span><a href="javascript:u=location.href;t=document.title;c=%22%22+(window.getSelection?window.getSelection():document.getSelection?document.getSelection():document.selection.createRange().text);var url=%22http://cang.baidu.com/do/add?it=%22+encodeURIComponent(t)+%22&iu=%22+encodeURIComponent(u)+%22&dc=%22+encodeURIComponent(c)+%22&fr=ien#nw=1%22;window.open(url,%22_blank%22,%22scrollbars=no,width=600,height=450,left=75,top=20,status=no,resizable=yes%22);void 0" title="分享到百度Baidu搜藏"><img src="../Images/baidu.gif" alt="分享到百度Baidu搜藏" border="0" height="16" width="16">分享到百度</span></a></td>
                            </tr>
                            <tr>
                              <td height="30" align="middle"><span><a title="分享到QQ书签" style="font-size:14px;" href="javascript:window.open('http://shuqian.qq.com/post?title='+encodeURIComponent(document.title)+'&uri='+encodeURIComponent(document.location.href)+'&jumpback=2&noui=1','favit','width=960,height=600,left=50,top=50,toolbar=no,menubar=no,location=no,scrollbars=yes,status=yes,resizable=yes');void(0)"><img src="../Images/qq.png" alt="分享到QQ书签" border="0" height="16" width="16">分享QQ书签</a></span></td>
                            </tr>
                            <tr>
                            <tr>
                              <td height="30" align="middle"><span><a href="javascript:window.open('http://v.t.sina.com.cn/share/share.php?title='+encodeURIComponent(document.title)+'&url='+encodeURIComponent(location.href)+'&source=bookmark','_blank','width=450,height=400');void(0)" title="分享到新浪微博"><img src="../Images/sina.gif" alt="分享到新浪微博" border="0" height="16" width="16">分享新浪微博</a></span></td>
                            </tr>
                            <tr>
                              <td height="30" align="middle"><span><a title="转贴到校内人人网" href="javascript:void((function(s,d,e){if(/renren\.com/.test(d.location))return;var%20f='http://share.renren.com/share/buttonshare.do?link=',u=d.location,l=d.title,p=[e(u),'&title=',e(l)].join('');function%20a(){if(!window.open([f,p].join(''),'xnshare',['toolbar=0,status=0,resizable=1,width=626,height=436,left=',(s.width-626)/2,',top=',(s.height-436)/2].join('')))u.href=[f,p].join('');};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();})(screen,document,encodeURIComponent));">
                              <img src="../Images/renren.png" alt="分享到校内人人网" border="0" height="16" width="16">分享到校内网</a></span></td>
                            </tr>
        
                            <tr>
                              <td align="middle">
                                <div class="qun"><font color="#9b9b9b">二手交易</font><br><span></span></div></td>
                            </tr>
                            <tr>
                              <td align="middle"></td>
                            </tr>
                          </table>
                    </td>
                </tr>
                <tr>
                    <td class="down_kefu" vAlign="top"></td>
                </tr>
            </table>
            <div class="Obtn">

            </div>
        </div>
<script language="javascript">
    客服 = function (id, _top, _left) {
        var me = id.charAt ? document.getElementById(id) : id, d1 = document.body, d2 = document.documentElement;
        d1.style.height = d2.style.height = '100%'; me.style.top = _top ? _top + 'px' : 0; me.style.left = _left + "px";//[(_left>0?'left':'left')]=_left?Math.abs(_left)+'px':0;
        me.style.position = 'absolute';
        setInterval(function () {
            me.style.top = parseInt(me.style.top) + (Math.max(d1.scrollTop, d2.scrollTop) + _top - parseInt(me.style.top)) * 0.1 + 'px';
        }, 10 + parseInt(Math.random() * 20));
        return arguments.callee;
    };
    window.onload = function () {
        客服
        ('xixi', 100, -152)
    }
</script>
<script language="javascript">
    lastScrollY = 0;
    var InterTime = 1;
    var maxWidth = -1;
    var minWidth = -152;
    var numInter = 8;
    var BigInter;
    var SmallInter;
    var o = document.getElementById("xixi");
    var i = parseInt(o.style.left);
    function Big() {
        if (parseInt(o.style.left) < maxWidth) {
            i = parseInt(o.style.left);
            i += numInter;
            o.style.left = i + "px";
            if (i == maxWidth)
                clearInterval(BigInter);
        }
    }
    function toBig() {
        clearInterval(SmallInter);
        clearInterval(BigInter);
        BigInter = setInterval(Big, InterTime);
    }
    function Small() {
        if (parseInt(o.style.left) > minWidth) {
            i = parseInt(o.style.left);
            i -= numInter;
            o.style.left = i + "px";
            if (i == minWidth)
                clearInterval(SmallInter);
        }
    }
    function toSmall() {
        clearInterval(SmallInter);
        clearInterval(BigInter);
        SmallInter = setInterval(Small, InterTime);
    }
</script>


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
        <div id="center">
            <div class ="goods">
                <div id="topicblue">
                    <img src="../Images/blue.jpg" usemap="#mapone"/>
                    <map name="mapone" id="mapone">
                        <area shape="rect" coords="60, 0, 460, 50" href="electric.aspx"  alt=""/>
                    </map>
                </div><%--分类图片连接--%>
                <div class="down"><%--更新展示--%>
                    <asp:DataList ID="DataEle" runat="server" RepeatColumns ="3" ShowHeader="false"  >
                        <ItemStyle/>
                        <ItemTemplate>
                            <div class="showout" onmouseover="this.className='showover'"onmouseout="this.className='showout'">
                                <div class="picture">
                                    <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString () %>"><asp:Image ID="Image1" runat="server" ImageAlign="Top" width="274px" height="207px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                                </div>
                                <div class="mess" style="font-family:微软雅黑">
                                    <br />&nbsp;商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %>
                                    <br />&nbsp;价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %><br />

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div><%--电子类--%>
            <div class ="goods">
                <div id="topicyellow">
                    <img src="../Images/yellow.jpg" usemap ="#maptwo"/>
                    <map name="maptwo" id="maptwo">
                        <area shape="rect" coords="60, 0, 410, 50" href="book.aspx"  alt=""/>
                    </map>
                </div><%--分类图片连接--%>
                <div class="down"><%--更新展示--%>
                    <asp:DataList ID="DataBook" runat="server" RepeatColumns ="3" ShowHeader="false" >
                        <ItemStyle/>
                        <ItemTemplate>
                            <div class="showout" onmouseover="this.className='showover'"onmouseout="this.className='showout'">
                                <div class="picture">
                                    <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString () %>"><asp:Image ID="Image1" runat="server" ImageAlign="Top" width="274px" height="207px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                                </div>
                                <div class="mess" style="font-family:微软雅黑">
                                    <br />&nbsp;商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %>
                                    <br />&nbsp;价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %><br />

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div><%--书籍类--%>
            <div class ="goods">
                <div id="topicpink">
                    <img src="../Images/pink.jpg" usemap ="#mapthree"/>
                    <map name="mapthree" id="mapthree">
                        <area shape="rect" coords="60, 0, 360, 50" href="life.aspx"  alt=""/>
                    </map>
                </div><%--分类图片连接--%>
                <div class="down"><%--更新展示--%>
                    <asp:DataList ID="DataLife" runat="server" RepeatColumns ="3" ShowHeader="false" >
                        <ItemStyle/>
                        <ItemTemplate>
                            <div class="showout" onmouseover="this.className='showover'"onmouseout="this.className='showout'">
                                <div class="picture">
                                    <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString() %>"><asp:Image ID="Image1" runat="server" ImageAlign="Top" width="274px" height="207px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                                </div>
                                <div class="mess" style="font-family:微软雅黑">
                                    <br />&nbsp;商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %>
                                    <br />&nbsp;价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %><br />

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div><%--生活用品--%>
            <div class ="goods">
                <div id="topicgreen">
                    <img src="../Images/green.jpg" usemap ="#mapfour"/>
                    <map name="mapfour" id="mapfour">
                        <area shape="rect" coords="60, 0, 310, 50" href="other.aspx"  alt=""/>
                    </map>
                </div><%--分类图片连接--%>
                <div class="down"><%--更新展示--%>
                    <asp:DataList ID="DataOther" runat="server" RepeatColumns ="3" ShowHeader="false" >
                        <ItemStyle/>
                        <ItemTemplate>
                            <div class="showout" onmouseover="this.className='showover'"onmouseout="this.className='showout'">
                                <div class="picture">
                                    <a href="goods.aspx?id=<%# DataBinder.Eval(Container.DataItem,"goodsid").ToString () %>"><asp:Image ID="Image1" runat="server" ImageAlign="Top" width="274px" height="207px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"images").ToString () %>' /></a>
                                </div>
                                <div class="mess" style="font-family:微软雅黑">
                                    <br />&nbsp;商品名称:<%# DataBinder .Eval (Container.DataItem ,"goodsname") %>
                                    <br />&nbsp;价格(元):<%# DataBinder .Eval (Container.DataItem ,"goodsprice") %><br />

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div><%--其他类--%>
        </div>
        <div id="foot" style="text-align:center;">
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Admin.aspx">管理员请登陆</asp:HyperLink>
            <br />
            <pre>校园二手交易平台        版权所有 B组</pre>
        </div><%--脚部--%>    </div>
    </form>
</body>
</html>




