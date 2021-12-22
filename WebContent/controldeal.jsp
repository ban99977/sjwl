<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{margin: 0px;padding: 0px;}
	td{border: 1px solid red;padding: 2px 0px;}
	table{border-collapse: collapse; margin: 0px auto;width:1024px;}
	table img{width: 100px;height: 100px;}
	#table1 td{border: 0px;}
	#header{background-color: green;color: white;font-weight: bold;text-align: center;line-height: 28px;}
	#header a{color: white; text-decoration: none;}
	.chb{text-align: center;}
	div{margin: 2% auto}
	caption{font-size: 20px;}
	</style>  
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function checkall(){
		var checkboxes=document.getElementsByName("chb");
		for(var i=0;i<checkboxes.length;i++){
			checkboxes[i].checked=document.getElementById("all").checked;
		}
	}
	$(document).ready(function(){
		$(".del").click(function(){
		return confirm("确定要删除吗？");	
		});
	});
</script>
</head>
  
  <body>
  <div>
   <form action="DealsServlet?opr=fuzzy" method="post">
     <table id="table1">
      	 <caption>订单信息查看</caption>
    	 <tr><td>货物编号:<input type="text" name="gid"/>&nbsp;&nbsp;<input type="submit" value="查询">&nbsp;&nbsp;</td></tr>
     </table>
     </form>
    <form action="DealsServlet?opr=mdel" method="post">
    <table>
  
    <tr id="header"><td><input type="checkbox" id="all" onclick="checkall()"/></td>
    <td>用户编号</td><td>商品编号</td><td>主图片</td><td>商品名称</td><td>商品款式</td><td>商品价格</td><td>购买数量</td><td>下单时间</td></tr>
    <c:forEach var="deals" items="${listdeal}" begin="0" end="${listdeal.size()}">
    <tr>
    	<td class="chb"><input type="checkbox" name="chb" value="${deals.getId()}"></td>
    	<td>${deals.getId()}</td><td>${deals.getGid()}</td>
    	<td><img src="img/${deals.getImg()}"/></td>
    	<td>${deals.getName()}</td><td>${deals.getType()}</td>
    	<td>${deals.getPrice()}</td><td>${deals.getNum()}</td>
    	<td>${deals.getTime()}</td>
    </tr>
    
   </c:forEach>
   <tr style="text-align: center;">
    <td colspan="5"><a href="UserServlets?opr=list">用户信息管理</a></td><td colspan="4"><a href="admin.jsp">管理首页</a></td></tr>
     </table>
     </form>
     
</div>
  </body>
</html>
