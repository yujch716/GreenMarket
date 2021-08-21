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

<!-- 폼 시작 -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_ad.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_ad.jsp"/></td>
	<td width="1000" valign="top">
	<br>
	<img src="./img/ad_order_cate.gif">
	<!-- .jsp 내용 시작 -->

	 	
	 	<c:forEach var="order" items="${orArr}">
	 		<br /> <h3> ${order.id }님의 주문내역 </h3><br />
	 		<table style="width: 60%;">
	 			<tr><td>${order.order }</td></tr>
	 		</table> <br /><br />
	 		
	 		<div class="f1">결제금액 : ${order.total }원  / 현재상태 : 
	 		<c:if test="${order.process == 0 }">
	 		상품준비중 <input type="button" value="배송시작" 
	 		onclick="window.open('process.jsp?name=${order.id}&','수정','width=0, height=0')"/> </div><br />
	 		</c:if>
	 		<c:if test="${order.process == 1 }">
	 		배송완료 <br />
	 		</c:if>
	 	</c:forEach>
	 		
<!-- .jsp 내용 종료 -->	 	
        
    </td>
	</tr>
</table>
</div>
<!-- 폼 종료 -->
 
</body>
</html>