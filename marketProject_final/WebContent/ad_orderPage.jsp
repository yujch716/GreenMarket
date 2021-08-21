<%@page import="orderDAO.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }

th { border-bottom: 1px solid #444444;
	 padding: 10px;
     text-align: center; }
     
.f1 { text-align : left;
	    font-weight: bold;
	    font-size: 18px; }
     
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
<tr><td colspan=2><jsp:include page="header_ad.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_ad.jsp"/></td>
	<td width="1000" valign="top">
	<br>
	<img src="./img/ad_order_cate.gif">
	<!-- .jsp ���� ���� -->

	 	
	 	<c:forEach var="order" items="${orArr}">
	 		<br /> <h3> ${order.id }���� �ֹ����� </h3><br />
	 		<table style="width: 60%;">
	 			<tr><td>${order.order }</td></tr>
	 		</table> <br /><br />
	 		
	 		<div class="f1">�����ݾ� : ${order.total }��  / ������� : 
	 		<c:if test="${order.process == 0 }">
	 		��ǰ�غ��� <input type="button" value="��۽���" 
	 		onclick="window.open('process.jsp?name=${order.id}&','����','width=0, height=0')"/> </div><br />
	 		</c:if>
	 		<c:if test="${order.process == 1 }">
	 		��ۿϷ� <br />
	 		</c:if>
	 	</c:forEach>
	 		
<!-- .jsp ���� ���� -->	 	
        
    </td>
	</tr>
</table>
</div>
<!-- �� ���� -->
 
</body>
</html>