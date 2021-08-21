<%@page import="productDAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 재고 수정</title>
</head>
<body>
<div align="center">
	<%String name = request.getParameter("name"); %>
	<h3>상품 재고 수정</h3>
		<form action="change.do" method="get">
		<input type="number" min="0" name="num" placeholder="수량을 입력하세요"/> <br /> <br />
		<input type="hidden" name="name" value="<%=name %>" />
		<input type="submit" value="저장하기" />
		</form>
</div>
</body>
</html>