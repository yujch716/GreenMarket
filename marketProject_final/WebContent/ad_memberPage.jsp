
<%@page import="memberVO.MemberVO"%>
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
     
</style>

</head>
<body>
<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_ad.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_ad.jsp"/></td>
	<td width="1000" valign="top">
	<br>
	<img src="./img/ad_mem_cate.gif"><br><br>
	<!-- .jsp ���� ���� -->
	
	 	<table style="width:90%; border: 1px solid #444444; border-collapse: collapse; text-align:center;">
	 		<tr>
	 			<th>���̵�</th><th>�̸�</th><th>��ȭ��ȣ</th><th>�ּ�</th>
	 		</tr> 	
	 		<c:forEach var="member" items="${mArr}">
	 		<tr>
	 			<td style="padding:10px;">${member.id }</td>
	 			<td>${member.name }</td>
	 			<td>${member.tel }</td>
	 			<td>${member.addr }</td>
	 		</tr>
	 		</c:forEach>
	 	</table>
	 	
	 	
	 <!-- .jsp ���� ���� -->
	
	</td>
	</tr>
</table>
</div>
<!-- �� ���� -->
 
</body>
</html>