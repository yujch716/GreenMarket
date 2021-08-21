<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<img src="./img/aside_my.gif" alt="" usemap="#map1">
<map name="map1" id="map1">
<area shape="rect" coords="45,108,172,183" href="memSearchOne.do?name=${applicationScope.app1}" alt=""> <!-- 회원정보 -->
<area shape="rect" coords="45,143,172,134" href="my_cartPage.jsp" alt=""> <!-- 장바구니 -->
<area shape="rect" coords="47,179,172,207" href="telDelete.do?name=${stv.name}" alt=""> <!-- 회원탈퇴 --></map>
</body>
</html>