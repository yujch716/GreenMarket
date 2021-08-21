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
<!-- 폼 시작 -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_main.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_cate.jsp"/></td>
	<td>
	
	<!-- .jsp 내용 시작 -->
	
	
			<h1>${param.cate1} 검색 결과</h1>
			
			
			<c:forEach var="cate2" items="${cate}">
				<table align="left">
					<tr><th ><img src="${cate2.pro_uri }" width="130" height="130"/></th></tr>
					<tr><th>${cate2.pro_name}</th></tr>
					<tr><th>가격 : ${cate2.pro_price}원</th></tr>
					<tr><th><a href="detail.do?cate2=${cate2.pro_name}">상세보기</a></th></tr>
				</table>
			</c:forEach>
			
	

	
	<!-- .jsp 내용 종료 -->
	
	</td>
</table>
</div>
<!-- 폼 종료 -->
</body>
</html>