<%@page import="memberVO.MemberVO"%>
<%@page import="productVO.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품상세페이지</title>

<script type="text/javascript">
	
	function btn() {
		var session = '<%=(MemberVO)session.getAttribute("log")%>';
		if(session == "null"){ //로그인정보 받아오기
			alert('로그인이 필요한 페이지 입니다');
			window.location = 'loginPage.jsp';
		}else {
			var cart_name = '${requestScope.d_vo.pro_name}';
			var cart_amount = document.getElementById("amount").value;

			location.href='cart.do?cart_name='+cart_name+'&cart_amount='+cart_amount;
			
			
		}
	}
</script>

<style>

a { text-decoration: none; }

table { border : 0;
		padding : 10px;
		/* float : left; */
		 }

.textbox {position: relative;}

.textbox label { position: absolute; 
				 top: 1px; /* input 요소의 border-top 설정값 만큼 */ 
				 left: 1px; /* input 요소의 border-left 설정값 만큼 */ 
				 padding: .5em .5em; /* input 요소의 padding 값 만큼 */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 100%; /* 원하는 너비 설정 */ 
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
<%
request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");
%>



<!-- 폼 시작 -->
<div align=center>
<table width="1200">
<tr><td colspan=2><jsp:include page="header_main.jsp"/></td></tr>
<tr><td valign="top"><jsp:include page="aside_cate.jsp"/></td>
	<td width="1000">
	
	<!-- .jsp 내용 시작 -->
	
			<br><br>
			<table>
			<tr>
				<td rowspan="4" width="300"><!-- 상품이미지 uri -->
					<img src="${requestScope.d_vo.pro_uri }" width="200" height="200"/></td>
				<td style="width: 500;"><!-- 상품이름. 가격. 구매가능수량 -->
					<h2>${requestScope.d_vo.pro_name }<br>
					${requestScope.d_vo.pro_price }원</h2>
					</td>
			</tr>
			
			<tr>
				<td style="padding-bottom:10px"><b>( 구매가능수량 : ${requestScope.d_vo.pro_amount }개 )</b></td>
			</tr>
			
			<tr><td style="padding-bottom:10px"><!-- 구매수량입력폼 -->
				<div class="textbox"><input type="text" name="amount" id="amount" placeholder="수량을 입력하세요"/>
				</div></td>
			</tr>
			
			<tr>
				<td><input type="button" value="장바구니에 담기" onclick="btn()"/></td>
				
			</tr>
			
			<tr>
				<td colspan="2">
							<!-- 상세이미지 넣는 부분 
								필요시 테이블 생성-->
						<br /><br />${requestScope.d_vo.pro_dec }
								
				</td><!--상품 상세설명 불러오는 부분  -->
			</tr>
			
			</table>
			
			
<!-- .jsp 내용 종료 -->
	
	</td>
	</tr>
</table>
</div>
<!-- 폼 종료 -->
</body>
</html>