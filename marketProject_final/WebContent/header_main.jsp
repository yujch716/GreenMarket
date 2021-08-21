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
	var soo=[1,2,3,4]; //value�� ó���ϱ� ���� �迭ó��. index�� 0����, value�� �迭 1����
	$.each(soo,function(index,value){ 
		$('#mypage'+value).click(function(){ 	 /* Ŭ������ �� */
			if($('#mymenu'+value).is(':hidden')) /* display:none�̸� */
					$('#mymenu'+value).show();	 /* �����ֱ� */
			else
					$('#mymenu'+value).hide();	 /* �ƴϸ� ����� */
		});	//click-end
	}); //each-end
}); //f-end
</script>


<script>
//search product	//located  down here..

function searchBtn() {
	var stext = $("#input").val();//sinput(input text)����  �޾ƿ� ������  //jQuery..
	location.href = "searchProduct.do?search="+stext;//�˻�!//search!!//�ѱ� �� 
}
</script>

<script>  
   function showAlert(){
      if(confirm("ȸ���� Ż���Ͻðڽ��ϱ�?") == true){
    	  alert("Ż��Ǿ����ϴ�. \n����ȭ������ �̵��մϴ�.");
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
				 top: 1px; /* input ����� border-top ������ ��ŭ */ 
				 left: 1px; /* input ����� border-left ������ ��ŭ */ 
				 padding: .5em .5em; /* input ����� padding �� ��ŭ */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 90%; /* ���ϴ� �ʺ� ���� */ 
								  height: auto; /* ���̰� �ʱ�ȭ */ 
								  line-height : normal; /* line-height �ʱ�ȭ */ 
								  padding: .8em .5em; /* ���ϴ� ���� ����, ���ϴ� �������� ���̸� ���� */ 
								  font-family: inherit; /* ��Ʈ ��� */ 
								  border: 1px solid #999; 
								  border-radius: 0; /* iSO �ձٸ𼭸� ���� */ 
								  outline-style: none; /* ��Ŀ���� �߻��ϴ� ȿ�� ���Ÿ� ���Ѵٸ� */ 
								  -webkit-appearance: none; /* �������� �⺻ ��Ÿ�ϸ� ���� */ 
								  -moz-appearance: none; 
								  appearance: none; }		
</style>

</head>
<body>
<div align="center"><br><br>
<table>
<tr><td width="200" align="left"><a href="mainPage.jsp"><img src="./img/logo.gif"></a></td>
	<td width="30" align="left"><img src="./img/search.png" id="searchBtn" onclick="searchBtn();"></td>
	<td width="600" align="left">					<!-- search �̹��� Ŭ�� (id=searchBtn) -->
		<div class="textbox">
		<input type="text"  id="input" name="search" placeholder="�˻�">
		</div>			<!-- id = for getElementById -->
		</td>
	
	<c:if test="${sessionScope.log eq null }">
	<td width="130" align="right"><a href="joinPage.jsp"><img src="./img/header_join.gif"></a></td>
	<td width="100" align="right"><a href="loginPage.jsp"><img src="./img/header_login.gif"></a></td>
	</c:if>
	
	
	<c:if test="${sessionScope.log != null }">
	<td width="130" align="right"><div id="mypage1"><img src="./img/header_my.gif"></div></td>
	<td width="100" align="right"><a href="logout.do"><img src="./img/header_logout.gif"></a></td>

	<tr><td></td><td></td><td></td> <!-- toggle �޴� ��ġ ������ ���� td -->

	<td colspan=2>
	<div id="mymenu1" style="display:none">
	<img src="./img/toggle.gif" alt="" usemap="#map1">
	<map name="map1" id="map1">
	<!-- ȸ������ -->
	<area shape="rect" coords="27,15,113,43" href="memSearchOne.do?name=${sessionScope.log.getId()}" alt=""> 
	<!-- ��ٱ��� -->
	<area shape="rect" coords="27,44,113,72" onclick="cart();" alt="">
	<!-- ȸ��Ż�� -->
	<area shape="rect" coords="27,76,113,103" onclick="showAlert();" alt="">
	</map>
	</div>
	
	</c:if>
	
	<script>
		function cart() {
			var cart_session = '<%=(ArrayList<CartVO>)session.getAttribute("cart_session")%>';
			if (cart_session == "null"){
				alert('��ٱ��ϰ� ��� �ֽ��ϴ�');
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
request.setCharacterEncoding("euc-kr");//�ѱ� ���ڵ�
response.setCharacterEncoding("euc-kr");//���� �ѱ۽� ������
%>


</body>
</html>