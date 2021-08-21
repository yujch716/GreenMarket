<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }

</style>
</head>
<body>
<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_main.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_cate.jsp"/></td>
	<td>
	
	<!-- .jsp ���� ���� -->
	
	
			<h1>${param.cate1} �˻� ���</h1>
			
			
			<c:forEach var="cate2" items="${cate}">
				<table align="left">
					<tr><th ><img src="${cate2.pro_uri }" width="130" height="130"/></th></tr>
					<tr><th>${cate2.pro_name}</th></tr>
					<tr><th>���� : ${cate2.pro_price}��</th></tr>
					<tr><th><a href="detail.do?cate2=${cate2.pro_name}">�󼼺���</a></th></tr>
				</table>
			</c:forEach>
			
	

	
	<!-- .jsp ���� ���� -->
	
	</td>
</table>
</div>
<!-- �� ���� -->
</body>
</html>