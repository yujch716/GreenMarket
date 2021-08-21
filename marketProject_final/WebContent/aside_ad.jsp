<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<img src="./img/aside_ad_.gif" alt="" usemap="#map2">
<map name="map2" id="map2">
<area shape="rect" coords="46,91,173,120" onclick="window.open('pop_proInsert.jsp','조회','width=500, height=500')" alt=""><!-- 상품등록관리 -->
<area shape="rect" coords="46,127,173,159" href="ad_mainPage.jsp" alt=""><!-- 상품재고조회 -->
<area shape="rect" coords="46,164,173,194," href="ad_member.do" alt=""><!-- 회원목록조회 -->
<area shape="rect" coords="46,201,173,230" href="ad_order.do" alt=""> <!-- 결제내역조회 -->
</map>

</body>
</html>
