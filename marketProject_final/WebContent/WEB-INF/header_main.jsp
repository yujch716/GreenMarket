<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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
	<td width="30" align="left"><a href=#><img src="./img/search.png"></a></td>
	<td width="600" align="left">
		<div class="textbox">
		<input type="text"  id="input" name="search" placeholder="�˻�">
		</div>
	<td width="130" align="right"><a href="joinPage.jsp"><img src="./img/header_join.gif"></a></td>
	<td width="100" align="right"><a href="loginPage.jsp"><img src="./img/header_login.gif"></a></td></tr>
</table>
</div>
</body>
</html>