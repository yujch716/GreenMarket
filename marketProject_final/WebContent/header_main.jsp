<%@page import="cartVO.CartVO"%>
<%@page import="java.util.ArrayList"%>
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

<script>
$(function(){
	var soo=[1,2,3,4]; //value를 처리하기 위해 배열처리. index는 0부터, value는 배열 1부터
	$.each(soo,function(index,value){ 
		$('#mypage'+value).click(function(){ 	 /* 클릭했을 때 */
			if($('#mymenu'+value).is(':hidden')) /* display:none이면 */
					$('#mymenu'+value).show();	 /* 보여주기 */
			else
					$('#mymenu'+value).hide();	 /* 아니면 숨기기 */
		});	//click-end
	}); //each-end
}); //f-end
</script>


<script>
//search product	//located  down here..

function searchBtn() {
	var stext = $("#input").val();//sinput(input text)에서  받아온 값으로  //jQuery..
	location.href = "searchProduct.do?search="+stext;//검색!//search!!//한글 ㅠ 
}
</script>

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
<style>

a { text-decoration : none; }

table { border : 0;
		padding : 10px; }
		
.textbox {position: relative;}

.textbox label { position: absolute; 
				 top: 1px; /* input 요소의 border-top 설정값 만큼 */ 
				 left: 1px; /* input 요소의 border-left 설정값 만큼 */ 
				 padding: .5em .5em; /* input 요소의 padding 값 만큼 */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 90%; /* 원하는 너비 설정 */ 
								  height: auto; /* 높이값 초기화 */ 
								  line-height : normal; /* line-height 초기화 */ 
								  padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */ 
								  font-family: inherit; /* 폰트 상속 */ 
								  border: 1px solid #999; 
								  border-radius: 0; /* iSO 둥근모서리 제거 */ 
								  outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */ 
								  -webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */ 
								  -moz-appearance: none; 
								  appearance: none; }		
</style>

</head>
<body>
<div align="center"><br><br>
<table>
<tr><td width="200" align="left"><a href="mainPage.jsp"><img src="./img/logo.gif"></a></td>
	<td width="30" align="left"><img src="./img/search.png" id="searchBtn" onclick="searchBtn();"></td>
	<td width="600" align="left">					<!-- search 이미지 클릭 (id=searchBtn) -->
		<div class="textbox">
		<input type="text"  id="input" name="search" placeholder="검색">
		</div>			<!-- id = for getElementById -->
		</td>
	
	<c:if test="${sessionScope.log eq null }">
	<td width="130" align="right"><a href="joinPage.jsp"><img src="./img/header_join.gif"></a></td>
	<td width="100" align="right"><a href="loginPage.jsp"><img src="./img/header_login.gif"></a></td>
	</c:if>
	
	
	<c:if test="${sessionScope.log != null }">
	<td width="130" align="right"><div id="mypage1"><img src="./img/header_my.gif"></div></td>
	<td width="100" align="right"><a href="logout.do"><img src="./img/header_logout.gif"></a></td>

	<tr><td></td><td></td><td></td> <!-- toggle 메뉴 위치 고정을 위한 td -->

	<td colspan=2>
	<div id="mymenu1" style="display:none">
	<img src="./img/toggle.gif" alt="" usemap="#map1">
	<map name="map1" id="map1">
	<!-- 회원정보 -->
	<area shape="rect" coords="27,15,113,43" href="memSearchOne.do?name=${sessionScope.log.getId()}" alt=""> 
	<!-- 장바구니 -->
	<area shape="rect" coords="27,44,113,72" onclick="cart();" alt="">
	<!-- 회원탈퇴 -->
	<area shape="rect" coords="27,76,113,103" onclick="showAlert();" alt="">
	</map>
	</div>
	
	</c:if>
	
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


</table>
</div>


<script src="./js/jquery-3.6.0.js"></script>
<%
request.setCharacterEncoding("euc-kr");//한글 인코딩
response.setCharacterEncoding("euc-kr");//인자 한글시 안터짐
%>


</body>
</html>