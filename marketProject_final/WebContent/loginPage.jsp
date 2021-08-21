<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>join</title>

<style>

a { text-decoration: none; }

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


<div align=center><br><br><br>
<a href="mainPage.jsp"><img src="./img/logo.gif"></a>

<br><br><br>
<h2>로그인</h2>


<form method="post" action="login.do">
    <table>
        <tr>
        	<td>아이디</td>
            <td><div class="textbox"><input type="text" name="id" placeholder="ID" required></div></td>
        </tr>
        <tr>
        	<td>비밀번호</td>
            <td><div class="textbox"><input type="password" name="pw" placeholder="Password" required></div></td>
        </tr>
        <tr><td><br></td></tr>
        <tr>
            <td colspan=2 align="center">
            <input type="submit" value="로그인">
            <button type="button" onclick="window.open('pop_searchID.jsp','아이디 찾기','width=500, height=300');">아이디 찾기</button>
			<button type="button" onclick="window.open('pop_searchPW.jsp','비밀번호 찾기','width=500, height=300');">비밀번호 찾기</button>
            </td>
        </tr>
    </table>
    
        
</form>


</div>
</body>
</html>

