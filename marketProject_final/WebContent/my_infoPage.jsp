<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지-회원정보</title>

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
<tr><td valign="top"><jsp:include page="aside_my.jsp"/></td>
	<td width="1000">
	
	<!-- .jsp 내용 시작 -->
	
			<br>
			<form action="memUpdate.do?name=${smv.name}" method="get">
			
			<h2>${smv.name}님의 회원정보</h2> <br />
			<table width="500">
			<tr>
				<td style="padding-bottom:5px"><b>아이디</b></td>
			</tr>
			<tr>
				<td style="padding-bottom:30px">${smv.id}</td>
			</tr>
			<tr>
				<td><b>비밀번호</b></td>
			</tr>
			<tr>
				<td style="padding-bottom:30px"><div class="textbox">
				<input type="password" value="${smv.pw}" name="pw" autofocus required placeholder="" />
				</div></td>
			</tr>
			<tr>
				<td><b>이름</b></td>
			</tr>
			<tr>
				<td style="padding-bottom:30px">${smv.name}</td>
			</tr>
			<tr>
				<td><b>전화번호</b></td>
			</tr>
			<tr>
				<td style="padding-bottom:30px"><div class="textbox">
				<input type="text" value="${smv.tel}" name="tel" /></div></td>
			</tr>
			<tr>
				<td><b>주소</b></td>
			</tr>
			<tr>
				<td style="padding-bottom:30px"><div class="textbox">
				<input type="text" value="${smv.addr}" name="addr" /></div></td>
			</tr>
			<tr><td><input type="hidden" value="${smv.name}" name="sname" /></td></tr>
			<tr><td><input type="submit" value="수정" />
					<input type="reset" value="취소" /></td></tr>
			</table>
		</form>
			



<!-- .jsp 내용 종료 -->
	
	</td>
	</tr>
</table>
</div>
<!-- 폼 종료 -->
</body>
</html>