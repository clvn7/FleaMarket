<%@ Page Language="C#" AutoEventWireup="true" CodeFile="goods.aspx.cs" Inherits="Account_goods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品</title>
    <link rel="stylesheet" href="../Content/goods.css" type="text/css" media="all"/>


</head>
<body>
    <form id="form1" runat="server">
        <div id="goods">
            <div id="head">
             <img src="../Images/head.png" usemap="#planetmap"/>
                 <map name="planetmap" id="planetmap">
                    <area shape="rect" coords="60, 60, 180, 100" href="Default.aspx"  alt=""/>
                    <area shape="rect" coords="180, 60, 300, 100" href="person.aspx"   alt=""/>
                    <area shape="rect" coords="690, 60, 810, 100" href="Login.aspx"   alt=""/>
                    <area shape="rect" coords="810, 60, 930, 100" href="Register.aspx"  alt=""/>
                </map>
            </div><%--头部--%>
            <div id="goodsmess">
                <div id="goodscenter">
                    <div id="picture">
                    <script type="text/javascript">
                        function getEventObject(W3CEvent) {//事件标准化函数 
                            return W3CEvent || window.event;
                        }
                        function getPointerPosition(e) {//兼容浏览器的鼠标x,y获得函数 
                            e = e || getEventObject(e);
                            var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
                            var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));

                            return { 'x': x, 'y': y };
                        }
                        function setOpacity(elem, level) {//兼容浏览器设置透明值 
                            if (elem.filters) {
                                elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
                            } else {
                                elem.style.opacity = level;
                            }
                        }
                        function css(elem, prop) {   //css设置函数,可以方便设置css值,并且兼容设置透明值 
                            for (var i in prop) {
                                if (i == 'opacity') {
                                    setOpacity(elem, prop[i]);
                                } else {
                                    elem.style[i] = prop[i];
                                }
                            }
                            return elem;
                        }
                        var magnifier = {
                            m: null,

                            init: function (magni) {
                                var m = this.m = magni || {
                                    cont: null,    //装载原始图像的div 
                                    img: null, //放大的图像 
                                    mag: null, //放大框 
                                    scale: 15  //比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决 
                                }

                                css(m.img, {
                                    'position': 'absolute',
                                    'width': (m.cont.clientWidth * m.scale) + 'px',                //原始图像的宽*比例值     
                                    'height': (m.cont.clientHeight * m.scale) + 'px'               //原始图像的高*比例值 
                                })

                                css(m.mag, {
                                    'display': 'none',
                                    'width': m.cont.clientWidth + 'px',    //m.cont为原始图像,与原始图像等宽 
                                    'height': m.cont.clientHeight + 'px',
                                    'position': 'absolute',
                                    'left': m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',//放大框的位置为原始图像的右方远10px 
                                    'top': m.cont.offsetTop + 'px'
                                })

                                var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;      //获取border的宽 

                                css(m.cont.getElementsByTagName('div')[0], {         //m.cont.getElementsByTagName('div')[0]为浏览框 
                                    'display': 'none',                             //开始设置为不可见 
                                    'width': m.cont.clientWidth / m.scale - borderWid + 'px',          //原始图片的宽/比例值 - border的宽度 
                                    'height': m.cont.clientHeight / m.scale - borderWid + 'px',//原始图片的高/比例值 - border的宽度 
                                    'opacity': 0.5//设置透明度 
                                })

                                m.img.src = m.cont.getElementsByTagName('img')[0].src;//让原始图像的src值给予放大图像 
                                m.cont.style.cursor = 'crosshair';

                                m.cont.onmouseover = magnifier.start;

                            },

                            start: function (e) {

                                if (document.all) {//只在IE下执行,主要避免IE6的select无法覆盖 
                                    magnifier.createIframe(magnifier.m.img);
                                }

                                this.onmousemove = magnifier.move;//this指向m.cont 
                                this.onmouseout = magnifier.end;
                            },

                            move: function (e) {
                                var pos = getPointerPosition(e);        //事件标准化 

                                this.getElementsByTagName('div')[0].style.display = '';

                                css(this.getElementsByTagName('div')[0], {
                                    'top': Math.min(Math.max(pos.y - this.offsetTop - parseInt(this.getElementsByTagName('div')[0].style.height) / 2, 0), this.clientHeight - this.getElementsByTagName('div')[0].offsetHeight) + 'px',
                                    'left': Math.min(Math.max(pos.x - this.offsetLeft - parseInt(this.getElementsByTagName('div')[0].style.width) / 2, 0), this.clientWidth - this.getElementsByTagName('div')[0].offsetWidth) + 'px'            //left=鼠标x - this.offsetLeft - 浏览框宽/2,Math.max和Math.min让浏览框不会超出图像 
                                })

                                magnifier.m.mag.style.display = '';

                                css(magnifier.m.img, {
                                    'top': -(parseInt(this.getElementsByTagName('div')[0].style.top) * magnifier.m.scale) + 'px',
                                    'left': -(parseInt(this.getElementsByTagName('div')[0].style.left) * magnifier.m.scale) + 'px'
                                })

                            },

                            end: function (e) {
                                this.getElementsByTagName('div')[0].style.display = 'none';
                                magnifier.removeIframe(magnifier.m.img);        //销毁iframe 

                                magnifier.m.mag.style.display = 'none';
                            },

                            createIframe: function (elem) {
                                var layer = document.createElement('iframe');
                                layer.tabIndex = '-1';
                                layer.src = 'javascript:false;';
                                elem.parentNode.appendChild(layer);

                                layer.style.width = elem.offsetWidth + 'px';
                                layer.style.height = elem.offsetHeight + 'px';
                            },

                            removeIframe: function (elem) {
                                var layers = elem.parentNode.getElementsByTagName('iframe');
                                while (layers.length > 0) {
                                    layers[0].parentNode.removeChild(layers[0]);
                                }
                            }
                        }
                        window.onload = function () {
                            magnifier.init({
                                cont: document.getElementById('magnifier'),
                                img: document.getElementById('magnifierImg'),
                                mag: document.getElementById('mag'),
                                scale: 3
                            });
                        }
                    </script> 
                    </div><%--图片--%>
                    <div id="mess" style="font-family: 微软雅黑; font-weight: 600; margin-left: 59px;">
                        商品名称：
                        <asp:Label ID="gName" runat="server" Text=""></asp:Label><br /><br />
                        价格：
                        <asp:Label ID="money" runat="server" Text=""></asp:Label><br /><br />
                        联系人电话:
                        <asp:Label ID="tel" runat="server" Text=""></asp:Label><br /><br />
                        详细描述：
                        <asp:Label ID="Mes" runat="server" Text=""></asp:Label><br /><br />
                    </div><%--信息--%>
                </div><%--商品信息--%>
                <div id="goodsnotes">
                        <asp:TextBox ID="Message" runat="server" Height="40px" style="margin-top: 37px; margin-left: 80px;" Width="530px"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="留言" style="margin-left: 60px; margin-top: 0px;" Width="70px" OnClick="Button1_Click" Height="25px" />
                        <br /><br /><br />
                    <table style="font-family: 造字工房尚黑（非商用）特细体; font-weight: 900; color: #FFFFFF; text-align:center;">
                        <td class="notesName">留言者用户名</td>
                        <td class="notesContent">留言内容</td>
                        <td class="notesTime">留言日期</td>
                    </table><%--留言标题--%>
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns ="1" ShowHeader="false"  Height="256px" Width="880px" >
                        <ItemStyle/>
                        <ItemTemplate>
                           <table>
                               <tr>
                                <div class="notesName" style="float:left; font-family: 微软雅黑;text-align:center;color: #FFFFFF;" ><%# DataBinder .Eval (Container.DataItem ,"Username") %></div>
                                <div class="notesContent" style="float:left;font-family: 微软雅黑;">&nbsp;&nbsp;&nbsp;&nbsp;<%# DataBinder .Eval (Container.DataItem ,"mescontent") %></div>
                                <div class="notesTime" style="float:left;font-family: 微软雅黑; text-align:center; color: #FFFFFF;"><%# DataBinder .Eval (Container.DataItem ,"mestime") %></div>
                            </tr></table><%--留言内容--%>
                        </ItemTemplate>
                        </asp:DataList>
                    <div>
                        <table id="page" width="100%">
                            <tr align="center">
                                <td class="auto-style1">
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
                    </div><%--下一页--%>
                </div><%--留言信息--%>
            </div>
            <div id="foot" style="text-align:center; ">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Admin.aspx">管理员请登陆</asp:HyperLink>
                <br />
                <pre>校园二手交易平台        版权所有 B组        </pre>
            </div>
        </div>
    </form>
    <div id="magnifier">
        <asp:Image ID="Image1" runat="server" Height="315px" Width="377px"  ImageUrl="~" style="margin-left: 0px"/>
        <div id="Browser">

        </div> 
    </div> 
    <div id="mag">
        <img id="magnifierImg" />
    </div>
    <div id="QuacorGrading" style="position:absolute;top:550px; left:250px"><strong>评分</strong>
      <input name="1" type="button" />
            <input name="2" type="button" />
            <input name="3" type="button" />
            <input name="4" type="button" />
            <input name="5" type="button" />
            <input name="6" type="button" />
            <input name="7" type="button" />
            <input name="8" type="button" />
            <input name="9" type="button" />
            <input name="10" type="button" />
            <span id="QuacorGradingValue"><b>
                <font size="5" color="#fd7d28">6.5</font></b>分</span>
        </div>
        <script type="text/javascript">
            var GradList = document.getElementById("QuacorGrading").getElementsByTagName("input");
            for (var di = 0; di < parseInt(document.getElementById("QuacorGradingValue").getElementsByTagName("font")[0].innerHTML) ; di++) { GradList[di].style.backgroundPosition = 'left center'; }
            for (var i = 0; i < GradList.length; i++) {
                GradList[i].onmouseover = function () {
                    for (var Qi = 0; Qi < GradList.length; Qi++) {
                        GradList[Qi].style.backgroundPosition = 'right center';
                    }
                    for (var Qii = 0; Qii < this.name; Qii++) {
                        GradList[Qii].style.backgroundPosition = 'left center';
                    }
                    //alert(GradList.length);
                    document.getElementById("QuacorGradingValue").innerHTML = '<b><font size="5" color="#fd7d28">' + this.name + '</font></b>分';
                }
            }
        </script>
</body>
</html>