<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				 top: 1px; /* input ����� border-top ������ ��ŭ */ 
				 left: 1px; /* input ����� border-left ������ ��ŭ */ 
				 padding: .5em .5em; /* input ����� padding �� ��ŭ */ 
				 color: #999; 
				 cursor: text; } 
				 
.textbox input[type="text"], 
.textbox input[type="password"] { width: 100%; /* ���ϴ� �ʺ� ���� */ 
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


<div align=center><br><br><br>
<a href="mainPage.jsp"><img src="./img/logo.gif"></a>

<br><br><br>
<h2>�α���</h2>


<form method="post" action="login.do">
    <table>
        <tr>
        	<td>���̵�</td>
            <td><div class="textbox"><input type="text" name="id" placeholder="ID" required></div></td>
        </tr>
        <tr>
        	<td>��й�ȣ</td>
            <td><div class="textbox"><input type="password" name="pw" placeholder="Password" required></div></td>
        </tr>
        <tr>
            <td><input type="submit" value="�α���">
            </td>
        </tr>
    </table>
</form>



</div>
</body>
</html>

