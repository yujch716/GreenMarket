<%@page import="cartVO.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����������-��ٱ���</title>

<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }
		 
th { border-bottom: 1px solid #444444;
	 padding: 10px;
     text-align: center; }
     
.td1 { border-bottom: 1px solid #444444;
	 padding: 10px;
     text-align: center; }
     
.pay1 { text-align : left;
	    font-weight: bold;
	    font-size: 18px; }	
	   	
.pay2 { text-align : left;
	    font-weight: bold;
	    font-size: 24px; }
</style>

</head>
<body>
<%
request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");
%>

<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_main.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_my.jsp"/></td>
	<td width="1000" valign="top">
	
	<!-- .jsp ���� ���� -->
	
		
			<br>
			<h2>${sessionScope.log.getName() }���� ��ٱ���</h2>
			<br>
			<table  style="width:100%; border: 2px solid #444444; padding:20px; border-collapse: collapse; text-align:center;">
				<tr align="center">
					<th>��ǰ��</th>
					<th>����</th>
					<th>����</th>
					<th>��ǰ��������</th>
				<% int sum = 0; int delivery = 0;%>	
				</tr>
				<%	ArrayList<CartVO> cart_arr = (ArrayList<CartVO>)session.getAttribute("cart_session"); 
					for(CartVO tmp : cart_arr){%>
				<tr align="center">
					<td class="td1"><%=tmp.getCart_pvo().getPro_name() %>(<%=tmp.getCart_pvo().getPro_price()%>��)</td>
					<td class="td1"><%=tmp.getCart_amount() %>��</td>
					<td class="td1"><%=tmp.getCart_amount() * tmp.getCart_pvo().getPro_price() %>��</td>
					<td class="td1"><button type="button" id="pro_remove" 
					onclick="location.href='cart_remove.do?cart_rm=<%=tmp.getCart_pvo().getPro_name()%>'">����</button></td>
				<% sum += tmp.getCart_amount() * tmp.getCart_pvo().getPro_price(); 
					if (sum >= 30000) delivery = 0;
					else delivery = 3000;
					
				%>
				</tr>
				<%}%>
				
			</table>
			
			
			
			<br>
			<table style="width:100%">
			<tr>
				<td><div class="pay1">�����Ͻ� ��ǰ�� �ݾ��� <%=sum %>�� + ��ۺ� <%=delivery %>��</div></td>
			</tr>
			<tr>
				<td><div class="pay2">�� ���� �ݾ��� <%=sum + delivery%>�� �Դϴ�.</div></td>
			</tr>
			</table>
			
			<table>
				<tr>
				<td><button type="button" onclick="location.href='cart_removeAll.do'">��ٱ��� ��ü ����</button></td>
				<td>
				<form action="pay.do" method="post">
					<input type="hidden" value="<%=sum+delivery %>" name="price" />
					<input type="submit" value="�����ϱ�"/>
				</form>
				</td>
				</tr>
			</table>


<!-- .jsp ���� ���� -->
	
	</td>
	</tr>
</table>
</div>
<!-- �� ���� -->

</body>
</html>