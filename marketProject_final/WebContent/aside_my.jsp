<%@page import="memberVO.MemberVO"%>
<%@page import="cartVO.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script>  
   function showAlert(){
      if(confirm("회원을 탈퇴하시겠습니까?") == true){
    	  alert("탈퇴되었습니다. \n메인화면으로 이동합니다.");
    	  location.href="memDelete.do?del_id=${sessionScope.log.getId()}"; 
      }else{
         return;
      }
   }    
</script>


</head>
<body>
<img src="./img/aside_my.gif" alt="" usemap="#map2">
<map name="map2" id="map2">
<area shape="rect" coords="45,108,172,134" href="memSearchOne.do?name=${sessionScope.log.getId()}" alt=""> <!-- 회원정보 -->
<area shape="rect" coords="45,143,172,170" onclick="cart();" alt=""> <!-- 장바구니 -->
<area shape="rect" coords="45,179,172,207" onclick="showAlert();"> <!-- 회원탈퇴 -->
</map>
<script>
		function cart() {
			var cart_session = '<%=(ArrayList<CartVO>)session.getAttribute("cart_session")%>';
			if (cart_session == "null"){
				alert('장바구니가 비어 있습니다');
			}
			else {
				location.href='my_cartPage.jsp';
			}
		}
	</script>
</body>
</html>