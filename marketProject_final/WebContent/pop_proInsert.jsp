<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ��ϰ���</title>
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
				 
.textbox input[type="text"] { width: 90%; /* ���ϴ� �ʺ� ���� */ 
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

.td1 { width: 30%; }								  
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>

<div align="center">
<br>
	<h3>��ǰ ���</h3>
	<form action="pro_insert.do" method="post">
	<table width="480" align="center">
		<tr>
		<td class="td1">��ǰ �̸�</td>
		<td><div class="textbox"><input type="text" id="input" name="pro_name" required/></div></td>
		</tr>
		<tr>
		<td>��ǰ ����</td>
		<td><div class="textbox"><input type="text" id="input" name="pro_price" required/></div></td>
		</tr>
		<tr>
		<td>�� ����</td>
		<td><div class="textbox"><input type="text" id="input"  name="pro_dec" required/></div></td>
		</tr>
		<tr>
		<td>��� ����</td>
		<td><div class="textbox"><input type="text" id="input"  name="pro_amount" required/></div></td>
		</tr>
		<tr>
		<td>��ǰ ī�װ�</td>
		<td><div class="textbox"><input type="text" id="input"  name="pro_cate"/></div></td>
		</tr>
		<tr>
		<td>��ǰ �̹��� ���</td>
		<td><div class="textbox"><input type="text" id="input" name="pro_uri" value="./pro_insert/"/></div></td>
		</tr>
		<tr>
		<td colspan=2 align="center" style="padding:15px">
			<button onclick="window.open('pop_imageInsert.jsp','�߰�','width=400, height=300')"> 
			��ǰ �̹��� �߰��ϱ�</button>
			</td>
		</tr>
		<tr>
			<td colspan=2 align="center">
				<input type="submit" value="�߰�" />
				<input type="reset" value="���" /></td>
		</tr>
	</table>

	</form>
</div>
</body>
</html>
