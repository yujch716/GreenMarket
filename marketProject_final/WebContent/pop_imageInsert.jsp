<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ�̹������</title>

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
								  
.td1 { width: 100px; }	

</style>


</head>
<body>
<div align="center">
<br>
	<h3>��ǰ �̹��� ���</h3>
<form action="uploadImage.jsp" method="post" enctype="multipart/form-data">
	<table align="center">
	<tr><td class="td1">�̹��� �̸�</td>
		<td><div class="textbox"><input type="text" id="input" name="pro_imagename" /></div></td>
	</tr>
	<tr><td style="padding:5px"></td></tr>
	<tr><td class="td1">�̹��� ����</td>
		<td><div class="textbox"><input type="file" id="input" name="imagefile" /></div></td>
	</tr>	
	
	<tr><td colspan="2" align="center" style="padding:15px">
			<input type="submit" value="�߰�" />
			<input type="reset" value="���" /></td>
	</tr>
	</table>
</form>
</div>
</body>
</html>