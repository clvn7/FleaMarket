<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="Account_AdminDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>后台管理</title>
</head>
<body style="margin:0; padding:0;font-size:13px">
    <form id="form1" runat="server">
    <div>
    <h3>后台管理</h3>
        <asp:HyperLink ID="HyperLink1" runat="server" >返回首页</asp:HyperLink>

    <div style="width:100%; height:500px" >
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15"  HeaderStyle-BackColor="#DEE8F4" HeaderStyle-BorderColor="#9FB6D5" BorderStyle="Solid" BorderColor="#A1B6D5" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" Height="474px" Width="868px" >
            <Columns>
            <asp:BoundField HeaderText="商品id" DataField="goodsid"/>
        <asp:BoundField HeaderText="商品名称" DataField="goodsname"/>
        <asp:BoundField HeaderText="商品价格" DataField="goodsprice" />
        <asp:BoundField HeaderText="分类" DataField="goodssort" />
                <asp:BoundField HeaderText="联系人" DataField="connectpeople" />
        <asp:BoundField HeaderText="电话" DataField="phone" />
        <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="删除" HeaderText="操作" />
    </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

    </div>
    </div>
    </form>
</body>
</html>
