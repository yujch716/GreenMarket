<%@page import="productDAO.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ��� ����</title>
</head>
<body>
<div align="center">
	<%String name = request.getParameter("name"); %>
	<h3>��ǰ ��� ����</h3>
		<form action="change.do" method="get">
		<input type="number" min="0" name="num" placeholder="������ �Է��ϼ���"/> <br /> <br />
		<input type="hidden" name="name" value="<%=name %>" />
		<input type="submit" value="�����ϱ�" />
		</form>
</div>
</body>
</html>