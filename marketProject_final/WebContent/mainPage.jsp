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
		padding : 10px; }

</style>
</head>
<body>
<!-- �� ���� -->
<div align=center>
<table width="1200">
<tr><td><jsp:include page="header_main.jsp"/></td></tr>
<tr><td>
	
	<!-- .jsp ���� ���� -->

<br><br><br>
<table align="center">
	<tr>
		<td style="padding:20px;"><a href="view_cate.do?cate1=fresh"> <img width="200" height="200" src="pro_image/main/main_fresh.jpg"></a></td>		<!-- �ż���ǰimg -->
		<td style="padding:20px;"><a href="view_cate.do?cate1=gagong"><img width="200" height="200" src="pro_image/main/main_gagong.jpg"></a></td>	<!-- ������ǰimg -->
		<td style="padding:20px;"><a href="view_cate.do?cate1=milk"><img width="200" height="200" src="pro_image/main/main_milk.jpg"></a></td>			<!-- ����ǰimg -->
		<td style="padding:20px;"><a href="view_cate.do?cate1=bakery"><img width="200" height="200" src="pro_image/main/main_bakery.jpg"></a></td>		<!-- ����Ŀ��img -->
	</tr>	
	<tr>
		<td style="padding-left: 20px;"><img src="img/cate1.gif"></td><!-- �ż���ǰ -->
		<td style="padding-left: 20px;"><img src="img/cate2.gif"></td><!-- ������ǰ -->
		<td style="padding-left: 20px;"><img src="img/cate3.gif"></td><!-- ����ǰ/���� -->
		<td style="padding-left: 20px;"><img src="img/cate4.gif"></td><!-- ����Ŀ�� -->
	</tr> 

</table>

<!-- .jsp ���� ���� -->
	
	</td>
</table>
</div>
<!-- �� ���� -->

</body>
</html>