<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã��</title>

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
				 
.textbox input[type="text"] { width: 100%; /* ���ϴ� �ʺ� ���� */ 
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
<div align="center">
<h3>���̵� ã��</h3>
<form action="id_search.do" method="get">
   <table width="300">
      <tr>
         <td>�̸�</td>
         <td><div class="textbox"><input type="text" id="input" name="search_name" placeholder="Name" /></div></td>
      </tr>
      <tr> 
         <td>��ȭ��ȣ</td>
         <td><div class="textbox"><input type="text" id="input" name="search_tel" placeholder="010-0000-0000" /></div></td>
      </tr>
      <tr><td><br></td></tr><!-- ���� -->
      <tr>
         <td colspan="2" align="center"><input type="submit" value="���̵� ã��" /></td>
      </tr>
   </table>
</form>
</div>
</body>
</html>